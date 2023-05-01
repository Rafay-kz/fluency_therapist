import 'package:get/get.dart';
import '../controller/auth_screens_controller/splash_screen_controller.dart';

//created by Abdul Rafay on 1-5-2023

class ScreenBindings extends Bindings{
  @override
  void dependencies() {
    Get.lazyPut(() => SplashScreenController());
  }
}