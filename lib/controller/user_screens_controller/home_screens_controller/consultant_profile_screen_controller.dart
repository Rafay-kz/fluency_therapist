import 'package:get/get.dart';

import '../../../model/doctor_model.dart';
import '../../../model/user_model.dart';
import '../../../utils/user_session.dart';



class ConsultantProfileScreenController extends GetxController {

  UserSession userSession = UserSession();
  Rx<UserModel> userModel=UserModel.empty().obs;
  Rx<DoctorModel> doctorModel=DoctorModel.empty().obs;
  Rx<DoctorModel> currentDoctorModel =DoctorModel.empty().obs;



  Future<void> getUserInfo() async {
    userModel.value = await userSession.getUserInformation();
  }
  Future<void> getDoctorInfo() async{
    currentDoctorModel.value=await userSession.getDoctorInformation();

  }

  @override
  void onInit()async{
    getUserInfo();
     getDoctorInfo();
    final DoctorModel? doctor =
    Get.arguments as DoctorModel?; // Get the doctor's data argument

    if (doctor != null) {
      // If doctor data is available, set it in the controller
      setDoctor(doctor);
    }
    super.onInit();
  }



  void setDoctor(DoctorModel doctor) {
    doctorModel.value = doctor;
  }


}