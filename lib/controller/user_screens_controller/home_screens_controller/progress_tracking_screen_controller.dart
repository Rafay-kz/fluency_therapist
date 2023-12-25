import 'package:fluency_therapist/controller/user_screens_controller/home_screens_controller/speech_exercises_screen_controller.dart';
import 'package:get/get.dart';

import '../../../model/doctor_model.dart';
import '../../../model/user_model.dart';
import '../../../utils/user_session.dart';

class ProgressTrackingScreenController extends GetxController {
  UserSession userSession = UserSession();
  Rx<UserModel> userModel = UserModel.empty().obs;
  Rx<DoctorModel> doctorModel = DoctorModel.empty().obs;
  final SpeechExercisesScreenController speechExercisesScreenController =
      Get.put(SpeechExercisesScreenController());

  @override
  void onInit() async {
    await getUserInfo();
    await getDoctorInfo();
    await speechExercisesScreenController.calculateAndDisplayProgress();
    loadDataFromView(); // Fetch progress

    super.onInit();
  }

  Future<void> getUserInfo() async {
    userModel.value = await userSession.getUserInformation();
  }

  Future<void> getDoctorInfo() async {
    doctorModel.value = await userSession.getDoctorInformation();
  }

  RxBool isLoading = true.obs;

  Future<void> loadData() async {
    isLoading.value = true;

    await Future.delayed(const Duration(milliseconds: 500));

    isLoading.value = false;
  }

  // Call this method from the view to load data
  void loadDataFromView() {
    loadData();
  }
} // TODO Implement this library.
