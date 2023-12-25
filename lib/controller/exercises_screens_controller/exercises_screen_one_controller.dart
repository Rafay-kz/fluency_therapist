import 'package:fluency_therapist/core/database.dart';
import 'package:get/get.dart';

import '../../../model/user_model.dart';
import '../../../utils/user_session.dart';
import '../../model/doctor_model.dart';
import '../../utils/video_services.dart';
import '../user_screens_controller/home_screens_controller/speech_exercises_screen_controller.dart';

class ExercisesScreenOneController extends GetxController {
  SpeechExercisesScreenController speechExercisesScreenController = Get.find();
  final VideoServices videoServices = VideoServices();
  UserSession userSession = UserSession();
  Rx<UserModel> userModel = UserModel.empty().obs;
  Rx<DoctorModel> doctorModel = DoctorModel.empty().obs;
  Database database = Database();
  String exerciseName = "";

  @override
  void onInit() async {
    exerciseName=Get.arguments??'';
    await fetchMetadataForFolder(exerciseName);
    await getUserInfo();
    await getDoctorInfo();
    await loadVideoIndex();
    super.onInit();
  }

  Future<void> getDoctorInfo() async {
    doctorModel.value = await userSession.getDoctorInformation();
  }

  Future<void> getUserInfo() async {
    userModel.value = await userSession.getUserInformation();
  }

  Future<void> fetchMetadataForFolder(folderName) async {
    print('Fetching metadata for folder: $folderName');
    videoServices.fetchMetadataForFolder(folderName);
  }

  void unlockNextVideo() {
    print('Unlocking next video...');
    videoServices.unlockNextVideo(userModel.value.id, exerciseName);
    update();
  }

  void onVideoComplete() {
    print('Completing video...');
    videoServices.onVideoComplete(userModel.value.id, exerciseName);
    // speechExercisesScreenController.calculateAndDisplayProgress();
  }

  Future<void> loadVideoIndex() async {
    print('Loading video index...');
    videoServices.loadUnlockedVideoIndex(userModel.value.id, exerciseName);
  }
}
