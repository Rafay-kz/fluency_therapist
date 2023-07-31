
import 'dart:convert';

import 'package:shared_preferences/shared_preferences.dart';

import '../model/doctor_model.dart';
import '../model/user_model.dart';

class UserSession{

  UserSession._internal();
  static final UserSession _instance = UserSession._internal();
  factory UserSession(){
    return _instance;
  }

  static const String isLogin = "IS_LOGIN";
  static const String isDoctor = "IS_DOCTOR";
  static const String userData = "USER_INFO";
  static const String doctorData = "DOCTOR_INFO";


  Future<void> setLogin() async {
    SharedPreferences preference = await SharedPreferences.getInstance();
    preference.setBool(isLogin,true);
  }

  Future<bool> isUserLoggedIn()async{
    final preference = await SharedPreferences.getInstance();
    return preference.getBool(isLogin)??false;
  }


  Future<void> logOut()async{
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
    preference.setString(userData,jsonEncode(userModel.toJson()));
  }

  Future<UserModel> getUserInformation() async{
    SharedPreferences preference = await SharedPreferences.getInstance();
    return UserModel.fromJson(jsonDecode(preference.getString(userData)??'{}'),'');
  }

  Future<void> doctorInformation({required DoctorModel doctorModel}) async {
    SharedPreferences preference = await SharedPreferences.getInstance();
    preference.setString(doctorData,jsonEncode(doctorModel.toJson()));
  }

  Future<DoctorModel> getDoctorInformation() async{
    SharedPreferences preference = await SharedPreferences.getInstance();
    return DoctorModel.fromJson(jsonDecode(preference.getString(doctorData)??'{}'),'');
  }


}