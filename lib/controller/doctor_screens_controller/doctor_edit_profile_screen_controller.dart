import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:image_picker/image_picker.dart';

import '../../model/doctor_model.dart';
import '../../utils/app_constants.dart';
import '../../utils/user_session.dart';

class DoctorEditProfileScreenController extends GetxController {
  Rx<TextEditingController> nameTEController = TextEditingController().obs;
  Rx< TextEditingController> emailTEController = TextEditingController().obs;
  Rx<TextEditingController >specialityController = TextEditingController().obs;
  Rx<TextEditingController> bioController = TextEditingController().obs;
  Rx<TextEditingController> locationController = TextEditingController().obs;


  var fullName = '';
  var speciality = '';
  var bio = '';
  var location = '';
  var availabilityStart = TimeOfDay(hour: 9, minute: 0);
  var availabilityEnd = TimeOfDay(hour: 22, minute: 0);

  // Drop down button values updater
  final RxString startDay = RxString('');

  void setStartDay(String day) {
    startDay.value = day;
  }

  // Drop down button values updater2
  final RxString endDay = RxString('');

  void setEndDay(String day) {
    endDay.value = day;
  }


  String? validateFullName(String value) {
    if (value.isEmpty) {
      return 'Name cannot be empty';
    }
    if (value.length < 4) {
      return 'Please enter your full name';
    }
    return null;
  }

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
      return 'Location cannot be empy';
    }
    if (value.length < 3) {
      return 'Improper location';
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

  Future getImage() async {
    final ImagePicker _picker = ImagePicker();
    final image = await _picker.pickImage(source: ImageSource.camera);
    if (image != null) {
      doctorModel.value.image='';
      imagePath.value = image.path.toString();
    }
  }

  Future getGalleryImage() async {
    final ImagePicker _picker = ImagePicker();
    final image = await _picker.pickImage(source: ImageSource.gallery);
    if (image != null) {
      doctorModel.value.image='';
      imagePath.value = image.path.toString();
    }

    void onRegisterTap() {
      GetUtils.isAlphabetOnly(
        nameTEController.value.text,
      )
          ? print('valid')
          : print('invalid Name');
      GetUtils.isEmail(emailTEController.value.text)
          ? print('Valid')
          : print('Invalid Email');

    }
  }
  UserSession userSession = UserSession();
  Rx<DoctorModel> doctorModel=DoctorModel.empty().obs;


  @override
  void onInit(){
    getDoctorInfo();
    super.onInit();
  }

  Future<void> getDoctorInfo() async{
    doctorModel.value=await userSession.getDoctorInformation();
    nameTEController.value.text=doctorModel.value.userName;
    emailTEController.value.text=doctorModel.value.email;
  }

  Future<void> logout () async {
    userSession.logOut();
    Get.offAllNamed(kLoginScreen);

  }
  Future<void> editProfile() async {

    FirebaseFirestore firebaseFirestore = FirebaseFirestore.instance;
    await firebaseFirestore.collection('doctor_users').doc(doctorModel.value.id).update({
      'image': imagePath.value,
      'username': nameTEController.value.text,
      'location': locationController.value.text,
      'bio': bioController.value.text,
      'speciality':specialityController.value.text,
    });
  }


}
