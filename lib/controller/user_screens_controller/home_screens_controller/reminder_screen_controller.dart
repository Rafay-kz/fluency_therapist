import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../../../model/doctor_model.dart';
import '../../../model/user_model.dart';
import '../../../utils/user_session.dart';

class ReminderScreenController extends GetxController {
  Rx<TimeOfDay> selectedTime = TimeOfDay(hour: 8, minute: 30).obs;

  Future<void> pickTime(BuildContext context) async {
    TimeOfDay? pickedTime = await showTimePicker(
      context: context,
      initialTime: selectedTime.value,
    );

    if (pickedTime != null ) {
      selectedTime.value = pickedTime;
    }
  }
  UserSession userSession = UserSession();
  Rx<UserModel> userModel=UserModel.empty().obs;
  Rx<DoctorModel> doctorModel=DoctorModel.empty().obs;

  @override
  void onInit(){
    getDoctorInfo();
    super.onInit();
  }
  Future<void> getDoctorInfo() async{
    doctorModel.value=await userSession.getDoctorInformation();

  }

}
