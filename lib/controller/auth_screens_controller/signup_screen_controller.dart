import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:get/get.dart';
import 'package:fluency_therapist/utils/app_constants.dart';
import 'package:flutter/material.dart';

import '../../utils/utills.dart';

class SignupScreenController extends GetxController {
  final FirebaseAuth _auth = FirebaseAuth.instance;
  final FirebaseFirestore _firestore = FirebaseFirestore.instance;
  final formKey = GlobalKey<FormState>();
   late RxBool loading ;

  TextEditingController nameTEController = TextEditingController();
  TextEditingController emailTEController = TextEditingController();
  TextEditingController passwordTEController = TextEditingController();
  TextEditingController confirmPasswordTEController = TextEditingController();
  TextEditingController ageTEController = TextEditingController();


  RxBool obscureText = true.obs;

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

  Future<void> saveUserDetails(String username, String age, String email) async {
    try {
      await _firestore.collection('users').add({
        'username': username,
        'age': age,
        'email': email,
      });
      // Data saved successfully
    } catch (e) {
      // Handle error
      print('Error saving user details: $e');
    }
  }

  Future<void> signUp() async {
   if (formKey.currentState!.validate()) {
   try {
   UserCredential userCredential = await _auth.createUserWithEmailAndPassword(
   email: emailTEController.text.toString(),
   password: passwordTEController.text.toString(),
   );
   if (userCredential != null) {
     await userCredential.user!.sendEmailVerification();
     Get.offAllNamed(kEmailVerificationScreen);
     saveUserDetails(
         nameTEController.text.toString(),
         ageTEController.text.toString(),
         emailTEController.text.toString());
   }
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


