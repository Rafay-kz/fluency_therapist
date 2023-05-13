import 'package:flutter/material.dart';
import 'package:get/get.dart';

class ForgetPassScreenController extends GetxController {
  TextEditingController emailTEController = TextEditingController();
  void onLoginTap() {

    GetUtils.isEmail(emailTEController.text)
        ?  print('Valid')
        :  print('Invalid Email'); }


}