import 'dart:io';

import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:image_picker/image_picker.dart';

import '../../custom widgets/progress_indicator.dart';
import '../../model/doctor_model.dart';
import '../../utils/app_constants.dart';
import '../../utils/user_session.dart';
import 'package:firebase_storage/firebase_storage.dart';

import 'doctor_home_screen_controller.dart';

class DoctorEditProfileScreenController extends GetxController {
  Rx<TextEditingController> nameTEController = TextEditingController().obs;
  Rx< TextEditingController> emailTEController = TextEditingController().obs;
  Rx<TextEditingController >specialityTEController = TextEditingController().obs;
  Rx<TextEditingController> bioTEController = TextEditingController().obs;
  Rx<TextEditingController> locationTEController = TextEditingController().obs;
  DoctorHomeScreenController doctorhomeScreenController=Get.find(tag:kDoctorHomeScreenController);
  RxString imageUrl=''.obs;
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
    specialityTEController.value.text=doctorModel.value.speciality;
    bioTEController.value.text=doctorModel.value.bio;
    locationTEController.value.text=doctorModel.value.location;
    imageUrl.value=doctorModel.value.image;
  }

  Future<void> logout () async {
    userSession.logOut();
    Get.offAllNamed(kLoginScreen);

  }
  Future<void> editProfile() async {
    pd.showDialog();
    String uniqueFileName=DateTime.now().millisecondsSinceEpoch.toString();
    Reference referenceRoot=FirebaseStorage.instance.ref();
    Reference referenceDirImages=referenceRoot.child('images');
    Reference referenceImageToUpload=referenceDirImages.child(uniqueFileName);
    try{
      await referenceImageToUpload.putFile(File(imagePath.value));
      imageUrl.value= await referenceImageToUpload.getDownloadURL();
    }catch(error){}
    FirebaseFirestore firebaseFireStore = FirebaseFirestore.instance;
    await firebaseFireStore.collection('doctor_users').doc(doctorModel.value.id).update({
      'image': imageUrl.value,
      'username': nameTEController.value.text,
      'location':locationTEController.value.text,
    'speciality' :specialityTEController.value.text,
     'bio ':bioTEController.value.text,
    }).then((value) async{
      DocumentSnapshot userSnapshot = await FirebaseFirestore.instance
          .collection('doctor_users')
          .doc(doctorModel.value.id)
          .get();
      Map<String, dynamic> map = userSnapshot.data() as Map<String, dynamic>;
      if (userSnapshot.data() is Map) {
        DoctorModel doctorModelX = DoctorModel.fromJson(map,'',doctorModel.value.id);
        userSession.doctorInformation(doctorModel: doctorModelX );
        doctorhomeScreenController.doctorModel.value=doctorModelX;
      }
      pd.dismissDialog();
      Get.offAllNamed(kDoctorHomeScreen);
    }


    );

  }


}
