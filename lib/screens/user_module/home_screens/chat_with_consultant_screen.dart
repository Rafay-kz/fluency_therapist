
import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../../../controller/user_screens_controller/home_screens_controller/chat_with_consultant_screen.dart';
import '../../../utils/app_colors.dart';
import '../../../utils/app_constants.dart';



class ChatWithConsultantScreen extends GetView<ChatWithConsultantScreenController> {
  const ChatWithConsultantScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final screenWidth = MediaQuery.of(context).size.width;
    final screenHeight = MediaQuery.of(context).size.height;
    return Scaffold(
      backgroundColor: AppColors.backgroundColor,
      body: SafeArea(
        child: Padding(
          padding: const EdgeInsets.only(top: 20),
          child: Column(
            children: [
              Material(
                elevation: 2,
                color: AppColors.backgroundColor,
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.start,
                  children: [
                    SizedBox(
                      height: screenHeight*0.078,
                      child: InkWell(
                        onTap: () {
                          Get.back();
                        },
                        child: Padding(
                          padding: const EdgeInsets.only(left: 10),
                          child: Icon(
                            Icons.arrow_back,
                            size: screenWidth * 0.10,
                          ),
                        ),
                      ),
                    ),
                    Padding(
                      padding: const EdgeInsets.only(left: 30),
                      child: CircleAvatar(
                        radius: screenWidth * 0.06,
                      ),
                    ),
                    Padding(
                      padding: const EdgeInsets.only(left: 15, right: 45),
                      child: Text(
                        "Dr M Ali\nNizamani",
                        style: Theme.of(context).textTheme.displayLarge!.copyWith(
                          fontSize: screenWidth * 0.035,
                        ),
                      ),
                    ),
                    InkWell(
                      onTap: () {
                        Get.toNamed(kCallingConsultantScreen);
                      },
                      child: Icon(
                        Icons.phone,
                        size: screenWidth * 0.065,
                        color: AppColors.primaryBlue,
                      ),
                    ),
                    Padding(
                      padding: const EdgeInsets.only(left: 30),
                      child: InkWell(
                        onTap: () {
                          Get.toNamed(kVideoCallScreen);
                        },
                        child: Icon(
                          Icons.video_call,
                          size: screenWidth * 0.065,
                          color: AppColors.primaryBlue,
                        ),
                      ),
                    ),
                  ],
                ),
              ),
              Expanded(
                child: ListView.builder(
                  itemCount: 10,
                  itemBuilder: (context, index) {
                    // Build your chat message items here
                    return ListTile(
                      title: Text('Message $index'),
                    );
                  },
                ),
              ),
              Container(
                padding:const EdgeInsets.only(left: 10, bottom: 10, top: 10),
                height: 60,
                width: double.infinity,
                color: Colors.white,
                child: Row(
                  children: [
                    GestureDetector(
                      onTap: () {},
                      child: Container(
                        height: 30,
                        width: 30,
                        decoration: BoxDecoration(
                          color: AppColors.primaryBlue,
                          borderRadius: BorderRadius.circular(40),
                        ),
                        child: const Icon(
                          Icons.add,
                          color: Colors.white,
                          size: 20,
                        ),
                      ),
                    ),
                    const SizedBox(width: 15),
                    const Expanded(
                      child: TextField(
                        decoration: InputDecoration(
                          hintText: "Write message...",
                          hintStyle: TextStyle(color: Colors.black54),
                          border: InputBorder.none,
                        ),
                      ),
                    ),
                    const SizedBox(width: 15),
                    FloatingActionButton(
                      onPressed: () {},
                      backgroundColor: AppColors.primaryBlue,
                      elevation: 0,
                      child: const Icon(
                        Icons.send,
                        color: Colors.white,
                        size: 18,
                      ),
                    ),
                  ],
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
