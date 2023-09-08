import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:fluency_therapist/utils/user_session.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:get/get_core/src/get_main.dart';

import '../model/doctor_model.dart';
import '../model/timeslots_model.dart';
import '../model/user_model.dart';
import '../utils/app_constants.dart';
import '../utils/utills.dart';

class Database {
  final FirebaseAuth _auth = FirebaseAuth.instance;
  final FirebaseFirestore _firestore = FirebaseFirestore.instance;
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

  ) async {
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
}
