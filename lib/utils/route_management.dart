import 'package:fluency_therapist/screens/auth_screens/login_screen.dart';
import 'package:get/get.dart';
import '../screens/auth_screens/SignUp_screen.dart';
import '../screens/auth_screens/create_new_password_screen.dart';
import '../screens/auth_screens/forget_password_screen.dart';
import '../screens/auth_screens/otp_verification_screen.dart';
import '../screens/auth_screens/splash_screen.dart';
import 'app_constants.dart';
import 'screen_bindings.dart';

//created by Abdul Rafay on 1-5-2023

class RouteGenerator {
  static List<GetPage> getPages() {
    return [
      GetPage(
        name: kSplashScreen,
        page: () => const SplashScreen(),
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
      GetPage(
        name: kLoginScreen,
        page: () => const ForgetPassScreen(),
        binding: ScreenBindings(),
      ),
      GetPage(
        name: kForgetPassScreen,
        page: () => const OtpVerificationScreen(),
        binding: ScreenBindings(),
      ),
      GetPage(
        name: kCreateNewPasswordScreen,
        page: () => const CreateNewPasswordScreen(),
        binding: ScreenBindings(),
      ),
    ];
  }


}