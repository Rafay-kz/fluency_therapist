import 'package:flutter/material.dart';
import 'package:get/get.dart';

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
}
