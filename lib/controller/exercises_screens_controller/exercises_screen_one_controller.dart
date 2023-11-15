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
  // ProgressDialog progressDialog = ProgressDialog(); // Add this line
  // RxList<String> videoUrls = <String>[].obs;
  // RxInt unlockedVideoIndex = 0.obs;
  // RxBool isPlaying = false.obs; // Track the unlocked video index
  // RxList<String> completedVideos = <String>[].obs;


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
    videoServices.fetchMetadataForFolder(folderName);
  }


  void unlockNextVideo() {
   videoServices.unlockedVideoIndex();
  }

  void onVideoComplete() {
    videoServices.onVideoComplete(userModel.value.id);
  }

  Future<void> loadVideoIndex () async {
    videoServices.loadUnlockedVideoIndex(userModel.value.id);
  }

}






