
import 'package:get/get.dart';


import '../../../model/doctor_model.dart';
import '../../../model/user_model.dart';
import '../../../utils/app_constants.dart';
import '../../../utils/user_session.dart';


class UserProfileScreenController extends GetxController {

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
