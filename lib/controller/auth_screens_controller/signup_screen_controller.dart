import 'package:flutter/material.dart';
import 'package:get/get.dart';

//created by Bilal on 6-5-2023



class SignupScreenController extends GetxController{

  TextEditingController nameTEController = TextEditingController();
  TextEditingController emailTEController = TextEditingController();
  TextEditingController passwordTEController = TextEditingController();
  TextEditingController confirmPasswordTEController = TextEditingController();
  TextEditingController ageTEController = TextEditingController();

  RxBool obscureText=true.obs;




  void onRegisterTap(){
    GetUtils.isAlphabetOnly(
      nameTEController.text,
    )
        ? print('valid')
        : print('invalid Name');
    GetUtils.isEmail(emailTEController.text)
        ? print('Valid')
        : print('Invalid Email');
    GetUtils.isAlphabetOnly(
        passwordTEController.text)
        ? print('Valid ')
        : print('invalid Password');
    GetUtils.hasMatch(
        confirmPasswordTEController.text,
        passwordTEController.text)
        ? print('Valid')
        : print('invalid Password');
    GetUtils.isLengthLessThan(
        ageTEController.value, 50)
        ? print('valid')
        : print('invalid age');

  }



}