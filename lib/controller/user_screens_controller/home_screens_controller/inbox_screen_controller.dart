import 'package:firebase_database/firebase_database.dart';
import 'package:get/get.dart';

import '../../../model/doctor_model.dart';
import '../../../model/user_model.dart';
import '../../../utils/user_session.dart';

class InboxScreenController extends GetxController {
  DatabaseReference _doctorsRef = FirebaseDatabase.instance.reference().child('doctors');

  UserSession userSession = UserSession();
  Rx<UserModel> userModel=UserModel.empty().obs;
  Rx<DoctorModel> doctorModel=DoctorModel.empty().obs;
  RxList<DoctorModel> doctors = <DoctorModel>[].obs;



  @override
  void onInit(){
    getDoctorInfo();
    getUserInfo();
    super.onInit();
  }

  Future<void> getDoctorInfo() async{
    doctorModel.value=await userSession.getDoctorInformation();

  }
  Future<void> getUserInfo() async{
    userModel.value=await userSession.getUserInformation();

  }

}