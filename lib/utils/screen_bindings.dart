import 'package:fluency_therapist/controller/auth_screens_controller/create_new_password_screen_controller.dart';
import 'package:fluency_therapist/controller/auth_screens_controller/login_screen_controller.dart';

import 'package:get/get.dart';
import '../controller/auth_screens_controller/forget_pass_screen_controller.dart';
import '../controller/auth_screens_controller/otp_verification_screen_controller.dart';
import '../controller/auth_screens_controller/signup_screen_controller.dart';
import '../controller/auth_screens_controller/splash_screen_controller.dart';
import '../controller/home_screens_controller/edit_profile_screen_controller.dart';
import '../controller/home_screens_controller/user_profile_screen_controlller.dart';

//created by Abdul Rafay on 1-5-2023

class ScreenBindings extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut(() => SplashScreenController());
    Get.lazyPut(() => LoginScreenController());
    Get.lazyPut(() => SignupScreenController());
    Get.lazyPut(() => ForgetPassScreenController());
    Get.lazyPut(() => OtpVerificationScreenController());
    Get.lazyPut(() => CreateNewPasswordScreenController());
    Get.lazyPut(() => EditProfileScreenController());
    Get.lazyPut(() => UserProfileScreenController());
  }
}
