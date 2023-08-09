
import 'package:fluency_therapist/model/user_model.dart';
import 'package:fluency_therapist/utils/app_constants.dart';
import 'package:get/get.dart';

import '../../../utils/user_session.dart';


class HomeScreenController extends GetxController {
  UserSession userSession = UserSession();
  Rx<UserModel> userModel=UserModel.empty().obs;

  @override
  void onInit(){
    getUserInfo();
    super.onInit();
  }

  Future<void> getUserInfo() async{
    userModel.value=await userSession.getUserInformation();
  }

  Future<void> logout () async {
    userSession.logOut();
    Get.offAllNamed(kLoginScreen);

  }

}