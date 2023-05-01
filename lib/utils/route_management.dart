import 'package:get/get.dart';
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
    ];
  }


}