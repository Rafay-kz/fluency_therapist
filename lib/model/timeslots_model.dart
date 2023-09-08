import 'package:flutter/material.dart';

class TimeSlot {
  final DateTime date;
  final TimeOfDay startTime;
  final TimeOfDay endTime;

  TimeSlot({
    required this.date,
    required this.startTime,
    required this.endTime,
  });

  // Convert a TimeSlotModel to JSON
  Map<String, dynamic> toJson() {
    return {
      'date': date.toIso8601String(),
      'start_time': '${startTime.hour}:${startTime.minute}',
      'end_time': '${endTime.hour}:${endTime.minute}',
    };
  }

  // Create a TimeSlotModel from JSON
  factory TimeSlot.fromJson(Map<String, dynamic> json) {
    return TimeSlot(
      date: DateTime.parse(json['date']),
      startTime: _parseTime(json['start_time']),
      endTime: _parseTime(json['end_time']),
    );
  }

  static TimeOfDay _parseTime(String timeStr) {
    final parts = timeStr.split(':');
    return TimeOfDay(hour: int.parse(parts[0]), minute: int.parse(parts[1]));
  }
}
