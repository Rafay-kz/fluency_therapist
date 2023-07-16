import 'dart:async';


import 'package:fluency_therapist/controller/auth_screens_controller/user_session.dart';
import 'package:fluency_therapist/screens/auth_screens/welcome_screen.dart';
import 'package:fluency_therapist/screens/home_screens/home_screen.dart';
import 'package:get/get.dart';

class SplashScreenController extends GetxController {


  Future<void> navigate() async{
    UserSession userSession = UserSession();
    if(await userSession.isUserLoggedIn()) {
      Get.off(
              ()=> const HomeScreen(),
          duration: const Duration(seconds: 2),
      );
    }else{
      Get.off(
              ()=> const WelcomeScreen(),
          duration: const Duration(seconds: 2),
      );
    }
  }
}
