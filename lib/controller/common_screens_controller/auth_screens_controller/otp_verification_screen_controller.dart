import 'package:flutter/material.dart';
import 'package:get/get.dart';

class OtpVerificationScreenController extends GetxController {
  TextEditingController otpTEController = TextEditingController();
  void onLoginTap() {

    GetUtils.isEmail(otpTEController.text)
        ?  print('Valid')
        :  print('Invalid Otp'); }


}