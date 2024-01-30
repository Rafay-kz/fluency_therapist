
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:zego_uikit_prebuilt_call/zego_uikit_prebuilt_call.dart';

import '../../../controller/user_screens_controller/home_screens_controller/video_call_screen_controller.dart';
import '../../../utils/app_colors.dart';


class VideoCallScreen extends GetView<VideoCallScreenController> {
  const VideoCallScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColors.backgroundColor,
      body: SafeArea(
        child: FutureBuilder<void>(
          future: controller.initializeData(),
          builder: (context, snapshot) {
            if (snapshot.connectionState == ConnectionState.waiting) {
              return  const Center(
                child: CircularProgressIndicator(),
              );
            } else if (snapshot.hasError) {
              return Center(
                child: Text('Error: ${snapshot.error}'),
              );
            } else {
              return ZegoUIKitPrebuiltCall(
                appSign: "5d75b32dc520b58092df25c969b2e8ee8e33de816f00263c6ffac52864cfecd5",
                appID: 888106837,
                config: ZegoUIKitPrebuiltCallConfig.oneOnOneVideoCall()
                  ..onOnlySelfInRoom = (context) => Navigator.pop(context),
                callID: '${controller.callId}',
                userName: controller.userName,
                userID: controller.userId,
              );
            }
          },
        ),
      ),
    );
  }
}
