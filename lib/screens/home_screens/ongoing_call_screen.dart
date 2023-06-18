import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../../controller/home_screens_controller/ongoing_call_screen_controller.dart';
import '../../utils/app_colors.dart';
import '../../utils/app_constants.dart';

class OngoingCallScreen extends GetView<OngoingCallScreenController> {
  const OngoingCallScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return  Scaffold(
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
              const CircleAvatar(
                radius: 22,
              ),
            ]),
            Padding(
              padding: const EdgeInsets.only(top: 30),
              child: Text(
                "Connected",
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
            ), Padding(
              padding: const EdgeInsets.only(top: 30),
              child: Text(
                "01:00",
                style: Theme.of(context).textTheme.displayLarge!.copyWith(
                  fontSize: 18,
                  color: AppColors.textColor,
                ),
              ),
            ),
            Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Padding(
                    padding: const EdgeInsets.only(top: 230, right: 25),
                    child: Container(
                        width: 60,
                        height: 60,
                        decoration: BoxDecoration(
                          color: AppColors.secondaryBlue,
                          borderRadius: BorderRadius.circular(15),
                        ),
                        child: Icon(
                          Icons.mic_off,
                          size: 35,
                          color: AppColors.primaryBlue,
                        )),
                  ),
                  Padding(
                    padding: const EdgeInsets.only(top: 230, right: 25),
                    child: Container(
                        width: 60,
                        height: 60,
                        decoration: BoxDecoration(
                          color: AppColors.secondaryBlue,
                          borderRadius: BorderRadius.circular(15),
                        ),
                        child: Icon(
                          Icons.video_call,
                          size: 35,
                          color: AppColors.primaryBlue,
                        )),
                  ),
                  Padding(
                    padding: const EdgeInsets.only(top: 230, right: 25),
                    child: Container(
                        width: 60,
                        height: 60,
                        decoration: BoxDecoration(
                          color: AppColors.secondaryBlue,
                          borderRadius: BorderRadius.circular(15),
                        ),
                        child: Icon(
                          Icons.volume_up_rounded,
                          size: 35,
                          color: AppColors.primaryBlue,
                        )),
                  ),
                  Padding(
                    padding: EdgeInsets.only(top: 230),
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
                ]),
          ]),
        ),
      ),
    );
  }
}