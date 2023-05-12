import 'package:fluency_therapist/utils/app_constants.dart';
import 'package:get/get.dart';

//created by Abdul Rafay on 1-5-2023
class SplashScreenController extends GetxController{


  void onLoginTap(){
    Get.toNamed(kLoginScreen);

  }


  void onSignUpTap(){
    Get.toNamed(kSignUpScreen);

  }

}