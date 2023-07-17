import 'package:firebase_auth/firebase_auth.dart';
import 'package:fluency_therapist/utils/app_constants.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../../utils/utills.dart';

class ForgetPassScreenController extends GetxController {
  final formKey = GlobalKey<FormState>();
  var email = '';
  TextEditingController emailTEController = TextEditingController();
  final auth = FirebaseAuth.instance;


  String? validateEmail(String value) {
    if (!GetUtils.isEmail(value)) {
      return 'Please provide a valid email';
    }
    return null;
  }

  Future<void> passwordReset() async {
    auth.sendPasswordResetEmail(email: emailTEController.text.toString()).then((value) {
      Utils().toastMessage2("Check your email to reset your password and log in");
      Get.offAllNamed(kLoginScreen);

    }).onError((error, stackTrace) {
      Utils().toastMessage(error.toString());
    });

  }



void onTap () {
if (formKey.currentState!.validate()) {
    formKey.currentState!.save();
    passwordReset();
  }
}
}

