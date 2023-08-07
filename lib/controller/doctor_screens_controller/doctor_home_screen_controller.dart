import 'package:fluency_therapist/model/doctor_model.dart';
import 'package:fluency_therapist/utils/app_constants.dart';
import 'package:get/get.dart';

import '../../utils/user_session.dart';

class DoctorHomeScreenController extends GetxController {

  UserSession userSession = UserSession();
  Rx<DoctorModel> doctorModel=DoctorModel.empty().obs;

  @override
  void onInit(){
    getDoctorInfo();
    super.onInit();
  }

  Future<void> getDoctorInfo() async{
    doctorModel.value=await userSession.getDoctorInformation();
  }

  Future<void> logout () async {
    userSession.logOut();
    Get.offAllNamed(kLoginScreen);

  }



}