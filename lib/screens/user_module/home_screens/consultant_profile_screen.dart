import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import '../../../controller/user_screens_controller/home_screens_controller/consultant_profile_screen_controller.dart';
import '../../../custom widgets/button.dart';
import '../../../utils/app_colors.dart';
import '../../../utils/app_constants.dart';




class ConsultantProfileScreen extends GetView<ConsultantProfileScreenController> {
  const ConsultantProfileScreen({super.key});

  @override
  Widget build(BuildContext context) {


    final screenWidth = MediaQuery.of(context).size.width*0.88;
    final screenHeight = MediaQuery.of(context).size.height*0.88;
    return Scaffold(
      backgroundColor: AppColors.backgroundColor,
      body: SafeArea(
        child: Padding(
          padding: EdgeInsets.symmetric(horizontal: screenWidth * 0.05),
          child: Column(

            children: [
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  InkWell(
                    onTap: () {
                      Get.back();
                    },
                    child: Icon(
                      Icons.arrow_back,
                      size: screenWidth*0.10,
                    ),
                  ),
                  Padding(
                    padding:  EdgeInsets.only(top: screenWidth*0.02),
                    child: Center(
                      child: Image(
                        image: const AssetImage(logoIcon),
                        width: screenWidth * 0.42,
                        height: screenHeight * 0.070,
                      ),
                    ),
                  ),
                  Obx(
                        () => CircleAvatar(
                      radius:  screenWidth * 0.057,
                      backgroundImage: () {
                        // Check if userModel is empty, indicating doctorModel is active
                        if (controller.userModel.value.image.isEmpty) {
                          return controller.currentDoctorModel.value.image.isNotEmpty
                              ? CachedNetworkImageProvider(controller.currentDoctorModel.value.image)
                              : const AssetImage('assets/images/person.png') as ImageProvider;
                        } else {
                          // userModel is present, indicating a non-doctor user
                          return controller.userModel.value.image.isNotEmpty
                              ? CachedNetworkImageProvider(controller.userModel.value.image)
                              : const AssetImage('assets/images/person.png') as ImageProvider;
                        }
                      }(),
                    ),
                  ),


                ],
              ),
               SizedBox(height: screenHeight*0.04),
               Obx (()=>
                  CircleAvatar(
                   radius: screenWidth*0.20,
                   backgroundImage: controller.doctorModel.value.image!=''
                  ? CachedNetworkImageProvider(
                  controller.doctorModel.value.image
                  )
                       : const AssetImage('assets/images/person.png') as ImageProvider
                 ),
               ),
              Text(
                "\n Dr. ${controller.doctorModel.value.firstName} ${controller.doctorModel.value.lastName}",
                style: Theme.of(context).textTheme.displayLarge!.copyWith(
                      fontSize: screenWidth*0.055,
                      color: AppColors.textColor,
                    ),
              ),
              SizedBox(height: screenHeight*0.004),
              Text(
                controller.doctorModel.value.specialization,
                style: Theme.of(context).textTheme.headlineSmall!.copyWith(
                      fontSize: screenWidth*0.035,
                      color: AppColors.descriptionColor,
                    ),
              ),
              SizedBox(height: screenHeight*0.03),

              Container(
                width: screenWidth,
                decoration: BoxDecoration(
                  color: AppColors.secondaryBlue,
                  borderRadius: BorderRadius.circular(20),
                ),
                child: Padding(
                  padding: EdgeInsets.all(screenWidth * 0.05),
                  child: Row(

                    children: [
                      Icon(
                        Icons.info_outlined,
                        color: AppColors.primaryBlue,
                        size: screenWidth * 0.1,
                      ),
                      SizedBox(width: screenWidth * 0.03), // Add some space between icon and text
                      Expanded(
                        child: Text(
                          controller.doctorModel.value.bio,
                          style: Theme.of(context).textTheme.headlineSmall!.copyWith(
                            fontSize: screenWidth * 0.032,
                            color: AppColors.pastelBlack,
                          ),
                          textAlign: TextAlign.start,
                        ),
                      ),
                    ],
                  ),
                ),
              ),
            SizedBox(height: screenHeight*0.03,),
            InkWell(
              onTap: () {
                Get.toNamed(kAppointmentBookingScreen, arguments: controller.doctorModel.value);
              },
              child: Container(
                width: screenWidth,
                padding: EdgeInsets.all(screenWidth * 0.05),
                decoration: BoxDecoration(
                  color: AppColors.secondaryBlue,
                  borderRadius: BorderRadius.circular(20),
                ),
                child: Row(
                  children: [
                    Icon(
                      Icons.calendar_month_outlined,
                      size: screenWidth * 0.093,
                      color: AppColors.primaryBlue,
                    ),
                    SizedBox(width: screenWidth * 0.03),
                    Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(
                          "Availability",
                          style: Theme.of(context).textTheme.displayLarge!.copyWith(
                            fontSize: screenWidth*0.040,
                            color: AppColors.textColor,
                          ),
                        ),
                        SizedBox(height: screenWidth * 0.005),

                        Text(
                          "Tap here to see",
                          style: Theme.of(context).textTheme.displayLarge!.copyWith(
                            fontSize: screenWidth*0.030,
                            color: AppColors.descriptionColor,
                          ),
                        ),
                      ],
                    ),
                  ],
                ),
              ),
            ),

              SizedBox(height: screenHeight*0.03,),

            Container(
              width: screenWidth,
              padding: EdgeInsets.all(screenWidth * 0.05),

              decoration: BoxDecoration(
                color: AppColors.secondaryBlue,
                borderRadius: BorderRadius.circular(20),
              ),
              child: Row(
                children: [
                  Icon(
                    Icons.location_on_outlined,
                    size: screenWidth * 0.10,
                    color: AppColors.primaryBlue,
                  ),
                  SizedBox(width: screenWidth * 0.03),

                  Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        "Location",
                        style: Theme.of(context).textTheme.displayLarge!.copyWith(
                          fontSize: screenWidth*0.040,
                          color: AppColors.textColor,
                        ),
                      ),
                      SizedBox(height: screenWidth * 0.005),

                      Text(
                        controller.doctorModel.value.location,
                        style: Theme.of(context).textTheme.displayLarge!.copyWith(
                          fontSize: screenWidth*0.030,
                          color: AppColors.descriptionColor,
                        ),
                      ),
                    ],
                  ),
                ],
              ),
            ),
              SizedBox(height: screenHeight*0.08,),

              Obx(
                    () {
                  if (controller.userModel.value == null || controller.userModel.value.id.isEmpty) {
                    return const SizedBox(); // Return an empty widget when userModel is empty or null
                  } else {
                    return Button(
                      onPressed: () {
                        Get.toNamed(kAppointmentBookingScreen, arguments: controller.doctorModel.value);
                      },
                      text: "Book an Appointment",
                    );
                  }
                },
              )
            ],
          ),
        ),
      ),
    );
  }
}
