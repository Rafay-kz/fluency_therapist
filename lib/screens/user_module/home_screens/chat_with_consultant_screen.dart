import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../../../controller/user_screens_controller/home_screens_controller/chat_with_consultant_screen_controller.dart';
import '../../../model/doctor_model.dart';
import '../../../model/user_model.dart';
import '../../../utils/app_colors.dart';
import '../../../utils/app_constants.dart';
import '../../../utils/chat_message.dart';

class ChatWithConsultantScreen extends GetView<ChatWithConsultantScreenController> {
  const ChatWithConsultantScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    WidgetsBinding.instance!.addPostFrameCallback((_) {
      final bool isKeyboardVisible = MediaQuery.of(context).viewInsets.bottom > 0;
      if (isKeyboardVisible) {
        controller.scrollToBottom(); // Trigger scrolling when keyboard is visible
      }
    });
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
                      height: screenHeight * 0.078,
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
                      child: Obx(
                            () => CircleAvatar(
                          radius: 25,
                          backgroundImage: _getImageProvider(),
                        ),
                      ),
                    ),
                    Padding(
                      padding: const EdgeInsets.only(left: 15, right: 45),
                      child: Text(
                        "${controller.doctorModel.value.firstName} ${controller.doctorModel.value.lastName}",
                        style: Theme.of(context).textTheme.headline6!.copyWith(
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
                child: Padding(
                  padding: const EdgeInsets.only(left:20, right:20, top: 20.0, bottom: 15),
                  child: Obx(
                        () =>ListView.builder(
                          controller: controller.scrollController,
                          itemCount: controller.messages.length,
                          itemBuilder: (context, index) {
                            ChatMessage message = controller.messages[index];

                            bool isSentByUser = message.senderId == controller.userModel.value.id;
                            bool isSentByDoctor = message.senderId == controller.doctorModel.value.id;

                            return Align(
                              alignment: isSentByUser || isSentByDoctor ? Alignment.centerRight : Alignment.centerLeft,
                              child: Padding(
                                padding: EdgeInsets.symmetric(vertical: 4, horizontal: 8),
                                child: Container(
                                  decoration: BoxDecoration(
                                    color: isSentByUser || isSentByDoctor ? AppColors.primaryBlue : Colors.grey[300],
                                    borderRadius: BorderRadius.only(
                                      topLeft: Radius.circular(isSentByUser || isSentByDoctor ? 12 : 0),
                                      topRight: Radius.circular(isSentByUser || isSentByDoctor ? 0 : 12),
                                      bottomLeft: Radius.circular(12),
                                      bottomRight: Radius.circular(12),
                                    ),
                                  ),
                                  padding: EdgeInsets.all(8),
                                  child: Column(
                                    mainAxisAlignment: MainAxisAlignment.start,
                                    crossAxisAlignment: CrossAxisAlignment.start, // Align text to start
                                    children: [
                                      Text(
                                        message.text,
                                        style: TextStyle(
                                          color: isSentByUser || isSentByDoctor ? Colors.white : Colors.black, fontSize: 15
                                        ),
                                      ),
                                      SizedBox(height: 4),
                                      Text(
                                        '${controller.formatTimestamp(message.timestamp)}', // Display timestamp
                                        style: TextStyle(
                                          color: isSentByUser || isSentByDoctor ? Colors.white70 : Colors.black54,
                                          fontSize: 15,
                                        ),
                                      ),
                                    ],
                                  ),
                              ),
                            ),);
                          },
                        )


                    ,
                  ),
                ),
              ),
              Container(
                padding: const EdgeInsets.only(left: 10, bottom: 10, top: 0),
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
                    Expanded(
                      child: TextField(
                        controller: controller.textFieldController,
                        onChanged: (text) {
                          controller.messageText = text;
                        },
                        decoration: const InputDecoration(
                          hintText: "Write message...",
                          hintStyle: TextStyle(color: Colors.black54),
                          border: InputBorder.none,
                        ),
                      ),
                    ),
                    const SizedBox(width: 15),
                    FloatingActionButton(
                      onPressed: () {
                        if (controller.messageText.isNotEmpty) {
                          controller.sendMessage(controller.messageText);
                        }
                      },
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

  ImageProvider _getImageProvider() {
    if (controller.userModel.value.image != '') {
      return CachedNetworkImageProvider(controller.userModel.value.image);
    } else if (controller.doctorModel.value.image != '') {
      return CachedNetworkImageProvider(controller.doctorModel.value.image);
    } else {
      return const AssetImage('assets/images/person.png');
    }
  }
}

// Controller code remains the same as provided in the previous snippet
