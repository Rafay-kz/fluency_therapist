import 'dart:io';

import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_storage/firebase_storage.dart';
import 'package:get/get.dart';

import '../../../model/doctor_model.dart';
import '../../../model/user_model.dart';
import '../../../model/videos_model.dart';
import '../../../utils/app_constants.dart';
import '../../../utils/user_session.dart';

class SpeechExercisesScreenController extends GetxController {
  UserSession userSession = UserSession();
  Rx<DoctorModel> doctorModel = DoctorModel.empty().obs;
  Rx<UserModel> userModel = UserModel.empty().obs;
  late int index;

  @override
  void onInit() {
    getUserInfo();
    getDoctorInfo();
    super.onInit();
  }

  Future<void> getUserInfo() async {
    userModel.value = await userSession.getUserInformation();

    print('============>>${userModel.toString()}');
  }

  Future<void> getDoctorInfo() async {
    doctorModel.value = await userSession.getDoctorInformation();
  }

  Future<void> uploadVideos(String folderName, List<String> kidsVideos,
      List<String> fluencyVideos, List<String> speechDisorderVideos) async {
    final storage = FirebaseStorage.instance;
    final firestore = FirebaseFirestore.instance;
    final storageRef = storage.ref().child('videos/$folderName');

    Future<void> _uploadAndStore(String subfolder, String videoPath) async {
      final videoFile = File(videoPath);
      final videoName = videoFile.path.split('/').last;
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
