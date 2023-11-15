import 'package:get/get.dart';

import '../../../model/doctor_model.dart';
import '../../../model/user_model.dart';
import '../../../utils/user_session.dart';

class OngoingCallScreenController extends GetxController {
  UserSession userSession = UserSession();
  Rx<UserModel> userModel = UserModel.empty().obs;
  Rx<DoctorModel> doctorModel = DoctorModel.empty().obs;

  int callId = Get.arguments ?? 0;
  String userName = '';
  String userId = '';

  @override
  void onInit() async {
    print("VideoCallScreenController: Initializing");

    // Debug print to check the value of callId
    print("callId: $callId");

    await initializeData();
    // Debug print to check the value of userId and userName
    print("userId: $userId");
    print("userName: $userName");

    super.onInit();
  }

  Future<void> initializeData() async {
    await getUserInfo();
    await getDoctorInfo();
    await setUserIdAndUserName();
  }

  Future<void> getUserInfo() async {
    userModel.value = await userSession.getUserInformation();
    // Debug print to check the user information
    print("User Info: $userModel");
  }

  Future<void> getDoctorInfo() async {
    doctorModel.value = await userSession.getDoctorInformation();
    // Debug print to check the doctor information
    print("Doctor Info: $doctorModel");
  }

  Future<void> setUserIdAndUserName() async {
    if (userModel.value != null && userModel.value.id.isNotEmpty) {
      userId = userModel.value.id;
      userName = userModel.value.firstName;
    } else if (doctorModel.value != null && doctorModel.value.id.isNotEmpty) {
      userId = doctorModel.value.id;
      userName = doctorModel.value.firstName;
    }
  }


}