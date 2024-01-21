import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:get/get.dart';

import '../../../model/doctor_model.dart';
import '../../../model/user_model.dart';
import '../../../utils/user_session.dart';
import '../../../utils/video_services.dart';

class SpeechExercisesScreenController extends GetxController {
  final VideoServices videoServices = VideoServices();
  RxString doctorImageUrl = ''.obs;
  RxString userModelImageUrl = ''.obs;

  UserSession userSession = UserSession();
  Rx<DoctorModel> doctorModel = DoctorModel.empty().obs;
  Rx<UserModel> userModel = UserModel.empty().obs;
  List<String> folderNames = [
    'Exercises for kids',
    'Fluency exercises for clear speak',
    'Speech Disorders in Children'
  ];
  late int index;

  RxDouble overallProgress = 0.0.obs;

  @override
  void onInit() async {
    await getUserInfo();
    getDoctorInfo();
    await checkAndUploadMetadata('/videos/exercises/Exercises for kids');
    await checkAndUploadMetadata(
        '/videos/exercises/Fluency exercises for clear speak');
    await checkAndUploadMetadata(
        '/videos/exercises/Speech Disorders in Children');
    await calculateAndDisplayProgress();
    overallProgress.value =
        await calculateOverallProgress(userModel.value.id, folderNames);
    super.onInit();
  }

  Future<void> getUserInfo() async {
    userModel.value = await userSession.getUserInformation();
    userModelImageUrl.value = userModel.value.image;
  }

  Future<void> getDoctorInfo() async {
    doctorModel.value = await userSession.getDoctorInformation();
    doctorImageUrl.value = doctorModel.value.image;
  }

  Future<void> checkAndUploadMetadata(String folderPath) async {
    videoServices.checkAndUploadMetadata(folderPath);
  }

  Future<void> uploadMetadataForVideosInFolder(String folderPath) async {
    videoServices.uploadMetadataForVideosInFolder(folderPath);
  }

  Future<void> uploadVideos(String folderName, List<String> kidsVideos,
      List<String> fluencyVideos, List<String> speechDisorderVideos) async {
    videoServices.uploadVideos(
        folderName, kidsVideos, fluencyVideos, speechDisorderVideos);
  }

  final RxList<ExerciseData> exerciseData = [
    ExerciseData(
      title: "Exercises for kids",
      description: "Recognition of disease and Speech Disorders in Children",
      progress: 0, // Initial progress for the first exercise
    ),
    ExerciseData(
      title: "Fluency exercises for clear speak",
      description: "Fluency exercises for clear speak",
      progress: 0, // Initial progress for the second exercise
    ),
    ExerciseData(
      title: "Speech Disorders in Children",
      description: "There are videos Speech Disorders in Children",
      progress: 0, // Initial progress for the third exercise
    ),
  ].obs;

  Future<void> calculateAndDisplayProgress() async {
    try {
      String userId = userModel.value.id;

      // Calculate progress for each exercise separately
      double progressRecognition = await videoServices.calculateUserProgress(
        userId,
        "Exercises for kids",
      );

      double progressFluency = await videoServices.calculateUserProgress(
        userId,
        "Fluency exercises for clear speak",
      );

      double progressSpeechDisorders =
          await videoServices.calculateUserProgress(
        userId,
        "Speech Disorders in Children",
      );

      // Update the exerciseData list with the retrieved progress values
      updateProgress(progressRecognition, 0);
      updateProgress(
          progressFluency, 1); // Update the progress of the first exercise
      updateProgress(progressSpeechDisorders,
          2); // Update the progress of the second exercise
      // Update the progress of the third exercise

      // Display the updated progress for verification
      print('Progress for Recognition: $progressRecognition');
      print('Progress for Fluency: $progressFluency');
      print('Progress for Speech Disorders: $progressSpeechDisorders');
      print('Updated Exercise Data: $exerciseData');
    } catch (e) {
      print('Error calculating and displaying progress: $e');
    }
  }

  void updateProgress(double progress, int index) {
    if (index >= 0 && index < exerciseData.length) {
      // Update the progress value at the specified index
      exerciseData[index] = ExerciseData(
        title: exerciseData[index].title,
        description: exerciseData[index].description,
        progress: progress,
      );
    }
  }

  Future<double> calculateOverallProgress(
      String userId, List<String> folderNames) async {
    try {
      int totalVideoCount = 0;
      int totalUserVideoIndex = 0;

      for (String folderName in folderNames) {
        DocumentSnapshot userSnapshot = await FirebaseFirestore.instance
            .collection('users')
            .doc(userId)
            .get();

        if (userSnapshot.exists) {
          Map<String, dynamic>? userData =
              userSnapshot.data() as Map<String, dynamic>?;

          if (userData != null && userData.containsKey('$folderName-Index')) {
            int userVideoIndex = userData['$folderName-Index'] as int;
            int videoCount =
                await videoServices.getVideoCountForFolder(folderName);

            totalUserVideoIndex += userVideoIndex;
            totalVideoCount += videoCount;
          } else {
            // Set progress to 0% if progress data is not found
            totalVideoCount +=
                await videoServices.getVideoCountForFolder(folderName);
          }
        } else {
          throw Exception('User document does not exist');
        }
      }

      double calculatedOverallProgress =
          totalUserVideoIndex / totalVideoCount * 100;

      print('Overall Progress: $calculatedOverallProgress');

      // Update the overallProgress value in the controller
      updateOverallProgress(calculatedOverallProgress);

      return calculatedOverallProgress;
    } catch (e) {
      print('Error calculating overall progress: $e');
      return 0.0;
    }
  }

  void updateOverallProgress(double calculateOverallProgress) {
    overallProgress.value = calculateOverallProgress;
  }

  RxBool isLoading = true.obs;

  Future<void> loadData() async {
    isLoading.value = true;

    await Future.delayed(const Duration(seconds: 1));

    isLoading.value = false;
  }


}

class ExerciseData {
  String title = "";
  String description = "";
  double progress = 0.0;

  ExerciseData(
      {required this.title, required this.description, required this.progress});
}
