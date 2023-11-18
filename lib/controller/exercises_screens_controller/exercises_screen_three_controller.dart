import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_storage/firebase_storage.dart';
import 'package:fluency_therapist/utils/video_services.dart';
import 'package:get/get.dart';
import 'package:firebase_storage/firebase_storage.dart' as firebase_storage;

import '../../../custom widgets/progress_indicator.dart';
import '../../../model/user_model.dart';
import '../../../utils/user_session.dart';
import '../../model/doctor_model.dart';

class ExercisesScreenThreeController extends GetxController {
  VideoServices videoServices = VideoServices();
  UserSession userSession = UserSession();
  Rx<UserModel> userModel = UserModel.empty().obs;
  Rx<DoctorModel> doctorModel = DoctorModel.empty().obs;
  ProgressDialog progressDialog = ProgressDialog(); // Add this line
  // RxInt unlockedVideoIndex = 0.obs;
  // RxBool isPlaying = false.obs; // Track the unlocked video index
  String exerciseName = 'Speech Disorders in Children';

  @override
  void onInit() async {
    await fetchMetadataForFolder('Speech Disorders in Children');
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
    videoServices.unlockNextVideo(userModel.value.id, exerciseName);
  }

  void onVideoComplete() {
    videoServices.onVideoComplete(userModel.value.id, exerciseName);
  }

  Future<void> loadVideoIndex() async {
    videoServices.loadUnlockedVideoIndex(userModel.value.id, exerciseName);
  }
}
