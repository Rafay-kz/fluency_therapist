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
    await getDoctorInfo();
    await fetchDoctorUsers();
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
          firstName: data['firstName'] ?? '',
          age: data['age'] ?? '',
          email: data['email'] ?? '',
          lastName: data['lastName'] ?? '',
          specialization: data['specialization'] ?? '',
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
    final daysOfWeek = [
      'Monday',
      'Tuesday',
      'Wednesday',
      'Thursday',
      'Friday',
      'Saturday',
      'Sunday'
    ];
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
          doctorId: data['doctorId'],
          // Retrieve doctorId
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

  bool isButtonEnabled(BookedSlot bookedSlot) {
    final startTime = DateTime(
        bookedSlot.date.year,
        bookedSlot.date.month,
        bookedSlot.date.day,
        bookedSlot.startTime.hour,
        bookedSlot.startTime.minute);
    final endTime = DateTime(
        bookedSlot.date.year,
        bookedSlot.date.month,
        bookedSlot.date.day,
        bookedSlot.endTime.hour,
        bookedSlot.endTime.minute);

    // Enable the button if the current time is between the start and end times
    return now.isAfter(startTime) && now.isBefore(endTime);
  }

  final now = DateTime.now();

  Future<void> deleteAppointmentsForUser() async {
    final userId = userModel.value.id;

    final QuerySnapshot querySnapshot = await FirebaseFirestore.instance
        .collection('booked_appointments')
        .where('userId', isEqualTo: userId)
        .get();

    if (querySnapshot.docs.isNotEmpty) {
      for (QueryDocumentSnapshot document in querySnapshot.docs) {
        final appointmentId = document.id;
        await FirebaseFirestore.instance
            .collection('booked_appointments')
            .doc(appointmentId)
            .delete();
        print("DELETED");
        // Remove the deleted appointments from bookedSlots
        bookedSlots.removeWhere((slot) => slot.callId == appointmentId);
      }


    }
  }

  void callOptions(int callId) {
    print('Selected Call ID: $callId');
    Get.bottomSheet(
      SingleChildScrollView(
        child: ClipRRect(
          borderRadius: const BorderRadius.only(
            topLeft: Radius.circular(10.0),
            topRight: Radius.circular(10.0),
          ),
          child: Container(
            color: Colors.white,
            height: 250,
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
                      Get.toNamed(kOngoingCallScreen, arguments: callId);
                    },
                    icon: const Icon(Icons.phone),
                    label: const Text("VOICE CALL"),
                  ),
                  ElevatedButton.icon(
                    onPressed: () {
                      Get.toNamed(kVideoCallScreen, arguments: callId);
                    },
                    icon: const Icon(Icons.video_call_sharp),
                    label: const Text("VIDEO CALL"),
                  ),
                  ElevatedButton.icon(
                    onPressed: () {
                      Get.toNamed(kChatWithConsultantScreen, arguments: callId);
                    },
                    icon: const Icon(Icons.message_outlined),
                    label: const Text("CHAT"),
                  ),
                  const SizedBox(
                    height: 5,
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
