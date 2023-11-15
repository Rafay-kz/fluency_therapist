import 'dart:io';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_storage/firebase_storage.dart';
import 'package:fluency_therapist/controller/user_screens_controller/home_screens_controller/home_screen_controller.dart';
import 'package:fluency_therapist/custom%20widgets/progress_indicator.dart';
import 'package:fluency_therapist/utils/app_constants.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:image_picker/image_picker.dart';
import '../../../model/user_model.dart';
import '../../../utils/user_session.dart';


class EditProfileScreenController extends GetxController{

  Rx<TextEditingController> nameTEController = TextEditingController().obs;
 Rx< TextEditingController> emailTEController = TextEditingController().obs;
  RxString imageUrl=''.obs;
HomeScreenController homeScreenController=Get.find(tag:kHomeScreenController);


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

  RxBool obscureText=true.obs;
  RxString imagePath = ''.obs;
  Future getImage() async {
    final ImagePicker _picker = ImagePicker();
    final XFile? image = await _picker.pickImage(source: ImageSource.camera);
    print('${image?.path}');
    if(image != null){
      imagePath.value = image.path.toString();

    }

  }
  Future getGalleryImage() async {
    final ImagePicker _picker = ImagePicker();
    final XFile? image = await _picker.pickImage(source: ImageSource.gallery);
    if (image != null) {
      userModel.value.image='';
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
  Rx<UserModel> userModel=UserModel.empty().obs;
  ProgressDialog progressDialog=ProgressDialog();

  @override
  void onInit(){
    getUserInfo();
    super.onInit();
  }

  Future<void> getUserInfo() async{
    userModel.value=await userSession.getUserInformation();
    nameTEController.value.text=userModel.value.firstName;
    emailTEController.value.text=userModel.value.email;
    imageUrl.value=userModel.value.image;
  }

  Future<void> editProfile() async {
    progressDialog.showDialog();
    String uniqueFileName=DateTime.now().millisecondsSinceEpoch.toString();
    Reference referenceRoot=FirebaseStorage.instance.ref();
    Reference referenceDirImages=referenceRoot.child('images');
    Reference referenceImageToUpload=referenceDirImages.child(uniqueFileName);
    try{
      await referenceImageToUpload.putFile(File(imagePath.value));
      imageUrl.value= await referenceImageToUpload.getDownloadURL();
    }catch(error){}
    FirebaseFirestore firebaseFireStore = FirebaseFirestore.instance;
    await firebaseFireStore.collection('users').doc(userModel.value.id).update({
      'image': imageUrl.value,
      'firstName': nameTEController.value.text,
    }).then((value) async{
      DocumentSnapshot userSnapshot = await FirebaseFirestore.instance
          .collection('users')
          .doc(userModel.value.id)
          .get();
      Map<String, dynamic> map = userSnapshot.data() as Map<String, dynamic>;
      if (userSnapshot.data() is Map) {
        UserModel userModelX = UserModel.fromJson(map,'',userModel.value.id);
        userSession.userInformation(userModel: userModelX);
        homeScreenController.userModel.value=userModelX;
      }
      progressDialog.dismissDialog();
      Get.offAllNamed(kHomeScreen);
    }


    );

  }


}