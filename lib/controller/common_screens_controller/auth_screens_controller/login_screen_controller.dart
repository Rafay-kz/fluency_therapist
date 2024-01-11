
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:fluency_therapist/core/database.dart';
import 'package:fluency_therapist/model/user_model.dart';
import 'package:fluency_therapist/utils/notification_services.dart';
import 'package:fluency_therapist/utils/user_session.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:google_sign_in/google_sign_in.dart';

import '../../../custom widgets/progress_indicator.dart';
import '../../../model/doctor_model.dart';
import '../../../utils/app_constants.dart';
import '../../../utils/utills.dart';



//created by Bilal on 10-5-2023

class LoginScreenController extends GetxController {
  final GoogleSignIn _googleSignIn = GoogleSignIn();
  Rx<DoctorModel> doctorModel = DoctorModel.empty().obs;

  final FirebaseFirestore _firestore = FirebaseFirestore.instance;
  final formKey = GlobalKey<FormState>();

  TextEditingController emailTEController = TextEditingController();
  TextEditingController passwordTEController = TextEditingController();
  RxBool obscureText = true.obs;
  RxBool isLoggedIn = false.obs;

  var email = '';
  var password = '';

  Database database = Database();
  UserModel userModel = UserModel.empty();
  UserSession userSession = UserSession();
  NotificationServices notificationServices = NotificationServices();

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
    ProgressDialog pd = ProgressDialog();
    if (formKey.currentState!.validate()) {
      pd.showDialog();
      dynamic response = await database.loginUser(
          emailTEController.text.toString(),
          passwordTEController.text.toString());
      pd.dismissDialog();

      print('Login Response: $response'); // Add this line

      if (response is UserModel) {
        print('User Login');
        String? newToken = await notificationServices.getDeviceToken();
        if (newToken != null) {
          // Update the database with the new device token for the logged-in doctor
          await notificationServices.updateUserToken(response.id, newToken);
        }
        if (response.errorMsg == 'Email is Not Verified') {
          print('Email is Not Verified');
          Get.toNamed(kEmailVerificationScreen);
        } else if (response.errorMsg == '') {
          print('Login successful');
          await userSession.setLogin();
          userSession.userInformation(userModel: response);
          Get.offAllNamed(kHomeScreen);
        } else {
          Utils().toastMessage(response.errorMsg);
        }
      } else if (response is DoctorModel) {
        print('Doctor Login');

        String? newToken = await notificationServices.getDeviceToken();
        if (newToken != null) {
          // Update the database with the new device token for the logged-in doctor
          await notificationServices.updateDoctorToken(response.id, newToken);
        }
        // Note: No need to check for 'Profile not set up' or 'Email is Not Verified'
        // as the modified loginUser method always returns DoctorModel
        print('Login successful');
        await userSession.setLogin();
        userSession.setIsDoctor();
        userSession.doctorInformation(doctorModel: response);
        if (response.errorMsg == 'Email is Not Verified') {
          print('Email is Not Verified');
          Get.toNamed(kEmailVerificationScreen); }
        else if (response.isProfileSetUp == true) {
          print('Doctor Profile is set up');
          Get.offAllNamed(kDoctorHomeScreen);
        } else {
          print('Doctor Profile is not set up');
          Get.toNamed(kDoctorProfileSetUpScreen);
        }}
       else {
        Utils().toastMessage(response.errorMsg);
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

      final GoogleSignInAuthentication googleAuth =
      await googleUser.authentication;

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
          userModel.email = user.email ?? '';
          userModel.id = user.uid ?? '';
          userModel.image = user.photoURL ?? '';
          userModel.firstName = user.displayName ?? '';
          userModel.lastName = user.displayName ?? '';

          userSession.userInformation(userModel: userModel);
          Get.offAllNamed(kHomeScreen);
        } else {
          Get.toNamed(kEmailVerificationScreen);
        }

        // Show success snackbar
        Get.snackbar(
          'Success',
          'Signed in successfully: ${user.displayName ?? 'User'}',
          backgroundColor: Colors.white,
          colorText: Colors.green,
        );
      } else {
        // Handle null user
        Get.snackbar(
          'Error',
          'Failed to sign in. Please try again later.',
          backgroundColor: Colors.red,
          colorText: Colors.white,
        );
      }
    } catch (error) {
      // Handle specific exceptions here
      print('Exception occurred: $error');
      Get.snackbar(
        'Error',
        'Failed to sign in: $error',
        backgroundColor: Colors.red,
        colorText: Colors.white,
      );
    }
  }
}
