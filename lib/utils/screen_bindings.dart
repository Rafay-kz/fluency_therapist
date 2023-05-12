import 'package:fluency_therapist/controller/auth_screens_controller/login_screen_controller.dart';

import 'package:get/get.dart';
import '../controller/auth_screens_controller/signup_screen_controller.dart';
import '../controller/auth_screens_controller/splash_screen_controller.dart';

//created by Abdul Rafay on 1-5-2023

class ScreenBindings extends Bindings{
  @override
  void dependencies() {
    Get.lazyPut(() => SplashScreenController());
    Get.lazyPut(() => SignupScreenController());
    Get.lazyPut(() => LoginScreenController());
  }
}