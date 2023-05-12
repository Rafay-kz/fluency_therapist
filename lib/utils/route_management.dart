import 'package:fluency_therapist/screens/auth_screens/login_screen.dart';
import 'package:get/get.dart';
import '../screens/auth_screens/SignUp_screen.dart';
import '../screens/auth_screens/splash_screen.dart';
import 'app_constants.dart';
import 'screen_bindings.dart';

//created by Abdul Rafay on 1-5-2023

class RouteGenerator {
  static List<GetPage> getPages() {
    return [
      GetPage(
        name: kSplashScreen,
        page: () =>  SplashScreen(),
        binding: ScreenBindings(),
      ),
      GetPage(
        name: kSignUpScreen,
        page: () => const SignUpScreen(),
        binding: ScreenBindings(),
      ),
      GetPage(
        name: kLoginScreen,
        page: () => const LoginScreen(),
        binding: ScreenBindings(),
      ),

    ];
  }


}