import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:fluency_therapist/controller/auth_screens_controller/user_session.dart';
import 'package:fluency_therapist/utils/utills.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:google_sign_in/google_sign_in.dart';

import '../../utils/app_constants.dart';

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
  final _auth = FirebaseAuth.instance;

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

  Future<void> saveUserDetails(
      String username, String age, String email) async {
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

  Future<void> onLoginTap() async {

    if (formKey.currentState!.validate()) {
     
      try {
        final userCredential =
            await FirebaseAuth.instance.signInWithEmailAndPassword(
          email: emailTEController.text.toString(),
          password: passwordTEController.text.toString(),
        );

        if (userCredential.user != null) {
          if (userCredential.user!.emailVerified) {
            // User is verified
            UserSession userSession = UserSession();
            await userSession.setLogin();
            Get.offAllNamed(kHomeScreen);
          } else {
            Get.toNamed(kEmailVerificationScreen);
          }
        }
      } catch (error) {
        Utils().toastMessage(error.toString());
      }
    } else {
      // Handle form validation errors if needed
    }
  }

  Future<void> signInWithGoogle(BuildContext context) async {


    try {

      final GoogleSignInAccount? googleUser = await GoogleSignIn().signIn();
      final GoogleSignInAuthentication googleAuth =
          await googleUser!.authentication;

      final AuthCredential credential = GoogleAuthProvider.credential(
        accessToken: googleAuth.accessToken,
        idToken: googleAuth.idToken,
      );

      final UserCredential userCredential =
          await FirebaseAuth.instance.signInWithCredential(credential);

      final User? user = userCredential.user;
      if (userCredential.user!.emailVerified) {
        // User is verified
        UserSession userSession = UserSession();
        await userSession.setLogin();
        Get.offAllNamed(kHomeScreen);
      } else {
        Get.toNamed(kEmailVerificationScreen);
      }

      ScaffoldMessenger.of(context).showSnackBar(
        SnackBar(content: Text('Signed in successfully: ${user!.displayName}')),
      );

    } catch (error) {
      ScaffoldMessenger.of(context).showSnackBar(
        SnackBar(content: Text('Failed to sign in: $error')),
      );
    }


  }



}
