import 'package:fluency_therapist/controller/auth_screens_controller/splash_screen_controller.dart';
import 'package:fluency_therapist/utils/app_constants.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

//created by Bilal  on 9-5-2023
class SplashScreen extends GetView<SplashScreenController> {
  const SplashScreen({super.key});

  @override
  Widget build(BuildContext context) {
    var _mediaQuery = MediaQuery.of(context);
    return Scaffold(
      body: SafeArea(
        child: Padding(
          padding: const EdgeInsets.all(8.0),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.start,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Center(
                child: Container(
                  alignment: Alignment.center,
                  height: _mediaQuery.size.height * 0.4,
                  width: _mediaQuery.size.height * 0.4,
                  decoration: const BoxDecoration(
                      image: DecorationImage(
                          image: AssetImage('assets/images/splash.jpg'),
                          fit: BoxFit.contain)),
                ),
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  Padding(
                    padding: const EdgeInsets.only(left: 20, right: 20),
                    child: Container(
                      height: _mediaQuery.size.width * 0.3,
                      width: _mediaQuery.size.height * 0.12,
                      decoration: const BoxDecoration(
                          image: DecorationImage(
                              image: AssetImage('assets/images/logo.jpg'),
                              fit: BoxFit.fitWidth)),
                    ),
                  ),
                  const Padding(
                    padding: EdgeInsets.all(8.0),
                    child: Text(
                      'fluency\ntherapist',
                      style: TextStyle(fontSize: 35, fontFamily: 'FontMain'),
                    ),
                  )
                ],
              ),
              Padding(
                padding: const EdgeInsets.only(
                    left: 20, right: 5, bottom: 10, top: 10),
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: const [
                    Center(
                        child: Text(
                      'Empowering communication through fluency',
                      style: TextStyle(
                          fontSize: 20,
                          fontFamily: 'FontMain',
                          color: Colors.black87),
                    ))
                  ],
                ),
              ),
              Padding(
                padding: const EdgeInsets.all(8.0),
                child: Column(
                  children: const [
                    Center(
                        child: Text(
                      'Personalized exercises, progress tracking\nand expert consultation for improved\ncommunication and quality of life.',
                      style: TextStyle(
                          fontSize: 13,
                          fontFamily: 'FontMain',
                          color: Colors.black87),
                    ))
                  ],
                ),
              ),
              Center(
                child: Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: Container(
                      height: _mediaQuery.size.height * 0.07,
                      width: _mediaQuery.size.width * 0.8,
                      decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(10),
                          color: Colors.blueAccent),
                      child: TextButton(
                          onPressed: () {
                            Get.toNamed(kLoginScreen);
                          },
                          child: const Text('Login',

                              style: TextStyle(
                                  fontSize: 30,
                                  fontFamily: 'FontMain',
                                  color: Colors.white)))),
                ),
              ),
              Padding(
                padding: const EdgeInsets.all(8.0),
                child: Center(
                  child: Container(
                    height: _mediaQuery.size.height * 0.07,
                    width: _mediaQuery.size.width * 0.8,
                    decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(10),
                        color: const Color(0xFFE3F2FD)),
                    child: TextButton(
                        onPressed: () {
                          Get.toNamed(kSignUpScreen);
                        },
                        child: const Text('SignUp',
                            style: TextStyle(
                                fontSize: 30,
                                fontFamily: 'FontMain',
                                color: Colors.black))),
                  ),
                ),
              )
            ],
          ),
        ),
      ),
      backgroundColor: Colors.white,
    );
  }
}
