import 'package:cloud_firestore/cloud_firestore.dart';
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
  final now = DateTime.now();
  Future<void> deleteAppointmentsForUser(String userId) async {
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
      }

    }
  }
}
