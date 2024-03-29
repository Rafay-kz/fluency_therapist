import 'package:flutter/material.dart';

class TimeSlot {
  final DateTime date;
  final TimeOfDay startTime;
  final TimeOfDay endTime;
  bool isAvailable;
  String bookedByUserId;

  TimeSlot({
    required this.date,
    required this.startTime,
    required this.endTime,
    this.isAvailable = true,
    this.bookedByUserId = '',
  });

  // Convert a TimeSlot to JSON
  Map<String, dynamic> toJson() {
    return {
      'date': date.toIso8601String(),
      'start_time': '${startTime.hour}:${startTime.minute}',
      'end_time': '${endTime.hour}:${endTime.minute}',
      'is_available': isAvailable,
      'booked_by_user_id': bookedByUserId,
    };
  }

  // Create a TimeSlot from JSON
  factory TimeSlot.fromJson(Map<String, dynamic> json) {
    return TimeSlot(
      date: DateTime.parse(json['date']),
      startTime: _parseTime(json['start_time']),
      endTime: _parseTime(json['end_time']),
      isAvailable: json['is_available'] ?? true,
      bookedByUserId: json['booked_by_user_id'] ?? '',
    );
  }

  static TimeOfDay _parseTime(String timeStr) {
    final parts = timeStr.split(':');
    return TimeOfDay(hour: int.parse(parts[0]), minute: int.parse(parts[1]));
  }
}
