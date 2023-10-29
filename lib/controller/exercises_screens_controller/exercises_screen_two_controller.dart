import 'package:firebase_storage/firebase_storage.dart';
import 'package:get/get.dart';
import 'package:firebase_storage/firebase_storage.dart' as firebase_storage;

import '../../../custom widgets/progress_indicator.dart';
import '../../../model/user_model.dart';
import '../../../utils/user_session.dart';

class ExercisesScreenTwoController extends GetxController {
  UserSession userSession = UserSession();
  Rx<UserModel> userModel = UserModel.empty().obs;
  ProgressDialog progressDialog = ProgressDialog(); // Add this line
  RxInt unlockedVideoIndex = 0.obs;
  RxBool isPlaying = false.obs; // Track the unlocked video index

  @override
  void onInit() {
    getUserInfo();
    fetchVideoUrls(); // Combine both initialization tasks here
    super.onInit();
  }

  Future<void> getUserInfo() async {
    userModel.value = await userSession.getUserInformation();
  }

  RxList<String> videoUrls = <String>[].obs;

  Future<void> fetchVideoUrls() async {
    try {
      final List<String> urls = [];
      final ListResult result = await firebase_storage.FirebaseStorage.instance
          .ref(
          'videos/exercises/Exercises for kids')
          .listAll();

      for (final Reference ref in result.items) {
        final url = await ref.getDownloadURL();
        urls.add(url);
      }

      videoUrls.assignAll(urls);
    } catch (error) {
      // Handle error
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
}
