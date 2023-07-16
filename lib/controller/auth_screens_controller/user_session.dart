
import 'package:shared_preferences/shared_preferences.dart';




class UserSession{

  UserSession._internal();
  static final UserSession _instance = UserSession._internal();
  factory UserSession(){
    return _instance;
  }

  static const String IS_LOGIN = "IS_LOGIN";

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

}