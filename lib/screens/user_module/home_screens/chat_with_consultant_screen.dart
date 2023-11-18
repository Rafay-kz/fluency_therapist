import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../../../controller/user_screens_controller/home_screens_controller/chat_with_consultant_screen.dart';
import '../../../utils/app_colors.dart';
import '../../../utils/app_constants.dart';
import '../../../utils/chat_message.dart';

class ChatWithConsultantScreen extends GetView<ChatWithConsultantScreenController> {
  const ChatWithConsultantScreen({Key? key}) : super(key: key);

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
              // Header Section
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
                            () =>CircleAvatar(
                              radius: 25,
                              backgroundImage: _getImageProvider(),
                            ),

                      ),
                    ),
                    Padding(
                      padding: const EdgeInsets.only(left: 15, right: 45),
                      child: Text(
                        "${controller.doctorModel.value.firstName} ${controller.doctorModel.value.lastName}",
                        // Use the doctor's full name from the controller
                        style: Theme.of(context).textTheme.displayLarge!.copyWith(
                          fontSize: screenWidth * 0.035,
                        ),
                      ),
                    ),
                    InkWell(
                      onTap: () {
                        // Handle phone icon tap
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
                          // Handle video call icon tap
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
              // Chat Messages Section
              Expanded(
                child: Obx(
                      () => ListView.builder(
                    itemCount: controller.messages.length,
                    itemBuilder: (context, index) {
                      ChatMessage message = controller.messages[index];
                      return ListTile(
                        title: Text(message.text),
                        subtitle: Text('${message.senderFirstName}'), // Use senderFirstName
                        trailing: Text(
                          '${message.timestamp.hour}:${message.timestamp.minute}',
                        ),
                      );
                    },
                  ),
                ),
              ),
              // Message Input Section
              Container(
                padding: const EdgeInsets.only(left: 10, bottom: 10, top: 10),
                height: 60,
                width: double.infinity,
                color: Colors.white,
                child: Row(
                  children: [
                    GestureDetector(
                      onTap: () {
                        // Handle add icon tap
                      },
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
                          // Update the messageText property in the controller
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
                        // Use the messageText property from the controller
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
