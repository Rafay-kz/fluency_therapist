
import 'dart:convert';

import 'package:shared_preferences/shared_preferences.dart';

import '../model/user_model.dart';

class UserSession{

  UserSession._internal();
  static final UserSession _instance = UserSession._internal();
  factory UserSession(){
    return _instance;
  }

  static const String IS_LOGIN = "IS_LOGIN";
  static const String IS_DOCTOR = "IS_DOCTOR";
  static const String USER_DATA = "USER_INFO";

  Future<void> setLogin() async {
    SharedPreferences preference = await SharedPreferences.getInstance();
    preference.setBool(IS_LOGIN,true);
  }

  Future<bool> isUserLoggedIn()async{
    final preference = await SharedPreferences.getInstance();
    return preference.getBool(IS_LOGIN)??false;
  }


  Future<void> logOut()async{
    final preference = await SharedPreferences.getInstance();
    preference.clear();
  }

  Future<void> setIsDoctor() async {
    SharedPreferences preference = await SharedPreferences.getInstance();
    preference.setBool(IS_DOCTOR, true);
  }

  Future<bool> isUserDoctor() async {
    final preference = await SharedPreferences.getInstance();
    return preference.getBool(IS_DOCTOR) ?? false;
  }

  Future<void> userInformation({required UserModel userModel}) async {
    SharedPreferences preference = await SharedPreferences.getInstance();
    preference.setString(USER_DATA,jsonEncode(userModel.toJson()));
  }

  Future<UserModel> getUserInformation() async{
    SharedPreferences preference = await SharedPreferences.getInstance();
    return UserModel.fromJson(jsonDecode(preference.getString(USER_DATA)??'{}'),'');
  }


}