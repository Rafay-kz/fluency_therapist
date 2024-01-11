

import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../../../model/doctor_model.dart';
import '../../../model/user_model.dart';
import '../../../utils/app_constants.dart';
import '../../../utils/user_session.dart';



class CustomizedProgramScreenController extends GetxController{

  //Validator of answer
  bool validateAnswer() {
    return selectedValue.value != -1;
  }
  //Method to update the value
  var selectedValue = RxInt(-1);

  void updateSelectedValue(int value) {
    selectedValue.value = value;
  }


//Button method

void checkAnswer() {
  if (validateAnswer()) {
    Get.toNamed(kReminderScreen);
  } else {
    Get.snackbar(
      'Error',
      'Please select an answer.',
      backgroundColor: Colors.white,
      colorText: Colors.red,
    );
  }

}
  UserSession userSession = UserSession();
  Rx<UserModel> userModel=UserModel.empty().obs;
  Rx<DoctorModel> doctorModel=DoctorModel.empty().obs;

  @override
  void onInit(){
    getUserInfo();
    getDoctorInfo();
    super.onInit();
  }

  Future<void> getUserInfo() async{
    userModel.value=await userSession.getUserInformation();
  }
  Future<void> getDoctorInfo() async{
    doctorModel.value=await userSession.getDoctorInformation();

  }



}