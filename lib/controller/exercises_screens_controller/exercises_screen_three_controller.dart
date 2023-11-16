import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_storage/firebase_storage.dart';
import 'package:get/get.dart';
import 'package:firebase_storage/firebase_storage.dart' as firebase_storage;

import '../../../custom widgets/progress_indicator.dart';
import '../../../model/user_model.dart';
import '../../../utils/user_session.dart';
import '../../model/doctor_model.dart';

class ExercisesScreenThreeController extends GetxController {
  UserSession userSession = UserSession();
  Rx<UserModel> userModel = UserModel.empty().obs;
  Rx<DoctorModel> doctorModel = DoctorModel.empty().obs;
  ProgressDialog progressDialog = ProgressDialog(); // Add this line
  RxInt unlockedVideoIndex = 0.obs;
  RxBool isPlaying = false.obs; // Track the unlocked video index

  @override
  void onInit() async{
    getUserInfo();
    getDoctorInfo();
    await fetchMetadataForFolder('Speech Disorders in Children');
    super.onInit();
  }

  Future<void> getUserInfo() async {
    userModel.value = await userSession.getUserInformation();
  }

  RxList<String> videoUrls = <String>[].obs;

  Future<void> fetchMetadataForFolder(String folderName) async {
    try {
      // Create a reference for the specific folder's subcollection
      CollectionReference folderCollection = FirebaseFirestore.instance.collection('videos').doc(folderName).collection('metadata');

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

  // Function to unlock the next video
  void unlockNextVideo() {
    if (unlockedVideoIndex < videoUrls.length - 1) {
      unlockedVideoIndex++;
    }
  }

  void onVideoComplete() {
    if (unlockedVideoIndex < videoUrls.length - 1) {
      unlockedVideoIndex++;
      isPlaying.value = true; // Set playing state to true for next video
    }
  }
  Future<void> getDoctorInfo() async {
    doctorModel.value = await userSession.getDoctorInformation();
  }

}
