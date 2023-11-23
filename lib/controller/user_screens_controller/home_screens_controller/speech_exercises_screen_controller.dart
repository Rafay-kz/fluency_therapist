import 'package:get/get.dart';

import '../../../model/doctor_model.dart';
import '../../../model/user_model.dart';
import '../../../utils/user_session.dart';
import '../../../utils/video_services.dart';

class SpeechExercisesScreenController extends GetxController {
  final VideoServices videoServices = VideoServices();
  UserSession userSession = UserSession();
  Rx<DoctorModel> doctorModel = DoctorModel.empty().obs;
  Rx<UserModel> userModel = UserModel.empty().obs;
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

    super.onInit();
  }

  Future<void> getUserInfo() async {
    userModel.value = await userSession.getUserInformation();
  }

  Future<void> getDoctorInfo() async {
    doctorModel.value = await userSession.getDoctorInformation();
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
      description: "Recognition of disease\nand Speech Disorders\nin Children",
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

      double progressSpeechDisorders = await videoServices.calculateUserProgress(
        userId,
        "Speech Disorders in Children",
      );

      double progressFluency = await videoServices.calculateUserProgress(
        userId,
        "Fluency exercises for clear speak",
      );

      // Update the exerciseData list with the retrieved progress values
      updateProgress(progressRecognition, 0); // Update the progress of the first exercise
      updateProgress(progressSpeechDisorders, 1); // Update the progress of the second exercise
      updateProgress(progressFluency, 2); // Update the progress of the third exercise

      // Display the updated progress for verification
      print('Progress for Recognition: $progressRecognition');
      print('Progress for Speech Disorders: $progressSpeechDisorders');
      print('Progress for Fluency: $progressFluency');
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
        description:exerciseData[index].description,
        progress: progress,
      );
    }
  }
}

class ExerciseData {
   String title="";
   String description="";
   double progress=0.0;

  ExerciseData({required this.title, required this.description, required this.progress});
}

