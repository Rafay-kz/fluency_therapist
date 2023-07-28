import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:fluency_therapist/controller/auth_screens_controller/database.dart';
import 'package:get/get.dart';
import 'package:fluency_therapist/utils/app_constants.dart';
import 'package:flutter/material.dart';

import '../../utils/utills.dart';

class SignupScreenController extends GetxController {

  final FirebaseAuth _auth = FirebaseAuth.instance;
  final formKey = GlobalKey<FormState>();
   late RxBool loading ;

  TextEditingController nameTEController = TextEditingController();
  TextEditingController emailTEController = TextEditingController();
  TextEditingController passwordTEController = TextEditingController();
  TextEditingController confirmPasswordTEController = TextEditingController();
  TextEditingController ageTEController = TextEditingController();


  RxBool obscureText = true.obs;

  var isDoctor = false.obs;

  void toggleDoctor(bool value){
    isDoctor.value = value;
  }

  var name = '';
  var email = '';
  var password = '';
  var confirmPassword = '';
  var age = '';

  @override
  void onClose() {
    nameTEController.dispose();
    ageTEController.dispose();
    emailTEController.dispose();
    passwordTEController.dispose();
    confirmPasswordTEController.dispose();
  }

  String? validateName(String value) {
    if (value.isEmpty) {
      return 'Please enter your name';
    }
    if (value.length < 4) {
      return 'Username must be at least 4 letters';
    }
    return null;
  }

  String? validateAge(String value) {
    if (value.isEmpty) {
      return 'Please enter your age';
    }
    if (int.tryParse(value) == null) {
      return 'Age must contain numbers only';
    }
    if (value.length > 3) {
      return 'Please enter a valid age';
    }
    // Additional validation logic for age if needed
    return null;
  }

  String? validateEmail(String value) {
    if (!GetUtils.isEmail(value)) {
      return 'Please provide a valid email';
    }
    return null;
  }

  String? validatePassword(String value) {
    if (value.length < 6) {
      return 'Password must be at least 6 characters';
    }
    return null;
  }

  String? validateConfirmPassword(String value) {
    if (value.isEmpty) {
      return 'Please confirm your password';
    }
    if (value != passwordTEController.text) {
      return 'Passwords do not match';
    }
    return null;
  }




  Future<void> signUp() async {
   if (formKey.currentState!.validate()) {
   try {
   Database database = Database();
    database.createAccount(emailTEController.text.toString(), passwordTEController.text.toString());
     database.saveUserDetails(
         nameTEController.text.toString(),
         ageTEController.text.toString(),
         emailTEController.text.toString());

   } catch (error) {
   Utils().toastMessage(error.toString());
   }
   } else {
   // Handle form validation errors if needed
   }
}

   Future<void> onRegisterTap() async {
    signUp();

   }





}


