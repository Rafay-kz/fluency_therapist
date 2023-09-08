import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:get/get.dart';
import 'package:intl/intl.dart';

import '../../../core/database.dart';
import '../../../model/doctor_model.dart';
import '../../../model/timeslots_model.dart';
import '../../../model/user_model.dart';
import '../../../utils/user_session.dart';



class AppointmentBookingScreenController extends GetxController {
  final Map<int, RxList<TimeSlot>> timeSlotsMap = <int, RxList<TimeSlot>>{};

  UserSession userSession = UserSession();
  Rx<UserModel> userModel = UserModel
      .empty()
      .obs;
  Rx<DoctorModel> doctorModel = DoctorModel
      .empty()
      .obs;
  RxBool isInitialized = false.obs;

  Future<void> getDoctorInfo() async {
    doctorModel.value = await userSession.getDoctorInformation();
  }

  Future<void> getUserInfo() async {
    userModel.value = await userSession.getUserInformation();
  }

  @override
  void onInit() async {
    getUserInfo();
    await getDoctorInfo();
    for (int i = 0; i < 5; i++) {
      timeSlotsMap[i] = <TimeSlot>[].obs;
      loadTimeSlotsFromFirestore(i);
    }
    isInitialized.value = true;

    super.onInit();
  }

  Future<void> loadTimeSlotsFromFirestore(int tabIndex, ) async {
    Database database = Database();
    final doctorId = doctorModel.value.id;
    final timeSlots = await database.loadTimeSlotsFromFirestore(
      tabIndex: tabIndex,
      doctorId: doctorId,
    );

    if (timeSlots.isNotEmpty) {
      timeSlotsMap[tabIndex]?.assignAll(timeSlots);
    }
  }



  RxInt selectedSlotIndex = RxInt(-1);

  void setSelectedSlotIndex(int index) {
    selectedSlotIndex.value = index;
  }

  String formatDate(DateTime date) {
    final formatter = DateFormat('yyyy-MM-dd');
    return formatter.format(date);
  }


}