import 'dart:io';

import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:firebase_storage/firebase_storage.dart';
import 'package:fluency_therapist/controller/doctor_screens_controller/doctor_edit_profile_screen_controller.dart';
import 'package:fluency_therapist/utils/user_session.dart';
import 'package:get/get.dart';
import 'package:get/get_core/src/get_main.dart';
import 'package:image_picker/image_picker.dart';

import '../controller/doctor_screens_controller/doctor_home_screen_controller.dart';
import '../custom widgets/progress_indicator.dart';
import '../model/doctor_model.dart';
import '../model/user_model.dart';
import '../utils/app_constants.dart';
import '../utils/utills.dart';

class Database {
  final FirebaseAuth _auth = FirebaseAuth.instance;
  final FirebaseFirestore _firestore = FirebaseFirestore.instance;
  DoctorHomeScreenController doctorhomeScreenController =
      Get.find(tag: kDoctorHomeScreenController);

  UserSession userSession = UserSession();

//For registering regular users on sign up screen
  Future<void> createAccount(String email, String password) async {
    UserCredential userCredential = await _auth.createUserWithEmailAndPassword(
        email: email, password: password);
    if (userCredential != null) {
      await userCredential.user!.sendEmailVerification();
      Get.offAllNamed(kEmailVerificationScreen);
    }
  }

  //To Log in users and Doctor users
  Future<dynamic> loginUser(String email, password) async {
    try {
      final userCredential =
          await FirebaseAuth.instance.signInWithEmailAndPassword(
        email: email,
        password: password,
      );

      if (userCredential.user != null) {
        if (userCredential.user!.emailVerified) {
          // Check if the user is a normal user
          DocumentSnapshot userSnapshot = await FirebaseFirestore.instance
              .collection('users')
              .doc(userCredential.user!.uid)
              .get();

          if (userSnapshot.exists) {
            // User is a normal user
            Map<String, dynamic> map =
                userSnapshot.data() as Map<String, dynamic>;
            if (userSnapshot.data() is Map) {
              UserModel userModel =
                  UserModel.fromJson(map, '', userCredential.user!.uid);
              return userModel;
            }
          } else {
            // User not found in 'users' collection, check 'doctor_users' collection
            DocumentSnapshot doctorSnapshot = await FirebaseFirestore.instance
                .collection('doctor_users')
                .doc(userCredential.user!.uid)
                .get();

            if (doctorSnapshot.exists) {
              // User is a doctor
              Map<String, dynamic> map =
                  doctorSnapshot.data() as Map<String, dynamic>;
              if (doctorSnapshot.data() is Map) {
                DoctorModel doctorModel =
                    DoctorModel.fromJson(map, '', userCredential.user!.uid);
                return doctorModel;
              }
            } else {
              return "User not found";
            }
          }
        } else {
          return UserModel(
              age: '',
              email: '',
              userName: '',
              errorMsg: 'Email is Not Verified',
              image: "",
              id: "");
        }
      }
    } catch (error) {
      return UserModel(
          age: '',
          email: '',
          userName: '',
          errorMsg: error.toString(),
          image: "",
          id: "");
    }
    return UserModel.empty();
  }

  //Forget Password
  Future<void> passwordReset(email) async {
    _auth.sendPasswordResetEmail(email: email).then((value) {
      Utils()
          .toastMessage2("Check your email to reset your password and log in");
      Get.offAllNamed(kLoginScreen);
    }).onError((error, stackTrace) {
      Utils().toastMessage(error.toString());
    });
  }

  //To save user details on firestore
  Future<void> saveUserDetails(
      String username, String age, String email) async {
    try {
      User? user = FirebaseAuth.instance.currentUser;
      if (user != null) {
        String userId =
            user.uid; // User ID obtained from Firebase Authentication
        await _firestore.collection('users').doc(userId).set(
            {'username': username, 'age': age, 'email': email, 'image': ''});
        // Data saved successfully
      } else {
        print('No user is currently logged in.');
      }
    } catch (e) {
      // Handle error
      print('Error saving user details: $e');
    }
  }

  //To save Doctor user details on firestore
  Future<void> saveDoctorUserDetails(
      String userName,
      age,
      email,
      fullName,
      speciality,
      bio,
      location,
      availabilityStart,
      availabilityEnd,
      startDay,
      endDay) async {
    try {
      User? user = FirebaseAuth.instance.currentUser;
      if (user != null) {
        String doctorId =
            user.uid; // User ID obtained from Firebase Authentication
        await _firestore.collection('doctor_users').doc(doctorId).set({
          'username': userName,
          'age': age,
          'email': email,
          'fullName': fullName,
          'speciality': speciality,
          'bio': bio,
          'location': location,
          'startDay': startDay,
          'endDay': endDay,
          'availabilityStart': availabilityStart,
          'availabilityEnd': availabilityEnd,
        });
        // Data saved successfully
      } else {
        print('No user is currently logged in.');
      }
    } catch (e) {
      // Handle error
      print('Error saving user details: $e');
    }
  }

//To Fetch user data from firestore
  Future<DocumentSnapshot<Map<String, dynamic>>> getUserData(String userId) =>
      _firestore.collection('users').doc(userId).get();
}
