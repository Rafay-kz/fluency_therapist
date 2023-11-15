import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:intl/intl.dart';

import '../../../core/database.dart';
import '../../../model/booked_slot_model.dart';
import '../../../model/doctor_model.dart';
import '../../../model/user_model.dart';
import '../../../utils/app_constants.dart';
import '../../../utils/user_session.dart';

class BookedAppointmentScreenController extends GetxController {
  Database database = Database();
  UserSession userSession = UserSession();
  Rx<DoctorModel> doctorModel = DoctorModel.empty().obs;
  Rx<UserModel> userModel = UserModel.empty().obs;
  RxList<DoctorModel> doctorUsers = <DoctorModel>[].obs;
  RxList<BookedSlot> bookedSlots = <BookedSlot>[].obs;
  RxBool isLoading = true.obs;

  Future<void> getUserInfo() async {
    userModel.value = await userSession.getUserInformation();
  }
  Future<void> getDoctorInfo() async {
    doctorModel.value = await userSession.getDoctorInformation();
  }

  @override
  void onInit() async {
    await getUserInfo();
    getDoctorInfo();
    fetchDoctorUsers();
    await fetchDay();
    isLoading.value = false;

    super.onInit();
  }

  Future<void> logout() async {
    userSession.logOut();
    Get.offAllNamed(kLoginScreen);
  }

  Future<void> fetchDoctorUsers() async {
    try {
      final QuerySnapshot querySnapshot =
          await FirebaseFirestore.instance.collection('doctor_users').get();

      final List<DoctorModel> users = querySnapshot.docs.map((doc) {
        final data = doc.data() as Map<String, dynamic>;
        return DoctorModel(
          firstName: data['FirstName'] ?? '',
          lastName: data['lastName'] ?? '',
          age: data['age'] ?? '',
          email: data['email'] ?? '',
          specialization: data['speciality'] ?? '',
          bio: data['bio'] ?? '',
          location: data['location'] ?? '',
          image: data['image'] ?? '',
          id: doc.id ?? '',
          errorMsg: '',
        );
      }).toList();

      doctorUsers.assignAll(users);
      // Data loading is complete, set isLoading to false
    } catch (e) {
      print('Error fetching doctor users: $e');
    }
  }

  Future<void> fetchDay() async {
    final daysOfWeek = ['Monday', 'Tuesday', 'Wednesday', 'Thursday', 'Friday'];
    for (final dayName in daysOfWeek) {
      List<BookedSlot> slots =
          await fetchBookedSlots(userModel.value.id, dayName);
      if (slots.isNotEmpty) {
        bookedSlots.insertAll(0, slots);
      }
    }
  }
  String formatDate(DateTime date) {
    final formatter = DateFormat('yyyy-MM-dd');
    return formatter.format(date);
  }
  Future<List<BookedSlot>> fetchBookedSlots(
      String userId, String dayName) async {
    try {
      final userId = userModel.value.id;

      final QuerySnapshot querySnapshot = await FirebaseFirestore.instance
          .collection('booked_appointments')
          .where('userId', isEqualTo: userId)
          .where('dayName', isEqualTo: dayName)
          .get();

      final List<BookedSlot> bookedSlotsForDay = querySnapshot.docs.map((doc) {
        final data = doc.data() as Map<String, dynamic>;

        return BookedSlot(
          callId: data['callId'],
          doctorId: data['doctorId'], // Retrieve doctorId
          date: data['date'].toDate() as DateTime,
          startTime: database.parseTimeOfDay(data['start_time'] as String),
          endTime: database.parseTimeOfDay(data['end_time'] as String),
          doctor: doctorUsers.firstWhere(
                (doc) => doc.id == data['doctorId'],
            orElse: () => DoctorModel.empty(),
          ),
        );
      }).toList();

      if (bookedSlotsForDay.isNotEmpty) {
        return bookedSlotsForDay;
      } else {
        print('No booked slots available for $dayName');
        return [];
      }
    } catch (e) {
      print('Error fetching booked slots for $dayName: $e');
      return [];
    }
  }
  void CallOptions() {
    Get.bottomSheet(
      SingleChildScrollView(
        child: ClipRRect(
          borderRadius: const BorderRadius.only(
            topLeft: Radius.circular(10.0),
            topRight: Radius.circular(10.0),
          ),
          child: Container(
            color: Colors.white,
            height: 200,
            child: Padding(
              padding: const EdgeInsets.all(8.0),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.stretch,
                children: [
                  const Text(
                    "Select an action",
                    style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
                    textAlign: TextAlign.center,
                  ),
                  const SizedBox(
                    height: 10,
                  ),
                  ElevatedButton.icon(
                    onPressed: () {
                      Get.toNamed(kOngoingCallScreen,arguments: 1234);
                    },
                    icon: const Icon(Icons.phone),
                    label: const Text("VOICE CALL"),
                  ),
                  ElevatedButton.icon(
                    onPressed: () {
                      Get.toNamed(kVideoCallScreen,arguments: 1234);

                    },
                    icon: const Icon(Icons.video_call_sharp),
                    label: const Text("VIDEO CALL"),
                  ),
                  const SizedBox(
                    height: 10,
                  ),
                  ElevatedButton.icon(
                    onPressed: () {
                      Get.back();
                    },
                    icon: const Icon(Icons.close),
                    label: const Text("CANCEL"),
                  ),
                ],
              ),
            ),
          ),
        ),
      ),
    );

  }
}
