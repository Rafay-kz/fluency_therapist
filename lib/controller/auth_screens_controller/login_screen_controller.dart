import 'package:firebase_auth/firebase_auth.dart';
import 'package:firebase_core/firebase_core.dart';
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

  var email = '';
  var password = '';
  final _auth = FirebaseAuth.instance;


  @override
  void onClose() {
    emailTEController.dispose();
    passwordTEController.dispose();
  }

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

  void onLoginTap() {

    if (formKey.currentState!.validate()) {

      _auth
          .createUserWithEmailAndPassword(
          email: emailTEController.text.toString(),
          password: passwordTEController.text.toString())
          .then((value) {
        formKey.currentState!.save();

        Get.toNamed(kHomeScreen);



      }).catchError((error) {
        Utils().toastMessage(error.toString());
      });
    } else {
      // Handle form validation errors if needed
    }
  }



}
