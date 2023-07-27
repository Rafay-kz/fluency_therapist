import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:fluency_therapist/controller/auth_screens_controller/database.dart';
import 'package:get/get.dart';
import 'package:flutter/material.dart';
import 'package:image_picker/image_picker.dart';


class UserProfileScreenController extends GetxController {

  void _fetchUserData() async {
    // Initialize Firebase if you haven't already done so
    // ...

    // Create an instance of the Database class
    Database database = Database();

    // Replace 'user_id_here' with the actual user ID you want to retrieve data for
    String userId = '416QTVSNMvMjZcWzQUVW';

    try {
      // Call the getUserData function to retrieve the user's data
      DocumentSnapshot<Map<String, dynamic>> snapshot = await database.getUserData(userId);

      if (snapshot.exists) {
        // User data found
        Map<String, dynamic> userData = snapshot.data()!;
        print('User Data: $userData');
      } else {
        // User data not found
        print('User data not found for user with ID: $userId');
      }
    } catch (e) {
      print('Error fetching user data: $e');
    }
  }

  void imagePickerOption() {
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
                    "Pic Image From",
                    style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
                    textAlign: TextAlign.center,
                  ),
                  const SizedBox(
                    height: 10,
                  ),
                  ElevatedButton.icon(
                    onPressed: () {
                      getImage();
                    },
                    icon: const Icon(Icons.camera),
                    label: const Text("CAMERA"),
                  ),
                  ElevatedButton.icon(
                    onPressed: () {
                      getGalleryImage();
                    },
                    icon: const Icon(Icons.image),
                    label: const Text("GALLERY"),
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

  RxString imagePath = ''.obs;

  Future getImage() async {
    final ImagePicker _picker = ImagePicker();
    final image = await _picker.pickImage(source: ImageSource.camera);
    if (image != null) {
      imagePath.value = image.path.toString();
    }
  }

  Future getGalleryImage() async {
    final ImagePicker _picker = ImagePicker();
    final image = await _picker.pickImage(source: ImageSource.gallery);
    if (image != null) {
      imagePath.value = image.path.toString();
    }
  }
}
