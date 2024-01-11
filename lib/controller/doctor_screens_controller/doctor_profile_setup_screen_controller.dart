import 'dart:io';

import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:fluency_therapist/core/database.dart';
import 'package:fluency_therapist/utils/app_constants.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:image_picker/image_picker.dart';

import 'package:firebase_storage/firebase_storage.dart';

import '../../../custom widgets/progress_indicator.dart';
import '../../../model/doctor_model.dart';
import '../../../utils/user_session.dart';
import 'doctor_home_screen_controller.dart';

class DoctorProfileSetUpScreenController extends GetxController {

  Rx<TextEditingController >specialityTEController = TextEditingController().obs;
  Rx<TextEditingController> bioTEController = TextEditingController().obs;
  Rx<TextEditingController> locationTEController = TextEditingController().obs;
  DoctorHomeScreenController doctorhomeScreenController=Get.find(tag:kDoctorHomeScreenController);



  RxString imageUrl = ''.obs;
  Database database = Database();
  final formKey = GlobalKey<FormState>();

  var speciality = '';
  var bio = '';
  var location = '';

  // Drop down button values updater

  String? validateSpeciality(String value) {
    if (value.isEmpty) {
      return 'Speciality cannot be empty';
    }
    if (value.length < 4) {
      return 'Improper speciality';
    }
    return null;
  }

  String? validateLocation(String value) {
    if (value.isEmpty) {
      return 'Location cannot be empty';
    }
    if (value.length < 3) {
      return 'Improper location';
    }
    return null;
  }

  String? validateBio(String value) {
    if (value.isEmpty) {
      return 'Input cannot be empty';
    }
    if (value.length > 100) {
      return 'Input should have a maximum of 100 characters';
    }
    return null;
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

  RxBool obscureText = true.obs;
  RxString imagePath = ''.obs;
  ProgressDialog pd = ProgressDialog();

  Future getImage() async {
    final ImagePicker _picker = ImagePicker();
    final XFile? image = await _picker.pickImage(source: ImageSource.camera);
    print('${image?.path}');

    if (image != null) {
      imagePath.value = image.path.toString();
    }
  }

  Future getGalleryImage() async {
    final ImagePicker _picker = ImagePicker();
    final XFile? image = await _picker.pickImage(source: ImageSource.gallery);

    if (image != null) {
      doctorModel.value.image = '';
      imagePath.value = image.path.toString();
    }

    void onRegisterTap() {}
  }

  UserSession userSession = UserSession();
  Rx<DoctorModel> doctorModel = DoctorModel.empty().obs;

  @override
  void onInit() {
    getDoctorInfo();
    super.onInit();
  }

  Future<void> getDoctorInfo() async {
    try {
      doctorModel.value = await userSession.getDoctorInformation();
      if (doctorModel.value != null) {
        imageUrl.value = doctorModel.value.image;
        print('Doctor ID: ${doctorModel.value.id}');
        print('Doctor Image URL: $imageUrl');
      } else {
        print('Error: Doctor model is null');
      }
    } catch (error) {
      print('Error during getDoctorInfo: $error');
    }
  }



  Future<void> logout() async {
    userSession.logOut();
    Get.offAllNamed(kLoginScreen);
  }

  Future<void> editProfile() async {
    if (formKey.currentState!.validate()) {
      pd.showDialog();

    try {
      // Check if imagePath is not empty
      if (imagePath.value.isNotEmpty) {
        String uniqueFileName =
        DateTime.now().millisecondsSinceEpoch.toString();
        Reference referenceRoot = FirebaseStorage.instance.ref();
        Reference referenceDirImages = referenceRoot.child('images');
        Reference referenceImageToUpload =
        referenceDirImages.child(uniqueFileName);

        // Upload the image file
        await referenceImageToUpload.putFile(File(imagePath.value));
        imageUrl.value =
        await referenceImageToUpload.getDownloadURL();
      }

      // Check if the doctorModel ID is not empty
      if (doctorModel.value.id.isNotEmpty) {
        // Update other data in Firestore
        FirebaseFirestore firebaseFirestore = FirebaseFirestore.instance;
        CollectionReference doctorCollectionRef =
        firebaseFirestore.collection('doctor_users');

        await doctorCollectionRef.doc(doctorModel.value.id).update({
          'image': imageUrl.value,
          'specialization': specialityTEController.value.text,
          'location': locationTEController.value.text,
          'bio': bioTEController.value.text,
          'isProfileSetUp' : true,
        });
      } else {
        // Handle the case where the doctorModel ID is empty or null
        print('Error: doctorModel ID is empty or null');
      }

      pd.dismissDialog();
      Get.offAllNamed(kDoctorHomeScreen);
    } catch (error) {
      print('Error during editProfile: $error');
      pd.dismissDialog();
      // Handle the error, show a message, or log it as needed.
      // You might want to display an error message to the user.
    }
  } }

  // Future<void> profileDataUpdate() async {
  //   String doctorId = doctorModel.value.id; // Replace with the actual doctor ID
  //
  //   CollectionReference collection = FirebaseFirestore.instance.collection('doctor_users');
  //   Map<String, dynamic> newData = {
  //     'specialization': specialityTEController.text.toString(),
  //     'location': locationTEController.text.toString(),
  //     'bio': bioTEController.text.toString(),
  //   };
  //   await collection.doc(doctorId).update(newData);
  //
  // }
  //
  // Future<void> onTapAdd() async {
  //   ProgressDialog pd = ProgressDialog();
  //   if (formKey.currentState!.validate()) {
  //     pd.showDialog();
  //
  //     try {
  //       await editProfile();
  //     } catch (error) {
  //       print(error);
  //       pd.dismissDialog();
  //       Utils().toastMessage(error.toString());
  //     }
  //   }
  // }


}
