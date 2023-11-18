import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_storage/firebase_storage.dart';
import 'package:get/get.dart';
import 'package:firebase_storage/firebase_storage.dart' as firebase_storage;

import '../../../custom widgets/progress_indicator.dart';
import '../../../model/user_model.dart';
import '../../../utils/user_session.dart';
import '../../model/doctor_model.dart';
import '../../utils/video_services.dart';

class ExercisesScreenTwoController extends GetxController {
  UserSession userSession = UserSession();
  Rx<UserModel> userModel = UserModel.empty().obs;
  Rx<DoctorModel> doctorModel = DoctorModel.empty().obs;
  ProgressDialog progressDialog = ProgressDialog();
  final VideoServices videoServices = VideoServices();
  String exerciseName = 'Fluency exercises for clear speak';


  // RxInt unlockedVideoIndex = 0.obs;
  // RxBool isPlaying = false.obs; // Track the unlocked video index

  @override
  void onInit() async {
    await getUserInfo();
    await getDoctorInfo();
    await fetchMetadataForFolder('Fluency exercises for clear speak');
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
    print('Unlocking next video...');
    videoServices.unlockedVideoIndex();
  }

  void onVideoComplete() {
    print('Completing video...');
    videoServices.onVideoComplete(userModel.value.id, exerciseName);
  }

  Future<void> loadVideoIndex () async {
    print('Loading video index...');
    videoServices.loadUnlockedVideoIndex(userModel.value.id, exerciseName);
  }

}
