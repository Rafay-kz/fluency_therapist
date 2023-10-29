import 'package:cloud_firestore/cloud_firestore.dart';
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
          age: data['age'] ?? '',
            email: data['age'] ?? '',
            userName: data['username'] ?? '',
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
    final daysOfWeek = ['Monday', 'Tuesday', 'Wednesday', 'Thursday', 'Friday'];
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
}
