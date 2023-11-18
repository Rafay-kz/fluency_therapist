import 'dart:io';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_storage/firebase_storage.dart';
import 'package:fluency_therapist/core/database.dart';
import 'package:fluency_therapist/utils/user_session.dart';
import 'package:get/get.dart';
import '../model/doctor_model.dart';
import '../model/user_model.dart';
import '../model/videos_model.dart';

class VideoServices {
  RxList<String> videoUrls = <String>[].obs;
  RxList<String> completedVideos = <String>[].obs;
  RxDouble overallProgress = 0.0.obs;
  RxInt unlockedVideoIndex = 0.obs;
  RxBool isPlaying = false.obs;
  UserSession userSession = UserSession();
  Rx<UserModel> userModel = UserModel
      .empty()
      .obs;
  Rx<DoctorModel> doctorModel = DoctorModel
      .empty()
      .obs;
  Database database = Database();
  FirebaseFirestore firestore = FirebaseFirestore.instance;

  Future<void> getUserInfo() async {
    userModel.value = await userSession.getUserInformation();
  }

  Future<void> checkAndUploadMetadata(String folderPath) async {
    try {
      String folderName = folderPath
          .split('/')
          .last;

      // Check if metadata already exists in Firestore
      QuerySnapshot metadataQuery = await FirebaseFirestore.instance
          .collection('videos')
          .doc(folderName)
          .collection('metadata')
          .get();

      // If metadata does not exist, upload it
      if (metadataQuery.docs.isEmpty) {
        await uploadMetadataForVideosInFolder(folderPath);
      }
    } catch (e) {
      print('Error checking/updating metadata: $e');
    }
  }

  Future<void> uploadMetadataForVideosInFolder(String folderPath) async {
    try {
      // Get a reference to the folder in Firebase Storage
      Reference storageFolderReference =
      FirebaseStorage.instance.ref().child(folderPath);

      // List the items (videos) in the folder
      ListResult result = await storageFolderReference.list();

      // Get the folder name from the path
      String folderName = folderPath
          .split('/')
          .last;

      // Create a Firestore reference for the main 'videos' collection
      CollectionReference videosCollection =
      FirebaseFirestore.instance.collection('videos');

      // Create a reference for the specific folder's subcollection
      CollectionReference folderCollection =
      videosCollection.doc(folderName).collection('metadata');

      // Iterate through each video in the folder
      for (Reference videoReference in result.items) {
        // Get the download URL of the video
        String videoUrl = await videoReference.getDownloadURL();

        // Extract video title from the video's name (you can adjust this based on your naming convention)
        String videoTitle =
            videoReference.name
                .split('/')
                .last
                .split('.')
                .first;

        // Store video metadata in the subcollection
        await folderCollection.add({
          'url': videoUrl,
          'title': videoTitle,
          'timestamp': FieldValue.serverTimestamp(),
          // Add any other metadata fields you need
        });

        print('Metadata for $videoTitle stored successfully!');
      }
    } catch (e) {
      print('Error uploading video metadata: $e');
    }
  }

  Future<void> uploadVideos(String folderName, List<String> kidsVideos,
      List<String> fluencyVideos, List<String> speechDisorderVideos) async {
    final storage = FirebaseStorage.instance;
    final firestore = FirebaseFirestore.instance;
    final storageRef = storage.ref().child('videos/$folderName');

    Future<void> _uploadAndStore(String subfolder, String videoPath) async {
      final videoFile = File(videoPath);
      final videoName = videoFile.path
          .split('/')
          .last;
      final videoReference = storageRef.child('$subfolder/$videoName');
      await videoReference.putFile(videoFile);

      final downloadUrl = await videoReference.getDownloadURL();
      final videoModel = VideosModel(
        name: videoName,
        category: subfolder,
        url: downloadUrl,
      );

      await firestore.collection('videos').add(videoModel.toJson());
    }

    for (final videoPath in kidsVideos) {
      await _uploadAndStore('Exercises for Kids', videoPath);
    }

    for (final videoPath in fluencyVideos) {
      await _uploadAndStore('Fluency Exercises for Clear Speak', videoPath);
    }

    for (final videoPath in speechDisorderVideos) {
      await _uploadAndStore('Speech Disorder in Children', videoPath);
    }
  }

  Future<void> fetchMetadataForFolder(String folderName) async {
    try {
      // Create a reference for the specific folder's subcollection
      CollectionReference folderCollection = FirebaseFirestore.instance
          .collection('videos')
          .doc(folderName)
          .collection('metadata');

      // Get all documents from the subcollection
      QuerySnapshot querySnapshot = await folderCollection.get();

      // Clear the existing videoUrls list
      videoUrls.clear();

      // Iterate through the documents
      querySnapshot.docs.forEach((doc) {
        // Access the data in each document
        Map<String, dynamic> data = doc.data() as Map<String, dynamic>;

        // Extract the URL from the data and add it to the videoUrls list
        if (data.containsKey('url')) {
          videoUrls.add(data['url'] as String);
        }
      });
    } catch (e) {
      print('Error fetching metadata: $e');
    }
  }

  // Inside VideoServices class

  Future<void> unlockNextVideo(String userId, String exerciseName) async {
    int videoCount = await getVideoCountForFolder(exerciseName);
    int unlockedIndex = await database.loadUnlockedVideoIndex(userId, exerciseName) ?? 0;

    print('Before unlocking $exerciseName - Unlocked Index: $unlockedIndex, Video Count: $videoCount');

    if (unlockedIndex < videoCount - 1) {
      unlockedIndex++;
      print('After unlocking $exerciseName - New Unlocked Index: $unlockedIndex');
      await database.saveUnlockedVideoIndex(userId, unlockedIndex, exerciseName);
      print('$exerciseName Video unlocked: $unlockedIndex');
    } else {
      print('$exerciseName Video already at maximum unlocked index');
    }
  }

  Future<void> onVideoComplete(String userId, String exerciseName) async {
    int videoCount = await getVideoCountForFolder(exerciseName);
    int unlockedIndex = await database.loadUnlockedVideoIndex(userId, exerciseName) ?? 0;

    print('Before completion of $exerciseName - Unlocked Index: $unlockedIndex, Video Count: $videoCount');

    if (unlockedIndex < videoCount - 1) {
      unlockedIndex++;
      isPlaying.value = true;
      print('After completion of $exerciseName - New Unlocked Index: $unlockedIndex');
      await database.saveUnlockedVideoIndex(userId, unlockedIndex, exerciseName);
      print('$exerciseName Video complete. Playing next: $unlockedIndex');
    } else {
      print('$exerciseName Video already at maximum unlocked index');
    }
  }


  Future<void> loadUnlockedVideoIndex(String userId, String exerciseName) async {
    int? savedIndex = await database.loadUnlockedVideoIndex(userId, exerciseName);
    if (savedIndex != null) {
      unlockedVideoIndex.value = savedIndex;
    }
  }


  Future<int> getVideoCountForFolder(String folderName) async {
    try {
      QuerySnapshot folderSnapshot = await firestore
          .collection('videos')
          .doc(folderName)
          .collection('metadata')
          .get();

      int count = folderSnapshot
          .size; // Get the count of documents in the folder

      return count;
    } catch (e) {
      print('Error getting video counts for $folderName: $e');
      return 0;
    }
  }


  Future<double> calculateUserProgress(String userId, String folderName) async {
    try {
      DocumentSnapshot userSnapshot =
      await firestore.collection('users').doc(userId).get();

      if (userSnapshot.exists) {
        int videoCount = await getVideoCountForFolder(folderName);
        print('Video Count for $folderName: $videoCount'); // Add this line

        int userVideoIndex = 1;
        Map<String, dynamic>? userData =
        userSnapshot.data() as Map<String, dynamic>?;

        if (userData != null && userData.containsKey('unlockedVideoIndex')) {
          userVideoIndex = userData['unlockedVideoIndex'] as int;
          print('User Video Index: $userVideoIndex'); // Add this line
        }

        double percentageProgress = userVideoIndex / videoCount * 100;
        print('Percentage Progress: $percentageProgress'); // Add this line

        return percentageProgress;
      } else {
        throw Exception('User document does not exist');
      }
    } catch (e) {
      print('Error calculating user progress: $e');
      return 0.0;
    }
  }
}