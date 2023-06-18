import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../../utils/app_colors.dart';
import '../../utils/app_constants.dart';

class ProgressTrackingScreen extends GetView<ProgressTrackingScreen> {
  const ProgressTrackingScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        backgroundColor: AppColors.backgroundColor,
        body: SafeArea(
        child: Padding(
          padding: const EdgeInsets.only(top: 25, right: 25, left: 25),
          child: Column(children: [
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
              IconButton(
                onPressed: () {
                Get.back();
                },
                icon: const Icon(
                  Icons.arrow_back,
                  size: 30,
                ),
              ),
              const Padding(
                padding: EdgeInsets.only(top: 10, right: 90, left:90),
                child: Center(
                  child: Image(
                      image: AssetImage(logoIcon), width: 158, height: 62),
                ),
              ),
              const CircleAvatar(
                radius: 22,
              ),
            ],),
            Row(
              mainAxisAlignment: MainAxisAlignment.start,
              children: [
                Padding(
                  padding: const EdgeInsets.only(top: 20,  left:12),
                  child: Text("Progress Tracking",
                      style: Theme.of(context)
                          .textTheme
                          .displayLarge!
                          .copyWith(fontSize: 18)),
                ),
              ],
            ),
            Padding(
              padding: const EdgeInsets.only(top: 20),
              child: Container(
                width: 600,
                height: 300,
                decoration: BoxDecoration(
                    color: AppColors.secondaryBlue,
                    borderRadius: BorderRadius.circular(40)),
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [

                  
                  ],
                ),
              ),
            ),


          ],),
        ),
      ));
  }
}