import 'package:fluency_therapist/core/database.dart';
import 'package:fluency_therapist/utils/app_constants.dart';
import 'package:get/get.dart';
import 'package:flutter/material.dart';

import '../../../custom widgets/progress_indicator.dart';
import '../../../utils/notification_services.dart';
import '../../../utils/utills.dart';


class SignupScreenController extends GetxController {
  final formKey = GlobalKey<FormState>();
  late RxBool loading;
  RxBool obscureText = true.obs;
  NotificationServices notificationServices = NotificationServices ();


  //Regular users controllers
  TextEditingController firstNameController = TextEditingController();
  TextEditingController lastNameController = TextEditingController();
  TextEditingController emailTEController = TextEditingController();
  TextEditingController passwordTEController = TextEditingController();
  TextEditingController confirmPasswordTEController = TextEditingController();


  //Doctor users controllers
  // TextEditingController fullNameController = TextEditingController();
  // TextEditingController specialityController = TextEditingController();
  // TextEditingController bioTEController = TextEditingController();
  // TextEditingController locationController = TextEditingController();

 //Checkbox method
  var isDoctor = false.obs;
  void toggleDoctor(bool value) {
    isDoctor.value = value;
  }


    //variables to store regular users controller data
  var firstName = '';
  var lastName = '';
  var email = '';
  var password = '';
  var confirmPassword = '';


  // //variables to store doctor users controller data'
  // var fullName = '';
  // var speciality = '';
  // var bio = '';
  //
  // var location = '';



  @override
  void onClose() {
    firstNameController.dispose();
    lastNameController.dispose();
    emailTEController.dispose();
    passwordTEController.dispose();
    confirmPasswordTEController.dispose();

  }

  //Validators for text fields
  String? validateName(String value) {
    if (value.isEmpty) {
      return 'Name cannot be empty';
    }
    if (value.length < 3) {
      return 'Name must be at least 3 characters';
    }
    if (!RegExp(r'^[A-Z]').hasMatch(value.substring(0, 1))) {
      return 'The first letter of the name must be a capital letter';
    }
    if (RegExp(r'[A-Z]').hasMatch(value.substring(1))) {
      return 'The rest of the name cannot contain capital letters';
    }
    if (RegExp(r'\s').hasMatch(value)) {
      return 'Name cannot contain spaces';
    }
    if (RegExp(r'[0-9]').hasMatch(value)) {
      return 'Name cannot contain numbers';
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
    if (value.isEmpty) {
      return 'Email cannot be empty';
    }
    if (!RegExp(r"^[a-zA-Z0-9._%+-]+@[a-zA-Z0-9.-]+\.[a-zA-Z]{2,}$").hasMatch(value)) {
      return 'Please provide a valid email address';
    }
    return null;
  }

  String? validatePassword(String value) {
    if (value.length < 8) {
      return 'Password must be at least 8 characters';
    }
    if (!RegExp(r'[A-Z]').hasMatch(value)) {
      return 'Password must contain at least one uppercase letter';
    }
    if (!RegExp(r'[a-z]').hasMatch(value)) {
      return 'Password must contain at least one lowercase letter';
    }
    if (!RegExp(r'[0-9]').hasMatch(value)) {
      return 'Password must contain at least one digit';
    }
    if (!RegExp(r'[!@#$%^&*(),.?":{}|<>]').hasMatch(value)) {
      return 'Password must contain at least one special character';
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
    ProgressDialog pd = ProgressDialog();
    if (formKey.currentState!.validate()) {
      pd.showDialog();
      try {
        Database database = Database();
        await database.createAccount(
          emailTEController.text.toString(),
          passwordTEController.text.toString(),
        );
        pd.dismissDialog();
        String deviceToken = await notificationServices.getDeviceToken() ?? '';

        if (isDoctor.value) {
          await database.saveDoctorUserDetails(
            firstNameController.text.toString(),
            lastNameController.text.toString(),
            emailTEController.text.toString(),
            deviceToken,
          );
        } else {
          database.saveUserDetails(
            firstNameController.text.toString(),
            lastNameController.text.toString(),
            emailTEController.text.toString(),
            deviceToken,
          );
        }
      } catch (error) {
        pd.dismissDialog();
        Utils().toastMessage(error.toString());
      }
    } else {
      Utils().toastMessage("Error Signing up");
    }
  }

 //Button method
  Future<void> onRegisterTap() async {
    signUp();
  }
}
