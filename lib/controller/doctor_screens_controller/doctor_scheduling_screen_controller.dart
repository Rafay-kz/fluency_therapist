
import 'package:fluency_therapist/core/database.dart';
import 'package:fluency_therapist/utils/utills.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:intl/intl.dart';

import '../../../model/doctor_model.dart';
import '../../../model/user_model.dart';
import '../../../utils/user_session.dart';
import '../../model/timeslots_model.dart';


class DoctorSchedulingScreenController extends GetxController {
  //Declaration
  Utils utils = Utils();
  UserSession userSession = UserSession();
  Rx<UserModel> userModel = UserModel.empty().obs;
  Rx<DoctorModel> doctorModel = DoctorModel.empty().obs;

  //Variables to save date and times
  TimeOfDay selectedStartTime = TimeOfDay.now();
  TimeOfDay selectedEndTime = TimeOfDay.now();
  late DateTime initialDate;
  late DateTime selectedDate;
  late DateTime currentDate;
  RxBool isInitialized = false.obs;

  //Map of lists to store time slots.
  final Map<int, RxList<TimeSlot>> timeSlotsMap = <int, RxList<TimeSlot>>{};

//To retrieve doctor information.
  Future<void> getDoctorInfo() async {
    doctorModel.value = await userSession.getDoctorInformation();
  }

  @override
  void onInit() async {
    await getDoctorInfo();
    // To initialize all lists of the map as empty.
    for (int i = 0; i < 5; i++) {
      timeSlotsMap[i] = <TimeSlot>[].obs;
      loadTimeSlotsFromLocal(i);
      await loadTimeSlotsFromFirestore(i);
      isInitialized.value = true;
    }
    super.onInit();
  }

  Future<void> saveTimeSlotsToLocal(int tabIndex) async {
    await userSession.saveTimeSlotsToLocal(tabIndex, timeSlotsMap);
  }

  Future<void> loadTimeSlotsFromLocal(int tabIndex) async {
    await userSession.loadTimeSlotsFromLocal(tabIndex, timeSlotsMap);
  }
//Method to display correct days to add slots.
  void calculateDateValues(int tabIndex) {
    selectedStartTime = TimeOfDay.now();
    selectedEndTime = TimeOfDay.now();
    currentDate = DateTime.now();

    int daysToAdd = (tabIndex - currentDate.weekday + 1 + 7) % 7;
    initialDate = currentDate.add(Duration(days: daysToAdd));
    selectedDate = initialDate;
  }

  //Radio button value updater
  RxInt selectedSlotIndex = RxInt(-1);

  void setSelectedSlotIndex(int index) {
    selectedSlotIndex.value = index;
  }

//Method to add time slots
  void addTimeSlot(int dayIndex, TimeSlot newSlot) {
    // Check if the same time slot already exists
    if (!isDuplicateTimeSlot(dayIndex, newSlot)) {
      timeSlotsMap[dayIndex]?.add(newSlot);
      addTimeSlotToFirestore(dayIndex, newSlot);
      saveTimeSlotsToLocal(dayIndex);
    } else {
      // Handle the case where a duplicate slot is being added
      // You can show an error message or take any appropriate action here
      utils.toastMessage("Slot already added");
    }
  }

  bool isDuplicateTimeSlot(int dayIndex, TimeSlot newSlot) {
    // Check if a time slot with the same date, start time, and end time exists in the list
    final existingSlots = timeSlotsMap[dayIndex] ?? <TimeSlot>[];
    return existingSlots.any((slot) =>
    slot.date == newSlot.date &&
        slot.startTime == newSlot.startTime &&
        slot.endTime == newSlot.endTime);
  }




//Method to remove time slots.
  Future<void> removeTimeSlot(int dayIndex, int index) async {
    print('Attempting to remove time slot at dayIndex: $dayIndex, index: $index');
    final removedSlot = timeSlotsMap[dayIndex]?[index];
    if (removedSlot != null) {

      print('Removed slot: $removedSlot');
      // Remove the slot from Firestore and wait for it to complete
      await removeTimeSlotFromFirestore(dayIndex, index);
      utils.toastMessage('Slot removed successfully');

      await saveTimeSlotsToLocal(dayIndex);
    }
  }

  //Method to add data to firestore
  Future<void> addTimeSlotToFirestore(int dayIndex, TimeSlot newSlot) async {
    Database database = Database();
    database.addTimeSlotToFirestore(dayIndex: dayIndex, newSlot: newSlot, doctorId: doctorModel.value.id);

  }
//Method to format date.
  String formatDate(DateTime date) {
    final formatter = DateFormat('yyyy-MM-dd');
    return formatter.format(date);
  }


  Future<void> loadTimeSlotsFromFirestore(int tabIndex) async {
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


  Future<void> removeTimeSlotFromFirestore(int dayIndex, int index) async {
    print('Attempting to remove time slot from Firestore at dayIndex: $dayIndex, index: $index');
    Database database = Database();
    if (timeSlotsMap[dayIndex] != null && timeSlotsMap[dayIndex]!.isNotEmpty) {
      final removedSlot = timeSlotsMap[dayIndex]?[index];
      if (removedSlot != null) {
        final doctorId = doctorModel.value.id;
        await database.removeTimeSlotFromFirestore(doctorId, dayIndex, removedSlot);
        print('Successfully removed time slot from Firestore');
        // Remove the slot from the local list
        timeSlotsMap[dayIndex]?.removeAt(index);
        print('Time slots after removal from Firestore: ${timeSlotsMap[dayIndex]}');
      } else {
        print('No time slot found at dayIndex: $dayIndex, index: $index');
      }
    } else {
      print('No time slots available for removal at dayIndex: $dayIndex');
    }
  }


}








//Method to add data to firestore
// Future<void> addTimeSlotToFirestore(int dayIndex, TimeSlot newSlot) async {
//   final doctorId = doctorModel.value.id;
//   final dayName = _getDayName(dayIndex);
//
//   final timeSlotsCollection = firestore
//       .collection('doctor_users')
//       .doc(doctorId)
//       .collection('time_slots')
//       .doc(dayName)
//       .collection('slots');
//
//   //converting to strings
//   final startTimeString = formatTimeOfDay(newSlot.startTime);
//   final endTimeString = formatTimeOfDay(newSlot.endTime);
//
//   await timeSlotsCollection.add({
//     'date': newSlot.date,
//     'start_time': startTimeString,
//     'end_time': endTimeString,
//   });
//
// }

// Future<void> loadTimeSlotsFromFirestore(int tabIndex) async {
//   final doctorId = doctorModel.value.id;
//   final dayName = _getDayName(tabIndex);
//
//
//   // Check if doctorId and dayName are not empty before proceeding
//   if (doctorId.isNotEmpty && dayName.isNotEmpty) {
//     final timeSlotsCollection = FirebaseFirestore.instance
//         .collection('doctor_users')
//         .doc(doctorId)
//         .collection('time_slots')
//         .doc(dayName)
//         .collection('slots');
//
//     try {
//       final querySnapshot = await timeSlotsCollection.get();
//
//       if (querySnapshot.docs.isNotEmpty) {
//         final timeSlots = querySnapshot.docs.map((doc) {
//           final data = doc.data();
//
//
//           return TimeSlot(
//             date: data['date'].toDate() as DateTime, // Convert Firestore Timestamp to DateTime
//             startTime: parseTimeOfDay(data['start_time'] as String),
//             endTime: parseTimeOfDay(data['end_time'] as String),
//           );
//         }).toList();
//
//         timeSlotsMap[tabIndex]?.assignAll(timeSlots);
//       } else {
//         print('No Time Slots found in Firestore for Doctor ID: $doctorId, Day Name: $dayName');
//       }
//     } catch (e) {
//       print('Error loading Time Slots from Firestore: $e');
//     }
//   } else {
//     print('Doctor ID or Day Name is empty. Cannot construct Firestore path.');
//   }
//
// }


// Future<void> removeTimeSlotFromFirestore(int dayIndex, TimeSlot removedSlot) async {
//   final doctorId = doctorModel.value.id;
//   final dayName = _getDayName(dayIndex);
//
//   if (doctorId.isNotEmpty && dayName.isNotEmpty) {
//     final timeSlotsCollection = FirebaseFirestore.instance
//         .collection('doctor_users')
//         .doc(doctorId)
//         .collection('time_slots')
//         .doc(dayName)
//         .collection('slots');
//
//     // Find the document to delete based on date and time
//     final startTimeString = formatTimeOfDay(removedSlot.startTime);
//     final endTimeString = formatTimeOfDay(removedSlot.endTime);
//
//     final querySnapshot = await timeSlotsCollection
//         .where('date', isEqualTo: removedSlot.date)
//         .where('start_time', isEqualTo: startTimeString)
//         .where('end_time', isEqualTo: endTimeString)
//         .get();
//
//     if (querySnapshot.docs.isNotEmpty) {
//       final docId = querySnapshot.docs.first.id;
//       await timeSlotsCollection.doc(docId).delete();
//
//     } else {
//       print('No matching Time Slot found in Firestore for removal.');
//     }
//   } else {
//     print('Doctor ID or Day Name is empty. Cannot construct Firestore path for removal.');
//   }
// }

// void removeTimeSlot(int dayIndex, int index) {
//   final removedSlot = timeSlotsMap[dayIndex]?[index];
//   if (removedSlot != null) {
//     // Remove the slot from the local list
//     timeSlotsMap[dayIndex]?.removeAt(index);
//
//     // Remove the slot from Firestore
//     removeTimeSlotFromFirestore(dayIndex, removeSlot);
//
//     saveTimeSlotsToLocal(dayIndex);
//   }  }
