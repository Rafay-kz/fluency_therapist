import 'package:fluency_therapist/utils/app_constants.dart';
import 'package:fluency_therapist/utils/route_management.dart';
import 'package:fluency_therapist/utils/theme.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

//created by Abdul Rafay on 1-5-2023
void main() async{
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});
  @override
  Widget build(BuildContext context) {
    return GetMaterialApp(
      debugShowCheckedModeBanner: false,
      title: kAppName,
      theme: AppTheme.myTheme,
      getPages: RouteGenerator.getPages(),
      initialRoute: kSplashScreen,
    );
  }
}
