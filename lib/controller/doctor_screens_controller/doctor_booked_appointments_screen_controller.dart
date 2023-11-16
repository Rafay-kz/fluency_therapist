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

class DoctorBookedAppointmentsScreenController extends GetxController {
  Database database = Database();
  UserSession userSession = UserSession();
  Rx<DoctorModel> doctorModel = DoctorModel.empty().obs;
  RxList<UserModel> regularUsers = <UserModel>[].obs;
  RxList<BookedSlot> bookedSlots = <BookedSlot>[].obs;
  RxBool isLoading = true.obs;

  Future<void> getDoctorInfo() async {
    doctorModel.value = await userSession.getDoctorInformation();
  }

  @override
  void onInit() async {
    await getDoctorInfo();
     fetchRegularUsers();
    await fetchDay();
    isLoading.value = false;

    super.onInit();
  }

  Future<void> logout() async {
    userSession.logOut();
    Get.offAllNamed(kLoginScreen);
  }


  String formatDate(DateTime date) {
    final formatter = DateFormat('yyyy-MM-dd');
    return formatter.format(date);
  }
  Future<void> fetchRegularUsers() async {
    try {
      final QuerySnapshot querySnapshot =
          await FirebaseFirestore.instance.collection('users').get();

      final List<UserModel> users = querySnapshot.docs.map((doc) {
        final data = doc.data() as Map<String, dynamic>;
        print('User ID: ${data['id']}');
        print('Username: ${data['username']}');
        print('Age: ${data['age']}');
        print('Image: ${data['image']}');
        return UserModel(
          id: data['id'] ?? '',
          errorMsg: data['errorMsg'] ?? '',

            email: data['age'] ?? '',
            firstName: data['firstName'] ?? '',
            lastName: data['lastName'] ?? '',
            image: data['image'] ?? '',
           );
      }).toList();

      regularUsers.assignAll(users);
      // Data loading is complete, set isLoading to false
    } catch (e) {
      print('Error fetching doctor users: $e');
    }
  }

  Future<void> fetchDay() async {
    final daysOfWeek = ['Monday', 'Tuesday', 'Wednesday', 'Thursday', 'Friday', 'Saturday', 'Sunday'];
    for (final dayName in daysOfWeek) {
      List<BookedSlot> slots =
          await fetchBookedSlots(doctorModel.value.id, dayName);
      if (slots.isNotEmpty) {
        bookedSlots.insertAll(0, slots);
      }
    }
  }

  Future<List<BookedSlot>> fetchBookedSlots(
      String doctorId, String dayName) async {
    try {
      final QuerySnapshot querySnapshot = await FirebaseFirestore.instance
          .collection('booked_appointments')
          .where('doctorId', isEqualTo: doctorId) // Filter by doctorId
          .where('dayName', isEqualTo: dayName) // Filter by dayName
          .get();

      final List<BookedSlot> bookedSlotsForDay = querySnapshot.docs.map((doc) {
        final data = doc.data() as Map<String, dynamic>;

        print("Booked Slot User ID: ${data['userId']}");
        return BookedSlot(
          callId: data['callId'],
          doctorId: data['userId'],
          date: data['date'].toDate() as DateTime,
          startTime: database.parseTimeOfDay(data['start_time'] as String),
          endTime: database.parseTimeOfDay(data['end_time'] as String),
          user: regularUsers.firstWhere(
            (doc) => doc.id == data['userId'],
            orElse: () => UserModel.empty(),
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
  final now = DateTime.now();

  bool isButtonEnabled(BookedSlot bookedSlot) {
    final startTime = DateTime(
        bookedSlot.date.year, bookedSlot.date.month, bookedSlot.date.day,
        bookedSlot.startTime.hour, bookedSlot.startTime.minute);
    final endTime = DateTime(
        bookedSlot.date.year, bookedSlot.date.month, bookedSlot.date.day,
        bookedSlot.endTime.hour, bookedSlot.endTime.minute);

    // Enable the button if the current time is between the start and end times
    return now.isAfter(startTime) && now.isBefore(endTime);
  }

  Future<void> deleteAppointmentsForUser(String doctorId) async {
    final QuerySnapshot querySnapshot = await FirebaseFirestore.instance
        .collection('booked_appointments')
        .where('doctorId', isEqualTo: doctorId)
        .get();

    if (querySnapshot.docs.isNotEmpty) {
      for (QueryDocumentSnapshot document in querySnapshot.docs) {
        final appointmentId = document.id;
        await FirebaseFirestore.instance
            .collection('booked_appointments')
            .doc(appointmentId)
            .delete();
      }

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
