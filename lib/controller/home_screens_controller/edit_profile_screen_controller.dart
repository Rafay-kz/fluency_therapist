import 'package:flutter/cupertino.dart';
import 'package:get/get.dart';

class EditProfileScreenController extends GetxController{
  TextEditingController nameTEController = TextEditingController();
  TextEditingController emailTEController = TextEditingController();
  TextEditingController passwordTEController = TextEditingController();


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

  }



}