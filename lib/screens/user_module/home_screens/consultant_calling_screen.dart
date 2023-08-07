import 'dart:io';

import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../../../controller/user_screens_controller/home_screens_controller/consultant_calling_screen_controller.dart';
import '../../../utils/app_colors.dart';
import '../../../utils/app_constants.dart';



class ConsultantCallingScreen extends GetView<ConsultantCallingScreenController> {
  const ConsultantCallingScreen ({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColors.backgroundColor,
      body: SafeArea(
        child: Padding(
          padding: const EdgeInsets.only(top: 25, left: 25, right: 25),
          child: Column(children: [
            Row(mainAxisAlignment: MainAxisAlignment.center, children: [
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
                padding: EdgeInsets.only(top: 10, right: 90, left: 90),
                child: Center(
                  child: Image(
                    image: AssetImage(logoIcon),
                    width: 158,
                    height: 62,
                  ),
                ),
              ),
              Obx(()=> CircleAvatar(
                  radius:25,
                  backgroundImage: controller.userModel.value.image!=''
                      ? FileImage(
                      File(controller.userModel.value.image))
                      : null
              ),
              ),
            ]),
            Padding(
              padding: const EdgeInsets.only(top: 30),
              child: Text(
                "Incoming",
                style: Theme.of(context).textTheme.displayLarge!.copyWith(
                  fontSize: 20,
                  color: AppColors.textColor,
                ),
              ),
            ),
            const Padding(
              padding: EdgeInsets.only(top: 20),
              child: CircleAvatar(
                radius: 80,

              ),
            ),
            Padding(
              padding: const EdgeInsets.only(top: 25),
              child: Text(
                "Dr M Ali\nNizamani",
                style: Theme.of(context).textTheme.displayLarge!.copyWith(
                  fontSize: 22,
                  color: AppColors.textColor,
                ),
                textAlign: TextAlign.center,
              ),
            ),
            Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Padding(
                    padding: const EdgeInsets.only(top: 120, right: 45),
                    child: Container(
                        width: 60,
                        height: 60,
                        decoration: BoxDecoration(
                          color: Colors.red,
                          borderRadius: BorderRadius.circular(15),
                        ),
                        child: Icon(
                          Icons.call_end,
                          size: 35,
                          color: AppColors.whiteColor,
                        )),
                  ),
                  Padding(
                    padding: const EdgeInsets.only(top: 120, left: 45),
                    child: Container(
                        width: 60,
                        height: 60,
                        decoration: BoxDecoration(
                          color: Colors.green,
                          borderRadius: BorderRadius.circular(15),
                        ),
                        child: Icon(
                          Icons.call,
                          size: 35,
                          color: AppColors.whiteColor,
                        )),
                  ),
                ]),
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
              Padding(
                padding: const EdgeInsets.only(top: 5, right: 96),
                child: Text("Decline", style: Theme.of(context).textTheme.displayLarge!.copyWith(
                  fontSize: 14,
                  color: AppColors.textColor,
                ),),
              ),
                Padding(
                  padding: const EdgeInsets.only(top: 5, ),
                  child: Text("Accept", style: Theme.of(context).textTheme.displayLarge!.copyWith(
                    fontSize: 14,
                    color: AppColors.textColor,
                  ),),
                )
            ],)
          ]),
        ),
      ),
    );
  }
}