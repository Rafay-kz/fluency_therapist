import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:fluency_therapist/custom%20widgets/time_picker.dart';
import 'package:get/get.dart';
import 'package:fluency_therapist/utils/app_constants.dart';
import 'package:flutter/material.dart';
import 'package:time_range/time_range.dart';

import '../../utils/utills.dart';

class DoctorRegistrationScreenController extends GetxController {
  final formKey = GlobalKey<FormState>();

  TextEditingController fullNameController = TextEditingController();
  TextEditingController specialityController = TextEditingController();
  TextEditingController bioController = TextEditingController();
  TextEditingController locationController = TextEditingController();

  //ObscureText - Password.

  //stores controller values
  var fullName = '';
  var speciality = '';
  var bio = '';
  var location = '';
  var availabilityStart = TimeOfDay(hour: 9, minute: 0);
  var availabilityEnd = TimeOfDay(hour: 22, minute: 0);

  @override
  void onClose() {
    fullNameController.dispose();
    specialityController.dispose();
    bioController.dispose();
    locationController.dispose();
  }

  //Validators.
  String? validateFullName(String value) {
    if (value.isEmpty) {
      return 'Name cannot be empty';
    }
    if (value.length < 4) {
      return 'Please enter your full name';
    }
    return null;
  }

  String? validateSpeciality(String value) {
    if (value.isEmpty) {
      return 'Speciality cannot be empty';
    }
    if (value.length < 4) {
      return 'Improper speciality';
    }
    return null;
  }

  String? validateLocation(String value) {
    if (value.isEmpty) {
      return 'Location cannot be empy';
    }
    if (value.length < 3) {
      return 'Improper location';
    }
    return null;
  }




  }







