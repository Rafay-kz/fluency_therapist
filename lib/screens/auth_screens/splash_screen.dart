import 'package:fluency_therapist/controller/auth_screens_controller/splash_screen_controller.dart';
import 'package:fluency_therapist/utils/app_constants.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:sizer/sizer.dart';

//created by Abdul Rafay on 1-5-2023
class SplashScreen extends GetView<SplashScreenController>{
  const SplashScreen({super.key});

  @override
  Widget build(BuildContext context) {
  return Sizer(builder: (context,orientation,deviceType){
    return Scaffold(
      body: SafeArea(
        child: Padding(
          padding: const EdgeInsets.only(right: 20,bottom: 10),
          child: SingleChildScrollView(
            child: Column(
              mainAxisAlignment: MainAxisAlignment.start,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Center(
                  child: Container(
                    alignment: Alignment.center,
                    width: 50.h,
                    height: 50.h,
                    decoration: const BoxDecoration(
                        image: DecorationImage(
                            image: AssetImage('assets/images/splash.jpg'),
                            fit: BoxFit.fitWidth)),
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.only(right: 80),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    crossAxisAlignment: CrossAxisAlignment.center,
                    children: [
                      Container(
                        height: 10.h,
                        width: 12.h,
                        decoration: const BoxDecoration(
                            image: DecorationImage(
                                image: AssetImage('assets/images/logo.jpg'),
                                fit: BoxFit.cover)),
                      ),
                      const SizedBox(
                        width: 5,
                      ),
                      const Center(
                          child: Padding(
                            padding: EdgeInsets.only(left: 20),
                            child: Text(
                              'fluency\ntherapist',
                              style: TextStyle(
                                  fontWeight: FontWeight.bold,
                                  fontSize: 30,
                                  fontFamily: 'FontMain'),
                            ),
                          ))
                    ],
                  ),
                ),
                const SizedBox(
                  height: 5,
                ),
                Padding(
                  padding: const EdgeInsets.only(left: 20,top: 10,bottom: 8),
                  child: Column(
                    children: const [
                      Center(
                          child: Text(
                            'Empowering communication through fluency',
                            style: TextStyle(
                                fontWeight: FontWeight.bold,
                                fontSize: 17,
                                fontFamily: 'FontMain',
                                color: Colors.black87),
                          ))
                    ],
                  ),
                ),
                const SizedBox(
                  height: 5,
                ),
                Padding(
                  padding: const EdgeInsets.only(left: 30, right: 20, top: 8,bottom: 10),
                  child: Column(
                    children: const [
                      Center(
                          child: Text(
                            'Personalized exercises, progress tracking\nand expert consultation for improved\ncommunication and quality of life.',
                            style: TextStyle(
                                fontWeight: FontWeight.bold,
                                fontSize: 15,
                                fontFamily: 'FontMain',
                                color: Colors.black87),
                          ))
                    ],
                  ),
                ),

                Center(
                  child: Padding(
                    padding: const EdgeInsets.only(left: 8,bottom: 2),
                    child: Container(
                        width: 50.h,
                        decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(30),
                            color: Colors.blueAccent),
                        child: TextButton(
                            onPressed: () {},
                            child: const Text('Login',
                                style: TextStyle(
                                    fontWeight: FontWeight.bold,
                                    fontSize: 30,
                                    fontFamily: 'FontMain',
                                    color: Colors.white)))),
                  ),
                ),

                Center(
                  child: Padding(
                    padding: const EdgeInsets.only(left: 8,bottom: 8,top: 8),
                    child: Container(
                        width: 50.h,
                        decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(30),
                        color: Colors.grey),
                        child: TextButton(
                            onPressed: () {
                              Get.toNamed(kSignUpScreen);
                            },
                            child: const Text('Register',
                                style: TextStyle(
                                    fontWeight: FontWeight.bold,
                                    fontSize: 30,
                                    fontFamily: 'FontMain',
                                    color: Colors.black))),
                  ),
                ),
                )],
            ),
          ),
        ),
      ),
      backgroundColor: Colors.white,
    );
  }) ;




  }

}