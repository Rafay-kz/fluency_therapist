
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:zego_uikit_prebuilt_call/zego_uikit_prebuilt_call.dart';

import '../../../controller/user_screens_controller/home_screens_controller/video_call_screen_controller.dart';
import '../../../utils/app_colors.dart';


class VideoCallScreen extends GetView<VideoCallScreenController> {
  const VideoCallScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final screenWidth = MediaQuery.of(context).size.width;
    final screenHeight = MediaQuery.of(context).size.height;
    return  Scaffold(
      backgroundColor: AppColors.backgroundColor,
      body: SafeArea(
        child: ZegoUIKitPrebuiltCall(
          appSign:"54af721df83d1ec78fe57c966043a8ecf4433e79836acc70b7b858c54902b81a" ,
          appID:281108079,
          config:ZegoUIKitPrebuiltCallConfig.oneOnOneVideoCall()..onOnlySelfInRoom = (context) => Navigator.pop(context),
          callID:'callID' ,
          userName: "taha 2",
          userID: "12345",
        ),
      ),
    );
  }
}