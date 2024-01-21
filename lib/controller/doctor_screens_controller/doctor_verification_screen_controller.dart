import 'package:get/get.dart';

import '../../model/doctor_model.dart';
import '../../utils/app_constants.dart';
import '../../utils/user_session.dart';

class DoctorVerificationScreenController extends GetxController {

  RxString verificationMessage = ''.obs;
  Rx<DoctorModel> doctorModel = DoctorModel.empty().obs;
  UserSession userSession = UserSession();


  @override
  void onInit() async {
    super.onInit();
    await getDoctorInfo();
    setDefaultVerificationMessage();
  }

  Future<void> getDoctorInfo() async {
    doctorModel.value = await userSession.getDoctorInformation();
  }

  void setDefaultVerificationMessage() {
    verificationMessage.value = '''
Dear ${doctorModel.value.firstName},

Thank you for submitting your documents for verification. Our team is diligently reviewing the provided information to ensure the highest standards of professional conduct.

The verification process typically takes 24-48 hours. We appreciate your patience during this period. Rest assured, we understand the importance of timely verification and are working diligently to expedite the process.

We will notify you promptly about any updates or additional information required for verification. 

Thank you for your cooperation.

Best regards,
[Team Fluency Therapist]
''';

  }
  Future<void> logout () async {
    userSession.logOut();
    Get.offAllNamed(kLoginScreen);

  }

}
