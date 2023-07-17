import 'package:firebase_auth/firebase_auth.dart';
import 'package:fluency_therapist/controller/auth_screens_controller/user_session.dart';
import 'package:fluency_therapist/utils/utills.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../../utils/app_constants.dart';

//created by Bilal on 10-5-2023

class LoginScreenController extends GetxController {
  final formKey = GlobalKey<FormState>();
  TextEditingController emailTEController = TextEditingController();
  TextEditingController passwordTEController = TextEditingController();
  RxBool obscureText = true.obs;
  RxBool isLoggedIn = false.obs;


  var email = '';
  var password = '';
  //final _auth = FirebaseAuth.instance;

  String? validateEmail(String value) {
    if (!GetUtils.isEmail(value)) {
      return 'Provide valid email';
    }
    return null;
  }

  String? validatePassword(String value) {
    if (value.length < 6) {
      return 'Password must be of 6 characters';
    }
    return null;
  }

  Future<void> onLoginTap() async {
    if (formKey.currentState!.validate()) {
      try {
        final userCredential = await FirebaseAuth.instance
            .signInWithEmailAndPassword(
          email: emailTEController.text.toString(),
          password: passwordTEController.text.toString(),
        );

        if (userCredential.user != null) {
          if (userCredential.user!.emailVerified) {
            // User is verified
            UserSession userSession = UserSession();
            await userSession.setLogin();
            Get.offAllNamed(kHomeScreen);
          } else {
            Get.toNamed(kEmailVerificationScreen);
          }
        }
      } catch (error) {
        Utils().toastMessage(error.toString());
      }
    } else {
      // Handle form validation errors if needed
    }
  }
}