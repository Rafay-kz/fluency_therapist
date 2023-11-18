import 'package:fluency_therapist/core/database.dart';
import 'package:get/get.dart';

import '../../../model/user_model.dart';
import '../../../utils/user_session.dart';
import '../../model/doctor_model.dart';
import '../../utils/video_services.dart';

class ExercisesScreenOneController extends GetxController {
  final VideoServices videoServices = VideoServices();
  UserSession userSession = UserSession();
  Rx<UserModel> userModel = UserModel.empty().obs;
  Rx<DoctorModel> doctorModel = DoctorModel.empty().obs;
  Database database = Database();
  String exerciseName = "Exercises for kids";

  @override
  void onInit() async {
    await fetchMetadataForFolder('Exercises for kids');
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
  }

  void onVideoComplete() {
    print('Completing video...');
    videoServices.onVideoComplete(userModel.value.id, exerciseName);
  }

  Future<void> loadVideoIndex() async {
    print('Loading video index...');
    videoServices.loadUnlockedVideoIndex(userModel.value.id, exerciseName);
  }
}
