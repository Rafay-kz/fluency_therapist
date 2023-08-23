import 'dart:io';

import 'package:cached_network_image/cached_network_image.dart';
import 'package:fluency_therapist/utils/app_colors.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../../../controller/user_screens_controller/home_screens_controller/call_log_screen_controller.dart';
import '../../../utils/app_constants.dart';



class CallLogScreen extends GetView<CallLogScreenController> {
  const CallLogScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final screenWidth = MediaQuery.of(context).size.width;
    final screenHeight = MediaQuery.of(context).size.height;

    return Scaffold(
      backgroundColor: AppColors.backgroundColor,
      body: SafeArea(
        child: Padding(
          padding: const EdgeInsets.only(top: 0),
          child: Column(
            children: [
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  InkWell(
                    onTap: () {
                      Get.back();
                    },
                    child: Icon(
                      Icons.arrow_back,
                      size: screenWidth * 0.10,
                    ),
                  ),
                  Padding(
                    padding: const EdgeInsets.only(top: 10, right: 48, left: 48),
                    child: Center(
                      child: Image(
                        image: const AssetImage(logoIcon),
                        width: screenWidth * 0.42,
                        height: screenHeight * 0.075,
                      ),
                    ),
                  ),
                  Obx(()=>  CircleAvatar(
                      radius: 25,
                      backgroundImage: controller.userModel.value.image!=''
                          ? CachedNetworkImageProvider(
                          controller.userModel.value.image
                      )
                          : const AssetImage('assets/images/person.png') as ImageProvider
                  ),
                  ),
                ],
              ),

              Expanded(
                child: ListView.builder(
                  itemCount: 10,
                  itemBuilder: (context, index) {
                    return Padding(
                      padding: const EdgeInsets.all(8.0),
                      child: ListTile(
                        leading: const CircleAvatar(
                          radius: 30,
                          backgroundImage: NetworkImage(
                            'https://via.placeholder.com/150',
                          ),
                        ),
                        title: Text(
                          'User $index',
                          style: Theme.of(context).textTheme.displayLarge!.copyWith(
                            fontSize: screenWidth * 0.042,
                          ),
                        ),
                        subtitle: Padding(
                          padding: const EdgeInsets.only(top:5.0),
                          child: Text(
                            'June 27,2023 - 10:03 AM\nMissed Call',
                            style: Theme.of(context)
                                .textTheme
                                .headlineSmall!
                                .copyWith(
                              fontSize: screenWidth * 0.035,
                              color: AppColors.textHintColor,
                            ),
                          ),
                        ),
                        trailing: Icon(
                          Icons.phone,
                          size: screenWidth*0.052,
                          color: AppColors.textHintColor,
                        ),
                      ),
                    );
                  },
                ),
              ),
            ],
          ),
        ),
      ),
      bottomNavigationBar: BottomNavigationBar(
        items: const <BottomNavigationBarItem>[
          BottomNavigationBarItem(
            icon: Icon(Icons.chat),
            label: 'Chat',
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.phone),
            label: 'Phone',
          ),
        ],
        selectedItemColor: AppColors.primaryBlue,
        unselectedItemColor: AppColors.textHintColor,
        backgroundColor: AppColors.backgroundColor,
        selectedLabelStyle: TextStyle(
          fontFamily: 'Montserrat',
          fontSize: screenWidth * 0.03,
          fontWeight: FontWeight.bold,
          color: AppColors.primaryBlue,
        ),
        unselectedLabelStyle: TextStyle(
          fontFamily: 'Montserrat',
          fontSize: screenWidth * 0.03,
          fontWeight: FontWeight.normal,
          color: AppColors.textHintColor,
        ),
      ),
    );
  }
}
