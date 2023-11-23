import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../../../core/database.dart';


class ForgetPassScreenController extends GetxController {
  final formKey = GlobalKey<FormState>();
  var email = '';
  TextEditingController emailTEController = TextEditingController();
  final auth = FirebaseAuth.instance;




  String? validateEmail(String value) {
    if (!GetUtils.isEmail(value)) {
      Get.snackbar('Error', 'Please provide a valid email');
    }
    return null;
  }


Future<void> onTap () async {
if (formKey.currentState!.validate()) {
    formKey.currentState!.save();
    Database database = Database();
    await database.passwordReset(emailTEController.text.toString());
  }
}
}

