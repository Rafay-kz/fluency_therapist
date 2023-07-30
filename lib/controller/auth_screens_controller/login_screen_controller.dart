import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:fluency_therapist/core/database.dart';
import 'package:fluency_therapist/model/user_model.dart';
import 'package:fluency_therapist/utils/user_session.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:google_sign_in/google_sign_in.dart';

import '../../utils/app_constants.dart';
import '../../utils/utills.dart';

//created by Bilal on 10-5-2023

class LoginScreenController extends GetxController {
  final GoogleSignIn _googleSignIn = GoogleSignIn();


  final FirebaseFirestore _firestore = FirebaseFirestore.instance;
  final formKey = GlobalKey<FormState>();
  RxBool isLoading = false.obs;


  TextEditingController emailTEController = TextEditingController();
  TextEditingController passwordTEController = TextEditingController();
  RxBool obscureText = true.obs;
  RxBool isLoggedIn = false.obs;

  var email = '';
  var password = '';

  Database database = Database();
  UserModel userModel=UserModel.empty();
  UserSession userSession=UserSession();

  String? validateEmail(String value) {
    if (!GetUtils.isEmail(value)) {
      return 'Provide valid email';
    }
    return null;
  }

  String? validatePassword(String value) {
    if (value.length < 6) {
      return 'Password must be of 6 characters';
    }
    return null;
  }


  Future<void> onLoginTap() async {
    if (formKey.currentState!.validate()) {

     userModel=await database.loginUser(emailTEController.text.toString(), passwordTEController.text.toString());
     if(userModel.errorMsg==''){
        await userSession.setLogin();
       userSession.userInformation(userModel: userModel);
       Get.offAllNamed(kHomeScreen);
     }else if(userModel.errorMsg!=''&&userModel.errorMsg=='Email is Not Verified'){
       // Email not verified, navigate to verification screen
       Utils().toastMessage(userModel.errorMsg);
       Get.toNamed(kEmailVerificationScreen);
     }else{
       Utils().toastMessage(userModel.errorMsg);
     }


    }
  }

  Future<void> signInWithGoogle(BuildContext context) async {
    try {
      final GoogleSignInAccount? googleUser = await GoogleSignIn().signIn();
      if (googleUser == null) {
        // User canceled the sign-in
        return;
      }

      final GoogleSignInAuthentication googleAuth = await googleUser.authentication;

      final AuthCredential credential = GoogleAuthProvider.credential(
        accessToken: googleAuth.accessToken,
        idToken: googleAuth.idToken,
      );

      final UserCredential userCredential =
      await FirebaseAuth.instance.signInWithCredential(credential);

      final User? user = userCredential.user;

      if (user != null) {
        if (user.emailVerified) {
          // User is verified
          UserSession userSession = UserSession();
          await userSession.setLogin();
          Get.offAllNamed(kHomeScreen);
        } else {
          Get.toNamed(kEmailVerificationScreen);
        }

        ScaffoldMessenger.of(context).showSnackBar(
          SnackBar(content: Text('Signed in successfully: ${user.displayName ?? 'User'}')),
        );
      } else {
        // Handle null user
        ScaffoldMessenger.of(context).showSnackBar(
          SnackBar(content: Text('Failed to sign in. Please try again later.')),
        );
      }
    } catch (error) {
      // Handle specific exceptions here
      print('Exception occurred: $error');
      ScaffoldMessenger.of(context).showSnackBar(
        SnackBar(content: Text('Failed to sign in: $error')),
      );
    }
  }




}
