import 'package:fluency_therapist/utils/app_colors.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:time_range/time_range.dart';

class TimePicker extends StatelessWidget {
  final void Function(TimeRangeResult?) onRangeCompleted; // Update the type

  TimePicker({required this.onRangeCompleted});

  @override
  Widget build(BuildContext context) {
    return TimeRange(
      borderColor: Colors.grey,
      activeBorderColor: AppColors.backgroundColor,
      backgroundColor: AppColors.textfieldColor,
      activeBackgroundColor: AppColors.primaryBlue,
      firstTime: TimeOfDay(hour: 9, minute: 00),
      lastTime: TimeOfDay(hour: 22, minute: 0),
      timeStep: 30,
      timeBlock: 30,
      onRangeCompleted: onRangeCompleted,
    );
  }
}
