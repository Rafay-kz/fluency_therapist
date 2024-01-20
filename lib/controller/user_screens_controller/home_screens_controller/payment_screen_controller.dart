import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../../../model/doctor_model.dart';
import '../../../model/user_model.dart';
import '../../../utils/user_session.dart';



class PaymentScreenController extends GetxController {
  UserSession userSession = UserSession();
  Rx<UserModel> userModel = UserModel.empty().obs;
  Rx<DoctorModel> doctorModel = DoctorModel.empty().obs;
  final formKey = GlobalKey<FormState>();


  TextEditingController cardNumberController = TextEditingController();
  TextEditingController expiryDateController = TextEditingController();
  TextEditingController cvvController = TextEditingController();
  TextEditingController amountController = TextEditingController();


  @override
  void onInit() async{
    await getUserInfo();

    super.onInit();
  }
  Future<void> getUserInfo() async {
    userModel.value = await userSession.getUserInformation();
  }

  Future<void> getDoctorInfo() async {
    doctorModel.value = await userSession.getDoctorInformation();
  }

  // Validation error messages
  static const String cardNumberError = 'Invalid card number';
  static const String expiryDateError = 'Invalid expiry date';
  static const String cvvError = 'Invalid CVV';
  static const String amountError = 'Invalid amount';

  // Validation functions
  String? validateCardNumber(String? value) {
    if (value == null || value.isEmpty) {
      return 'Please enter a card number';
    }

    // Remove non-numeric characters from the input
    String cleanedValue = value.replaceAll(RegExp(r'\D'), '');

    // Check if the cleaned value contains exactly 14 digits
    if (cleanedValue.length != 14) {
      return 'Invalid card number';
    }

    // Check if the card number is not a repeated sequence
    if (isRepeatedSequence(cleanedValue)) {
      return 'Invalid card number';
    }

    // The input is a valid card number
    return null;
  }

// Function to check if the input is a repeated sequence
  bool isRepeatedSequence(String value) {
    // Check if all characters are the same in the input string
    return value.runes.toSet().length == 1;
  }

  String? validateExpiryDate(String? value) {
    if (value == null || value.isEmpty) {
      return 'Please enter an expiry date';
    }

    // Simple check for numeric characters and format MM/YY
    if (!RegExp(r'^[0-9]{2}/[0-9]{2}$').hasMatch(value)) {
      return expiryDateError;
    }

    // Add more sophisticated expiry date validation logic if needed

    return null;
  }

  String? validateCVV(String? value) {
    if (value == null || value.isEmpty) {
      return 'Please enter a CVV';
    }

    // Simple check for numeric characters
    if (!RegExp(r'^[0-9]+$').hasMatch(value)) {
      return cvvError;
    }

    // Add more sophisticated CVV validation logic if needed

    return null;
  }

  String? validateAmount(String? value) {
    if (value == null || value.isEmpty) {
      return 'Please enter an amount';
    }

    // Check if the entered amount is a valid double
    try {
      double.parse(value);
    } catch (e) {
      return amountError;
    }

    // Add more sophisticated amount validation logic if needed

    return null;
  }



}
