import 'package:fluency_therapist/controller/auth_screens_controller/splash_screen_controller.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

//created by Abdul Rafay on 1-5-2023
class SplashScreen extends GetView<SplashScreenController>{
  const SplashScreen({super.key});

  @override
  Widget build(BuildContext context) {
  return const Scaffold(body: Center(
    child: Text('Splash Screen'),
  ),);
  }

}