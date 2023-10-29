import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:get/get.dart';
import 'package:intl/intl.dart';

import '../../../core/database.dart';
import '../../../model/doctor_model.dart';
import '../../../model/timeslots_model.dart';
import '../../../model/user_model.dart';
import '../../../utils/user_session.dart';
import '../../../utils/utills.dart';

class AppointmentBookingScreenController extends GetxController {
  final Map<int, RxList<TimeSlot>> timeSlotsMap = <int, RxList<TimeSlot>>{};

  UserSession userSession = UserSession();
  Rx<UserModel> userModel = UserModel.empty().obs;
  Rx<DoctorModel> doctorModel = DoctorModel.empty().obs;
  RxBool isInitialized = false.obs;

  void getDoctorInfo() {
    doctorModel.value = Get.arguments;
  }

  Future<void> getUserInfo() async {
    userModel.value = await userSession.getUserInformation();
  }

  @override
  void onInit() async {
    getUserInfo();
    getDoctorInfo();
    for (int i = 0; i < 5; i++) {
      timeSlotsMap[i] = <TimeSlot>[].obs;
      loadTimeSlotsFromFirestore(i);
    }
    isInitialized.value = true;

    super.onInit();
  }

  Future<void> loadTimeSlotsFromFirestore(
    int tabIndex,
  ) async {
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

  List<RxInt> selectedSlotIndices = List.generate(5, (index) => RxInt(-1));

  void setSelectedSlotIndex(int tabIndex, int index) {
    selectedSlotIndices[tabIndex].value = index;
  }

  String formatDate(DateTime date) {
    final formatter = DateFormat('yyyy-MM-dd');
    return formatter.format(date);
  }

  String _getDayName(int tabIndex) {
    switch (tabIndex) {
      case 0:
        return 'Monday';
      case 1:
        return 'Tuesday';
      case 2:
        return 'Wednesday';
      case 3:
        return 'Thursday';
      case 4:
        return 'Friday';
      default:
        return '';
    }
  }

  Utils utils = Utils();

  void bookAppointment(int tabIndex) {
    final selectedSlotIndex = selectedSlotIndices[tabIndex].value;
    if (selectedSlotIndex != -1) {
      final selectedSlot = timeSlotsMap[tabIndex]?[selectedSlotIndex];

      if (selectedSlot?.isAvailable == true) {
        final userId = userModel.value.id;
        final doctorId = doctorModel.value.id; // Get the doctor's ID

        final dayName = _getDayName(tabIndex);

        // Create a reference to the "booked_appointments" collection
        final bookedAppointmentsCollection = FirebaseFirestore.instance.collection('booked_appointments');

        // Create a new document to represent the booked appointment
        final newAppointment = bookedAppointmentsCollection.doc();

        final appointmentData = {
          'date': selectedSlot?.date,
          'start_time': '${selectedSlot?.startTime.hour}:${selectedSlot?.startTime.minute}',
          'end_time': '${selectedSlot?.endTime.hour}:${selectedSlot?.endTime.minute}',
          'doctorId': doctorId, // Associate the slot with the doctor
          'userId': userId, // Associate the slot with the user
          'dayName': dayName,
          // Add other slot details if needed.
        };

        newAppointment.set(appointmentData).then((_) {
          // Now, update the slot in the "doctor_users" collection to mark it as booked
          final doctorUserSlotsCollection = FirebaseFirestore.instance
              .collection('doctor_users')
              .doc(doctorId)
              .collection('time_slots')
              .doc(dayName)
              .collection('slots');

          // Ensure that the selected slot index is within bounds
          doctorUserSlotsCollection.get().then((querySnapshot) {
            final documents = querySnapshot.docs;
            if (selectedSlotIndex < documents.length) {
              final selectedSlotId = documents[selectedSlotIndex].id;

              doctorUserSlotsCollection.doc(selectedSlotId).update({
                'is_available': false,
                'booked_by_user_id': userId,
              }).then((_) {
                // Booking was successful, update the UI, and reset the selected slot index.
                loadTimeSlotsFromFirestore(tabIndex);
                selectedSlotIndices[tabIndex].value = -1;
              }).catchError((error) {
                // Handle errors as needed.
              });
            }
          });
        }).catchError((error) {
          // Handle errors as needed.
        });
      } else {
        // The slot is already booked
        // You can display an error message or handle it as needed
      }
    } else {
      // No slot is selected
      // You can display an error message or handle it as needed
    }
  }




}
