import 'package:fluency_therapist/model/user_model.dart';
import 'package:flutter/material.dart';

import 'doctor_model.dart';

class BookedSlot {
  int callId;
  String doctorId;
  String userId;
  final DateTime date;
  final TimeOfDay startTime;
  final TimeOfDay endTime;
  final DoctorModel? doctor;
  final UserModel? user;

  BookedSlot({
    this.doctorId = '',
    this.userId = '',
    required this.date,
    required this.startTime,
    required this.endTime,
     this.doctor,
    this.user,
    this.callId = 0,
  });

  Map<String, dynamic> toJson() {
    return {
      'callId': callId,
      'doctorId': doctorId,
      'userId': userId,
      'date': date.toIso8601String(), // Store as DateTime
      'start_time': '${startTime.hour}:${startTime.minute}',
      'end_time': '${endTime.hour}:${endTime.minute}',
      'doctorModel' : doctor,
      'userModel' : user,
    };
  }

  factory BookedSlot.fromJson(Map<String, dynamic> json) {
    return BookedSlot(
      callId: json['callId'],
      doctorId: json['doctorId'],
      userId: json['userId'],
      date: DateTime.parse(json['date']),
      startTime: _parseTime(json['start_time']),
      endTime: _parseTime(json['end_time']),
      doctor: json['doctor'],
      user: json['user']
    );
  }

  static TimeOfDay _parseTime(String timeStr) {
    final parts = timeStr.split(':');
    return TimeOfDay(hour: int.parse(parts[0]), minute: int.parse(parts[1]));
  }
}
