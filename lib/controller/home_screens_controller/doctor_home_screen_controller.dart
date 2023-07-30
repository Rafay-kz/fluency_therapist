import 'package:fluency_therapist/utils/app_constants.dart';
import 'package:get/get.dart';

import '../../utils/user_session.dart';

class DoctorHomeScreenController extends GetxController {

  Future<void> logout () async {
    UserSession userSession = UserSession();
    userSession.logOut();
    Get.offAllNamed(kLoginScreen);

  }

}