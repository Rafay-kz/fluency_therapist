import 'dart:async';

import 'package:fluency_therapist/utils/user_session.dart';

import 'package:get/get.dart';

import '../../../utils/app_constants.dart';


class SplashScreenController extends GetxController {

  final RxDouble splashLoading = 0.0.obs;
  String logo = fluencyTherapistLogo;

  Timer? timer;

  @override
  void onInit() {
    super.onInit();
    timer = Timer.periodic(
      const Duration(milliseconds: 50),
      (timer) {
        splashLoading.value += 0.25;
        if (splashLoading.value >= 1.0) {
          navigate();
          timer.cancel();
        }
      },
    );
  }

  Future<void> navigate() async {
    UserSession userSession = UserSession();
    if (await userSession.isUserLoggedIn()) {
      if (await userSession.isUserDoctor()) {
        Get.offNamed(kDoctorHomeScreen);
      } else {
        Get.offNamed(kHomeScreen);
      }
    } else {
      Get.offNamed(kWelcomescreen);
    }
  }
}
