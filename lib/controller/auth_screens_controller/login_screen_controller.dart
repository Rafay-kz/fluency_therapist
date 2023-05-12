import 'package:flutter/material.dart';
import 'package:get/get.dart';

//created by Bilal on 10-5-2023

class LoginScreenController extends GetxController {
  TextEditingController emailTEController = TextEditingController();
  TextEditingController passwordTEController = TextEditingController();

  RxBool obscureText = false.obs;

  void onLoginTap() {

    GetUtils.isEmail(emailTEController.text)
        ? print('Valid')
        : print('Invalid Email');
    GetUtils.isAlphabetOnly(passwordTEController.text)
        ? print('Valid ')
        : print('invalid Password');


  }
}
