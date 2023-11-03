
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
              return Center(
                child: CircularProgressIndicator(),
              );
            } else if (snapshot.hasError) {
              return Center(
                child: Text('Error: ${snapshot.error}'),
              );
            } else {
              return ZegoUIKitPrebuiltCall(
                appSign: "02c7e54412ee3fa49fe967537819ec3afe59d4a76ba99834dec88f87ddc36e67",
                appID: 718328905,
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
