import 'dart:async';

import 'package:firebase_auth/firebase_auth.dart';
import 'package:fluency_therapist/utils/utills.dart';
import 'package:get/get.dart';


class EmailVerificationScreenController extends GetxController{


  Future<void> resendEmailVerification() async {
    try {
      User? user = FirebaseAuth.instance.currentUser;
      if (user != null && !user.emailVerified) {
        await user.sendEmailVerification();
      }
    } catch (error) {
      Utils().toastMessage(error.toString());
    }
  }
  


}