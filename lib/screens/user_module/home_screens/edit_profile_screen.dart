import 'dart:io';

import 'package:cached_network_image/cached_network_image.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../../../controller/user_screens_controller/home_screens_controller/edit_profile_screen_controller.dart';
import '../../../custom widgets/button.dart';
import '../../../utils/app_colors.dart';



class EditProfileScreen extends GetView<EditProfileScreenController> {
  EditProfileScreen({Key? key}) : super(key: key);

  final FirebaseAuth _auth = FirebaseAuth.instance;

  @override
  Widget build(BuildContext context) {
    final screenWidth = MediaQuery.of(context).size.width;
    return Scaffold(
        backgroundColor: AppColors.backgroundColor,
        body: SafeArea(
          child: Padding(
            padding: const EdgeInsets.only(top: 25, left: 25, right: 25),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Row(
                  mainAxisAlignment: MainAxisAlignment.start,
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
                  ],
                ),
                const SizedBox(height: 10),
                Obx(() {
                  return Column(
                    children: [
                      Center(
                        child: CircleAvatar(
                            radius: screenWidth * 0.15,
                            backgroundImage: controller.userModel.value.image!=''
                                ? CachedNetworkImageProvider(
                                controller.userModel.value.image
                            ):controller.userModel.value.image==''&&controller.imagePath.isEmpty?const AssetImage('assets/images/person.png'):controller.imagePath.isNotEmpty
                                ? FileImage(
                                    File(controller.imagePath.toString())) as ImageProvider
                                : null),
                      ),
                      TextButton(
                          onPressed: () {
                            controller.imagePickerOption();
                          },
                          child: const Text("Change Photo"))
                    ],
                  );
                }),
               Obx(()=> Center(
                  child: Column(
                    children: [
                      Padding(
                        padding: const EdgeInsets.only(top: 20, bottom: 15),
                        child: Text(
                          "\n${controller.userModel.value.firstName}",
                          style: Theme.of(context)
                              .textTheme
                              .displayLarge!
                              .copyWith(
                                fontSize: screenWidth * 0.050,
                                color: AppColors.textColor,
                              ),
                        ),
                      ),
                    ],
                  ),
                ),
               ),
                Padding(
                  padding: const EdgeInsets.only(top: 20, bottom: 10),
                  child: Text(
                    'Username',
                    style: Theme.of(context).textTheme.headlineSmall,
                    textAlign: TextAlign.start,
                  ),
                ),
              Obx(()=>  Center(
                  child: SizedBox(
                    width: screenWidth * 0.9,
                    child: TextFormField(
                      controller: controller.nameTEController.value,
                      style: TextStyle(color: AppColors.textColor),

                      decoration: InputDecoration(
                        fillColor: AppColors.textfieldColor,
                        filled: true,
                        border: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(30),
                          borderSide: BorderSide.none,
                        ),
                        prefixIcon: Icon(
                          Icons.perm_identity_rounded,
                          color: AppColors.textHintColor,
                        ),
                      ),
                    ),
                  ),
                ),
              ),
                const SizedBox(
                  height: 5,
                ),
                Padding(
                  padding: const EdgeInsets.only(top: 10, bottom: 10),
                  child: Text(
                    'Email',
                    style: Theme.of(context).textTheme.headlineSmall,
                    textAlign: TextAlign.start,
                  ),
                ),
               Obx(()=> Center(
                  child: SizedBox(
                    width: screenWidth * 0.9,
                    child: TextFormField(
                      readOnly: true,
                      controller: controller.emailTEController.value,
                      style: TextStyle(color: AppColors.textColor),
                      decoration: InputDecoration(
                        fillColor: AppColors.textfieldColor,
                        filled: true,
                        border: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(30),
                          borderSide: BorderSide.none,
                        ),
                        prefixIcon: Icon(
                          Icons.email_outlined,
                          color: AppColors.textHintColor,
                        ),
                      ),
                    ),
                  ),
                ),
               ),
                const SizedBox(
                  height: 10,
                ),

                Padding(
                  padding: const EdgeInsets.only(top: 30),
                  child: Button(onPressed: () {
                    controller.editProfile();

                    }, text: "Update"),
                ),
              ],
            ),
          ),
        ));
  }
}
