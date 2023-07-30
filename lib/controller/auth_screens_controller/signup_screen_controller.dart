import 'package:fluency_therapist/core/database.dart';
import 'package:get/get.dart';
import 'package:flutter/material.dart';

import '../../utils/utills.dart';

class SignupScreenController extends GetxController {
  final formKey = GlobalKey<FormState>();
  late RxBool loading;
  RxBool obscureText = true.obs;


  //Regular users controllers
  TextEditingController nameTEController = TextEditingController();
  TextEditingController emailTEController = TextEditingController();
  TextEditingController passwordTEController = TextEditingController();
  TextEditingController confirmPasswordTEController = TextEditingController();
  TextEditingController ageTEController = TextEditingController();

  //Doctor users controllers
  TextEditingController fullNameController = TextEditingController();
  TextEditingController specialityController = TextEditingController();
  TextEditingController bioController = TextEditingController();
  TextEditingController locationController = TextEditingController();

 //Checkbox method
  var isDoctor = false.obs;
  void toggleDoctor(bool value) {
    isDoctor.value = value;
  }

  //variables to store regular users controller data
  var name = '';
  var email = '';
  var password = '';
  var confirmPassword = '';
  var age = '';

  //variables to store doctor users controller data'
  var fullName = '';
  var speciality = '';
  var bio = '';
  var location = '';
  var availabilityStart = '';
  var availabilityEnd = '';


  @override
  void onClose() {
    nameTEController.dispose();
    ageTEController.dispose();
    emailTEController.dispose();
    passwordTEController.dispose();
    confirmPasswordTEController.dispose();
    fullNameController.dispose();
    specialityController.dispose();
    bioController.dispose();
    locationController.dispose();
  }

  //Validators for text fields
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

  String formatTimeOfDay(TimeOfDay timeOfDay) {
    String hour = '${timeOfDay.hour}'.padLeft(2, '0');
    String minute = '${timeOfDay.minute}'.padLeft(2, '0');
    return '$hour:$minute';
  }


  String? validateLocation(String value) {
    if (value.isEmpty) {
      return 'Location cannot be empty';
    }
    if (value.length < 3) {
      return 'Improper location';
    }
    return null;
  }
 //End of validators

  //For registering users - Register method.
  Future<void> signUp() async {
    if (formKey.currentState!.validate()) {
      try {
        Database database = Database();
        await database.createAccount(
          emailTEController.text.toString(),
          passwordTEController.text.toString(),
        );

        if (isDoctor.value) {
          await database.saveDoctorUserDetails(
            nameTEController.text.toString(),
            ageTEController.text.toString(),
            emailTEController.text.toString(),
            fullNameController.text.toString(),
            specialityController.text.toString(),
            bioController.text.toString(),
            locationController.text.toString(),
            availabilityStart.toString(),
            availabilityEnd.toString(),
            isDoctor.value,
          );
        }
        else {
          database.saveUserDetails(
            nameTEController.text.toString(),
            ageTEController.text.toString(),
            emailTEController.text.toString(),
          );
        }
      } catch (error) {
        Utils().toastMessage(error.toString());
      }
    }
  }

 //Button method
  Future<void> onRegisterTap() async {
    signUp();
  }
}
