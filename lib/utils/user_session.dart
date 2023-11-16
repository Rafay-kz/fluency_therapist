import 'dart:convert';

import 'package:get/get_rx/src/rx_types/rx_types.dart';
import 'package:shared_preferences/shared_preferences.dart';

import '../model/doctor_model.dart';
import '../model/timeslots_model.dart';
import '../model/user_model.dart';

class UserSession {
  UserSession._internal();

  static final UserSession _instance = UserSession._internal();

  factory UserSession() {
    return _instance;
  }

  static const String isLogin = "IS_LOGIN";
  static const String isDoctor = "IS_DOCTOR";
  static const String userData = "USER_INFO";
  static const String doctorData = "DOCTOR_INFO";

  Future<void> setLogin() async {
    SharedPreferences preference = await SharedPreferences.getInstance();
    preference.setBool(isLogin, true);
  }

  Future<bool> isUserLoggedIn() async {
    final preference = await SharedPreferences.getInstance();
    return preference.getBool(isLogin) ?? false;
  }

  Future<void> logOut() async {
    final preference = await SharedPreferences.getInstance();
    preference.clear();
  }

  Future<void> setIsDoctor() async {
    SharedPreferences preference = await SharedPreferences.getInstance();
    preference.setBool(isDoctor, true);
  }

  Future<bool> isUserDoctor() async {
    final preference = await SharedPreferences.getInstance();
    return preference.getBool(isDoctor) ?? false;
  }

  Future<void> userInformation({required UserModel userModel}) async {
    SharedPreferences preference = await SharedPreferences.getInstance();
    preference.setString(userData, jsonEncode(userModel.toJson()));
  }

  Future<UserModel> getUserInformation() async {
    SharedPreferences preference = await SharedPreferences.getInstance();
    return UserModel.fromJsonForSession(
        jsonDecode(preference.getString(userData) ?? '{}'), '');
  }

  //For dp

  Future<void> doctorInformation({required DoctorModel doctorModel}) async {
    SharedPreferences preference = await SharedPreferences.getInstance();
    preference.setString(doctorData, jsonEncode(doctorModel.toJson()));
  }

  Future<DoctorModel> getDoctorInformation() async {
    SharedPreferences preference = await SharedPreferences.getInstance();
    return DoctorModel.fromJsonForSession(
        jsonDecode(preference.getString(doctorData) ?? '{}'), '');
  }

  Future<void> saveTimeSlotsToLocal(
      int tabIndex, Map<int, RxList<TimeSlot>> timeSlotsMap) async {
    final timeSlots =
        timeSlotsMap[tabIndex]?.map((slot) => slot.toJson()).toList();
    final prefs = await SharedPreferences.getInstance();
    await prefs.setString('time_slots_$tabIndex', jsonEncode(timeSlots));
  }

  Future<void> loadTimeSlotsFromLocal(
      int tabIndex, Map<int, RxList<TimeSlot>> timeSlotsMap) async {
    final prefs = await SharedPreferences.getInstance();
    final timeSlotsJson = prefs.getString('time_slots_$tabIndex');
    if (timeSlotsJson != null) {
      final List<dynamic> timeSlotsData = jsonDecode(timeSlotsJson);
      final timeSlots =
          timeSlotsData.map((data) => TimeSlot.fromJson(data)).toList();
      timeSlotsMap[tabIndex]?.assignAll(timeSlots);
    }
  }
}
