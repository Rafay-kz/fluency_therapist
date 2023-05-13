import 'package:flutter/material.dart';
import 'package:get/get.dart';

class CreateNewPasswordScreenController extends GetxController {
  TextEditingController passwordTEController = TextEditingController();
  TextEditingController confirmPasswordTEController = TextEditingController();


  RxBool obscureText = true.obs;


  void onLoginTap() {

    GetUtils.isAlphabetOnly(passwordTEController.text)
        ? print('Valid ')
        : print('invalid Password');
    GetUtils.isAlphabetOnly(confirmPasswordTEController.text)
        ? print('Password matches ')
        : print('Password does not match');


}}