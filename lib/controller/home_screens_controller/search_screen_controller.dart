import 'package:get/get.dart';

import '../../model/user_model.dart';
import '../../utils/user_session.dart';

class SearchScreenController extends GetxController{

  void onSearchTap(){

  }

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

}