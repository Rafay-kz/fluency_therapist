
import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../../../controller/user_screens_controller/home_screens_controller/customize_program_final_screen_controller.dart';
import '../../../custom widgets/videoplayer.dart';
import '../../../utils/app_colors.dart';
import '../../../utils/app_constants.dart';

class CustomizeProgramFinalScreen
    extends GetView<CustomizeProgramFinalScreenController> {
  const CustomizeProgramFinalScreen({super.key});
  @override
  Widget build(BuildContext context) {
    final screenWidth = MediaQuery.of(context).size.width;
    final screenHeight = MediaQuery.of(context).size.height;
    return Scaffold(
      backgroundColor: AppColors.backgroundColor,
      body: SafeArea(
        child: Padding(
          padding: const EdgeInsets.only(right: 25, left: 25, top: 25),
          child: Column(
            children: [
              Row(
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
                    padding:
                        const EdgeInsets.only(top: 10, right: 38, left: 38),
                    child: Center(
                      child: Image(
                        image: const AssetImage(logoIcon),
                        height: screenHeight * 0.075,
                        width: screenWidth * 0.42,
                      ),
                    ),
                  ),
                  Obx(
                        () => CircleAvatar(
                      radius: 25,
                      backgroundImage: controller.doctorModel.value.image != ''
                          ? CachedNetworkImageProvider(controller.doctorModel.value.image)
                          : (controller.userModel.value.image != ''
                          ? CachedNetworkImageProvider(controller.userModel.value.image)
                          : const AssetImage('assets/images/person.png') as ImageProvider),
                    ),
                  ),
                ],
              ),
              Padding(
                  padding: const EdgeInsets.only(top: 25, bottom: 5),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.start,
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        "Congratulations! Your Personalized\nTraining Plan Has Been Generated\nSuccessfully!",
                        style:
                            Theme.of(context).textTheme.displayLarge!.copyWith(
                                  fontSize: screenWidth * 0.045,
                                ),
                      ),
                    ],
                  )),
              Expanded(
                child: Obx(() {
                  if (controller.videoUrls.isEmpty) {
                    return const CircularProgressIndicator();
                  }

                  return ListView.builder(
                    itemCount: controller.videoUrls.length,
                    itemBuilder: (BuildContext context, int index) {
                      return Padding(
                        padding: EdgeInsets.only(bottom: 20), // Add some space between containers
                        child: Container(
                          width: screenWidth * 0.8, // Adjusted width for responsiveness
                          height: screenHeight * 0.23, // Adjusted height for responsiveness
                          decoration: BoxDecoration(
                            color: AppColors.secondaryBlue,
                            borderRadius: BorderRadius.circular(40),
                          ),
                          child: VideoWidget(
                            videoUrl: controller.videoUrls[index],
                            unlocked: index <= controller.unlockedVideoIndex.value,
                            isPlaying: index == controller.unlockedVideoIndex.value,
                            onVideoComplete: () {
                              controller.onVideoComplete();
                            },
                          ),
                        ),
                      );
                    },
                  );
                }),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
