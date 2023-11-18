
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:fluency_therapist/utils/user_session.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:get/get_core/src/get_main.dart';

import '../controller/doctor_screens_controller/doctor_home_screen_controller.dart';
import '../model/doctor_model.dart';
import '../model/timeslots_model.dart';
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
  Future<dynamic> loginUser(String email, String password) async {
    try {
      final userCredential = await FirebaseAuth.instance.signInWithEmailAndPassword(
        email: email,
        password: password,
      );

      if (userCredential.user != null) {
        // Check if the user is a normal user
        DocumentSnapshot userSnapshot = await FirebaseFirestore.instance
            .collection('users')
            .doc(userCredential.user!.uid)
            .get();

        if (userSnapshot.exists) {
          Map<String, dynamic> map = userSnapshot.data() as Map<String, dynamic>;
          if (userSnapshot.data() is Map) {
            UserModel userModel = UserModel.fromJson(map, '', userCredential.user!.uid);

            // Check if the user's email is verified
            if (userCredential.user!.emailVerified) {
              return userModel;
            } else {
              userModel.errorMsg = 'Email is Not Verified'; // Set the error message
              return userModel;
            }
          }
        } else {
          // User not found in 'users' collection, check 'doctor_users' collection
          DocumentSnapshot doctorSnapshot = await FirebaseFirestore.instance
              .collection('doctor_users')
              .doc(userCredential.user!.uid)
              .get();

          if (doctorSnapshot.exists) {
            Map<String, dynamic> map = doctorSnapshot.data() as Map<String, dynamic>;
            if (doctorSnapshot.data() is Map) {
              DoctorModel doctorModel = DoctorModel.fromJson(map, '', userCredential.user!.uid);

              // Check if the doctor has set up their profile
              bool isProfileSetUp = doctorModel.isProfileSetUp ?? false;
              if (isProfileSetUp) {
                return doctorModel;
              } else {
                doctorModel.errorMsg = 'Profile not set up'; // Set the error message
                return doctorModel;
              }
            }
          } else {
            return 'User not found';
          }
        }
      }
    } catch (error) {
      UserModel user = UserModel(
        email: '',
        firstName: '',
        lastName: '',
        errorMsg: error.toString(),
        image: '',
        id: '',
        isProfileSetUp: false,
      );
      return user;
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
      String firstName, String lastName, String email) async {
    try {
      User? user = FirebaseAuth.instance.currentUser;
      if (user != null) {
        String userId =
            user.uid; // User ID obtained from Firebase Authentication
        await _firestore.collection('users').doc(userId).set(
            {'firstName': firstName,'lastName': lastName, 'email': email, 'image': ''});
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
    String firstName,
    String lastName,
    String email,


  ) async {
    try {
      User? user = FirebaseAuth.instance.currentUser;
      if (user != null) {
        String doctorId =
            user.uid; // User ID obtained from Firebase Authentication
        await _firestore.collection('doctor_users').doc(doctorId).set({
          'firstName': firstName,
          'lastName': lastName,
          'email': email,

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
  Future<void> updateDoctorUserData(
      String doctorId,
      Map<String, dynamic> dataToUpdate,
      ) async {
    try {
      await _firestore.collection('doctor_users').doc(doctorId).update(dataToUpdate);
      // Data updated successfully
    } catch (e) {
      // Handle error
      print('Error updating user data: $e');
    }
  }


//To store doctors time slots on firestore.
  String _getDayName(int dayIndex) {
    switch (dayIndex) {
      case 0:
        return 'Monday';
      case 1:
        return 'Tuesday';
      case 2:
        return 'Wednesday';
      case 3:
        return 'Thursday';
      case 4:
        return 'Friday';
      case 5:
        return 'Saturday';
      case 6:
        return 'Sunday';
      default:
        return '';
    }
  }

  // Add the formatTimeOfDay method here
  String formatTimeOfDay(TimeOfDay timeOfDay) {
    final hour = timeOfDay.hour.toString().padLeft(2, '0');
    final minute = timeOfDay.minute.toString().padLeft(2, '0');
    return '$hour:$minute';
  }

  Future<void> addTimeSlotToFirestore({
    required int dayIndex,
    required TimeSlot newSlot,
    required String doctorId,
  }) async {
    final dayName = _getDayName(dayIndex);

    final timeSlotsCollection = _firestore
        .collection('doctor_users')
        .doc(doctorId)
        .collection('time_slots')
        .doc(dayName)
        .collection('slots');

    final startTimeString = formatTimeOfDay(newSlot.startTime);
    final endTimeString = formatTimeOfDay(newSlot.endTime);

    await timeSlotsCollection.add({
      'date': newSlot.date,
      'start_time': startTimeString,
      'end_time': endTimeString,
    });
  }

  TimeOfDay parseTimeOfDay(String timeString) {
    final parts = timeString.split(':');
    final hour = int.parse(parts[0]);
    final minute = int.parse(parts[1]);
    return TimeOfDay(hour: hour, minute: minute);
  }

  Future<List<TimeSlot>> loadTimeSlotsFromFirestore({
    required int tabIndex,
    required String doctorId,
  }) async {
    final dayName = _getDayName(tabIndex);
    final timeSlotsCollection = _firestore
        .collection('doctor_users')
        .doc(doctorId)
        .collection('time_slots')
        .doc(dayName)
        .collection('slots');

    try {
      final querySnapshot = await timeSlotsCollection.get();

      if (querySnapshot.docs.isNotEmpty) {
        final timeSlots = querySnapshot.docs.map((doc) {
          final data = doc.data();

          return TimeSlot(
            date: data['date'].toDate() as DateTime,
            startTime: parseTimeOfDay(data['start_time'] as String),
            endTime: parseTimeOfDay(data['end_time'] as String),
            isAvailable: data['is_available'] as bool? ?? true,

          );
        }).toList();

        return timeSlots;
      } else {
        print(
            'No Time Slots found in Firestore for Doctor ID: $doctorId, Day Name: $dayName');
        return [];
      }
    } catch (e) {
      print('Error loading Time Slots from Firestore: $e');
      return [];
    }
  }

  Future<void> removeTimeSlotFromFirestore(
    String doctorId,
    int dayIndex,
    TimeSlot removedSlot,
  ) async {
    final dayName = _getDayName(dayIndex);

    if (doctorId.isNotEmpty && dayName.isNotEmpty) {
      final timeSlotsCollection = _firestore
          .collection('doctor_users')
          .doc(doctorId)
          .collection('time_slots')
          .doc(dayName)
          .collection('slots');

      // Find the document to delete based on date and time
      final startTimeString = formatTimeOfDay(removedSlot.startTime);
      final endTimeString = formatTimeOfDay(removedSlot.endTime);

      final querySnapshot = await timeSlotsCollection
          .where('date', isEqualTo: removedSlot.date)
          .where('start_time', isEqualTo: startTimeString)
          .where('end_time', isEqualTo: endTimeString)
          .get();

      if (querySnapshot.docs.isNotEmpty) {
        final docId = querySnapshot.docs.first.id;
        await timeSlotsCollection.doc(docId).delete();
      } else {
        print('No matching Time Slot found in Firestore for removal.');
      }
    } else {
      print(
          'Doctor ID or Day Name is empty. Cannot construct Firestore path for removal.');
    }
  }

  Future<void> saveUnlockedVideoIndex(String userId, int index, String exerciseName) async {
    try {
      await FirebaseFirestore.instance
          .collection('users')
          .doc(userId)
          .update({'$exerciseName-Index': index});
    } catch (e) {
      print('Error saving unlocked video index for $exerciseName: $e');
    }
  }

  Future<int?> loadUnlockedVideoIndex(String userId, String exerciseName) async {
    try {
      DocumentSnapshot snapshot = await FirebaseFirestore.instance
          .collection('users')
          .doc(userId)
          .get();

      if (snapshot.exists) {
        Map<String, dynamic> data = snapshot.data() as Map<String, dynamic>;
        if (data.containsKey('$exerciseName-Index')) {
          return data['$exerciseName-Index'];
        } else {
          print('Field does not exist');
        }
      }
    } catch (e) {
      print('Error loading unlocked video index for $exerciseName: $e');
    }
    return null;
  }

}

