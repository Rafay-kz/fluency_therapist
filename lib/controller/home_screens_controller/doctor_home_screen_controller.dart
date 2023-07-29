import 'package:fluency_therapist/utils/app_constants.dart';
import 'package:get/get.dart';

import '../auth_screens_controller/user_session.dart';

class DoctorHomeScreenController extends GetxController {

  Future<void> logout () async {
    UserSession userSession = UserSession();
    userSession.logOut();
    Get.offAllNamed(kLoginScreen);

  }

}