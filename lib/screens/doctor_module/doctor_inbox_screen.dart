import 'package:cached_network_image/cached_network_image.dart';
import 'package:fluency_therapist/utils/app_colors.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../../../controller/user_screens_controller/home_screens_controller/inbox_screen_controller.dart';
import '../../../utils/app_constants.dart';
import '../../controller/doctor_screens_controller/doctor_inbox_screen_controller.dart';
import '../user_module/home_screens/call_log_screen.dart';




class DoctorInboxScreen extends GetView<DoctorInboxScreenController> {
  const DoctorInboxScreen({Key? key}) : super(key: key);

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
                    padding: EdgeInsets.only(top: 10, right: 48, left: 48),
                    child: Center(
                      child: Image(
                        image: AssetImage(logoIcon),
                        width: screenWidth * 0.42,
                        height: screenHeight * 0.075,
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
                padding:
                EdgeInsets.only(top: 16, left: 16, right: 16, bottom: 20),
                child: TextField(
                  decoration: InputDecoration(
                    hintText: "Search...",
                    hintStyle: Theme.of(context)
                        .textTheme
                        .headlineSmall!
                        .copyWith(
                        fontSize: screenWidth * 0.042,
                        color: AppColors.textHintColor),
                    prefixIcon: Padding(
                      padding: const EdgeInsets.only(left: 20, right: 10),
                      child: Icon(
                        Icons.search_sharp,
                        size: screenWidth * 0.075,
                        color: AppColors.textHintColor,
                      ),
                    ),
                    filled: true,
                    fillColor: AppColors.textfieldColor,
                    enabledBorder: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(40),
                      borderSide: BorderSide(
                        color: Colors.grey.shade100,
                      ),
                    ),
                  ),
                ),
              ),
              Expanded(
                child: ListView.builder(
                  itemCount: 10,
                  itemBuilder: (context, index) {
                    return ListTile(
                      leading: const CircleAvatar(
                        radius: 30,
                        backgroundImage: NetworkImage(
                          'https://via.placeholder.com/150',
                        ),
                      ),
                      title: Text('User $index', style: Theme.of(context)
                          .textTheme
                          .displayLarge!
                          .copyWith(fontSize: screenWidth * 0.042),
                      ),
                      subtitle: Text('Message $index', style:Theme.of(context)
                          .textTheme
                          .headlineSmall!
                          .copyWith(
                          fontSize: screenWidth * 0.035,
                          color: AppColors.textHintColor),),
                      trailing: Text('10:00 AM',style: Theme.of(context)
                          .textTheme
                          .headlineSmall!
                          .copyWith(
                          fontSize: screenWidth * 0.032,
                          color: AppColors.textHintColor),),
                    );
                  },
                ),
              ),
            ],
          ),
        ),
      ),
      bottomNavigationBar: BottomNavigationBar(
        items:  <BottomNavigationBarItem>[BottomNavigationBarItem(
          icon: InkWell(
              onTap:() { Get.toNamed(kChatWithConsultantScreen); },
              child: Icon(Icons.message)),
          label: 'Message',
        ),
          BottomNavigationBarItem(
            icon: InkWell(
                onTap:() { Get.to(CallLogScreen()); },
                child: Icon(Icons.phone)),
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
            color: AppColors.textHintColor),
      ),
    );
  }
}
