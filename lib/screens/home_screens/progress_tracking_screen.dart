import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:percent_indicator/circular_percent_indicator.dart';

import '../../utils/app_colors.dart';
import '../../utils/app_constants.dart';

class ProgressTrackingScreen extends GetView<ProgressTrackingScreen> {
  const ProgressTrackingScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final screenWidth = MediaQuery.of(context).size.width;
    final screenHeight = MediaQuery.of(context).size.height;
    return Scaffold(
        backgroundColor: AppColors.backgroundColor,
        body: SafeArea(
        child: Padding(
          padding: const EdgeInsets.only(top: 15, right: 25, left: 25),
          child: Column(children: [
            Row(
              children: [
                InkWell(
                  onTap: () {
                    Get.back();
                  },
                  child:  Icon(
                    Icons.arrow_back,
                    size: screenWidth*0.10,
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.only(top: 10, right: 38, left: 38),
                  child: Center(
                    child: Image(
                      image: const AssetImage(logoIcon),
                      height: screenHeight * 0.075,
                      width: screenWidth * 0.42,),
                  ),
                ),
                CircleAvatar(
                  radius:screenWidth*0.06,

                ),

              ],
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.start,
              children: [
                Padding(
                  padding: const EdgeInsets.only(top: 20,  left:12),
                  child: Text("Progress Tracking",
                      style: Theme.of(context)
                          .textTheme
                          .displayLarge!
                          .copyWith(fontSize: 18)),
                ),
              ],
            ),
            Padding(
              padding: const EdgeInsets.only(top: 20, bottom: 20),
              child: Container(
                width: screenWidth*0.82,
                height: screenHeight*0.32,
                decoration: BoxDecoration(
                    color: AppColors.secondaryBlue,
                    borderRadius: BorderRadius.circular(40)),
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    new CircularPercentIndicator(
                      radius: screenWidth*0.25,
                      lineWidth: 18.0,
                      animation: true,
                      percent: 0.7,
                      center: Column(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          new Text(
                            "70.0%",
                            style:
                             Theme.of(context)
                                .textTheme
                                .displayLarge!
                                .copyWith(fontSize: screenWidth * 0.092),

                          ),
                          new Text(
                            "Total Progress%",
                            style:
                            Theme.of(context)
                                .textTheme
                                .displayLarge!
                                .copyWith(fontSize: screenWidth * 0.034),

                          ),
                        ],
                      ),


                      circularStrokeCap: CircularStrokeCap.round,
                      progressColor: AppColors.primaryBlue,
                      backgroundColor: AppColors.secondaryBlue,
                    ),
                  ],
                ),
              ),
            ),
          Row(
            mainAxisAlignment: MainAxisAlignment.center,
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
            Container(
              width: screenWidth*0.36,
              height: screenHeight*0.18,
              decoration: BoxDecoration(
                  color: AppColors.secondaryBlue,
                  borderRadius: BorderRadius.circular(30)),
            child: Expanded(
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  new CircularPercentIndicator(
                    radius: screenWidth*0.09,
                    lineWidth: 9.0,
                    animation: true,
                    percent: 0.43,
                    center: new Text(
                      "43.0%",
                      style:
                      Theme.of(context)
                          .textTheme
                          .displayLarge!
                          .copyWith(fontSize: screenWidth * 0.035),

                    ),
                    circularStrokeCap: CircularStrokeCap.round,
                    progressColor: AppColors.primaryBlue,
                    backgroundColor: AppColors.secondaryBlue,



                  ),
                  Padding(
                    padding: const EdgeInsets.only(top: 5),
                    child: Text("Speak Slow\nAnd Easy", textAlign: TextAlign.center, style:Theme.of(context)
                        .textTheme
                        .displayLarge!
                        .copyWith(fontSize: screenWidth * 0.035) ,),
                  ),
                ],
              ),
            ),),

            SizedBox(width: 30,),

              Container(
                width: screenWidth*0.36,
                height: screenHeight*0.18,
                decoration: BoxDecoration(
                    color: AppColors.secondaryBlue,
                    borderRadius: BorderRadius.circular(30)),
                child: Expanded(
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      new CircularPercentIndicator(
                        radius: screenWidth*0.09,
                        lineWidth: 9.0,
                        animation: true,
                        percent: 0.53,
                        center: new Text(
                          "53.0%",
                          style:
                          Theme.of(context)
                              .textTheme
                              .displayLarge!
                              .copyWith(fontSize: screenWidth * 0.035),

                        ),
                        circularStrokeCap: CircularStrokeCap.round,
                        progressColor: AppColors.primaryBlue,
                        backgroundColor: AppColors.secondaryBlue,



                      ),
                      Padding(
                        padding: const EdgeInsets.only(top: 5),
                        child: Text("Stuttering\nLevel 1", textAlign: TextAlign.center, style:Theme.of(context)
                            .textTheme
                            .displayLarge!
                            .copyWith(fontSize: screenWidth * 0.035) ,),
                      ),
                    ],
                  ),
                ),),
          ],),
            SizedBox(height: 20,),
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Container(
                  width: screenWidth*0.36,
                  height: screenHeight*0.18,
                  decoration: BoxDecoration(
                      color: AppColors.secondaryBlue,
                      borderRadius: BorderRadius.circular(30)),
                  child: Expanded(
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        new CircularPercentIndicator(
                          radius: screenWidth*0.09,
                          lineWidth: 9.0,
                          animation: true,
                          percent: 0.23,
                          center: new Text(
                            "23.0%",
                            style:
                            Theme.of(context)
                                .textTheme
                                .displayLarge!
                                .copyWith(fontSize: screenWidth * 0.035),

                          ),
                          circularStrokeCap: CircularStrokeCap.round,
                          progressColor: AppColors.primaryBlue,
                          backgroundColor: AppColors.secondaryBlue,



                        ),
                        Padding(
                          padding: const EdgeInsets.only(top: 5),
                          child: Text("Speak Slow\nAnd Easy", textAlign: TextAlign.center, style:Theme.of(context)
                              .textTheme
                              .displayLarge!
                              .copyWith(fontSize: screenWidth * 0.035) ,),
                        ),
                      ],
                    ),
                  ),),
                SizedBox(width: 30,),

                Container(
                  width: screenWidth*0.36,
                  height: screenHeight*0.18,
                  decoration: BoxDecoration(
                      color: AppColors.secondaryBlue,
                      borderRadius: BorderRadius.circular(30)),
                  child: Expanded(
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        new CircularPercentIndicator(
                          radius: screenWidth*0.09,
                          lineWidth: 9.0,
                          animation: true,
                          percent: 0.75,
                          center: new Text(
                            "75.0%",
                            style:
                            Theme.of(context)
                                .textTheme
                                .displayLarge!
                                .copyWith(fontSize: screenWidth * 0.035),

                          ),
                          circularStrokeCap: CircularStrokeCap.round,
                          progressColor: AppColors.primaryBlue,
                          backgroundColor: AppColors.secondaryBlue,



                        ),
                        Padding(
                          padding: const EdgeInsets.only(top: 5),
                          child: Text("500 words\na day", textAlign: TextAlign.center, style:Theme.of(context)
                              .textTheme
                              .displayLarge!
                              .copyWith(fontSize: screenWidth * 0.035) ,),
                        ),
                      ],
                    ),
                  ),),
              ],)

          ],),
        ),
      ));
  }
}