import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:get/get.dart';

import '../../../model/doctor_model.dart';
import '../../../model/user_model.dart';
import '../../../utils/user_session.dart';



class ConsultTherapistScreenController extends GetxController {


  UserSession userSession = UserSession();
  Rx<UserModel> userModel=UserModel.empty().obs;
  Rx<DoctorModel> doctorModel=DoctorModel.empty().obs;

  @override
  void onInit(){
    getDoctorInfo();
    super.onInit();
  }
  Future<void> getDoctorInfo() async{
    doctorModel.value=await userSession.getDoctorInformation();


  }
}