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

  final List<ExerciseData> exerciseData = [
    ExerciseData(
      "Recognition",
      "Recognition of disease\nand Speech Disorders\nin Children",
    ),
    ExerciseData(
      "Exercises",
      "Speech Disorders in Children",
    ),
    ExerciseData(
      "Exercises",
      "Fluency exercises for clear speak",
    ),
    // Add more ExerciseData objects as needed
  ];
}

class ExerciseData {
  final String title;
  final String description;

  ExerciseData(this.title, this.description);
}
