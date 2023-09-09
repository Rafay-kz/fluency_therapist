import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:get/get.dart';

import '../../../model/doctor_model.dart';
import '../../../model/user_model.dart';
import '../../../utils/app_constants.dart';
import '../../../utils/user_session.dart';

class ConsultTherapistScreenController extends GetxController {
  UserSession userSession = UserSession();
  Rx<UserModel> userModel = UserModel.empty().obs;
  Rx<DoctorModel> doctorModel = DoctorModel.empty().obs;
  RxList<DoctorModel> doctorUsers = <DoctorModel>[].obs;
  RxBool isLoading = true.obs;

  @override
  void onInit() async {
    await getUserInfo();
    fetchDoctorUsers();
    await getDoctorInfo(); // Fetch the doctor's own info regardless of user type
    super.onInit();
  }

  Future<void> getUserInfo() async {
    userModel.value = await userSession.getUserInformation();
  }

  Future<void> getDoctorInfo() async {
    doctorModel.value = await userSession.getDoctorInformation();
  }

  Future<void> logout() async {
    userSession.logOut();
    Get.offAllNamed(kLoginScreen);
  }


// Method to fetch all doctor user data from Firestore
  Future<void> fetchDoctorUsers() async {
    try {
      final QuerySnapshot querySnapshot =
      await FirebaseFirestore.instance.collection('doctor_users').get();

      final List<DoctorModel> users = querySnapshot.docs.map((doc) {
        final data = doc.data() as Map<String, dynamic>;

        return DoctorModel(
          userName: data['username'] ?? '',
          age: data['age'] ?? '',
          email: data['email'] ?? '',
          fullName: data['fullName'] ?? '',
          speciality: data['speciality'] ?? '',
          bio: data['bio'] ?? '',
          location: data['location'] ?? '',
          image: data['image'] ?? '',
          id: doc.id ?? '',
          errorMsg: '',
        );
      }).toList();

      doctorUsers.assignAll(users);
      print("doctor users: $doctorUsers");
      // Data loading is complete, set isLoading to false
      isLoading.value = false;
    } catch (e) {
      print('Error fetching doctor users: $e');
    }
  }}
