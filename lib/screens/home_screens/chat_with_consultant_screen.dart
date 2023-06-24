import 'package:fluency_therapist/controller/home_screens_controller/consultant_chat_screen_controller.dart';
import 'package:fluency_therapist/screens/home_screens/calling_consultant_screen.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../../utils/app_colors.dart';
import '../../utils/app_constants.dart';

class ChatWithConsultantScreen extends GetView<ConsultantChatScreenController> {
  const ChatWithConsultantScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final screenWidth = MediaQuery.of(context).size.width;
    final screenHeight = MediaQuery.of(context).size.height;
    return Scaffold(backgroundColor: AppColors.backgroundColor,body:
       SafeArea(
        child: Padding(padding: const EdgeInsets.only(left:25, right:25, top:25),
          child: Column(children: [
          Row(

          children: [
          InkWell(
          onTap: () {
          Get.back();
          },
          child:  Icon(
            Icons.arrow_back,
            size: screenWidth*0.10,
          ),
        ),

            Padding(
              padding: const EdgeInsets.only(left: 30),
              child: CircleAvatar(
                radius: screenWidth*0.06,
              ),
            ),
            Padding(
              padding: const EdgeInsets.only(left: 15, right:45),
              child: Text("Dr M Ali\nNizamani", style: Theme.of(context)
                  .textTheme
                  .displayLarge!
                  .copyWith(fontSize: screenWidth*0.035, ),
              ),
            ),
            InkWell(
              onTap: () {Get.to(const CallingConsultantScreen());},
              child: Icon(Icons.phone, size: screenWidth*0.065, color: AppColors.primaryBlue,),
            ),
            Padding(
              padding: const EdgeInsets.only(left: 30),
              child: Icon(Icons.video_call, size: screenWidth*0.065, color: AppColors.primaryBlue,),
            )
          ],),
        ],),
      ),),);
  }
}