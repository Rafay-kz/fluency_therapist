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

 @override
  void onClose() {
 emailTEController.dispose();
 passwordTEController.dispose();
  }

String ? validateEmail (String value) {
   if(!GetUtils.isEmail(value)) {
     return 'Provide valid email';
   }
   return null;
}

  String ? validatePassword (String value) {
    if(value.length < 6) {
      return 'Password must be of 6 characters';
    }
    return null;
  }

  void onLoginTap() {
    if (formKey.currentState!.validate()) {
      formKey.currentState!.save();
      Get.toNamed(kHomeScreen);
    } else {
      // Form is invalid, display error messages or take appropriate actions
    }
  }



}
