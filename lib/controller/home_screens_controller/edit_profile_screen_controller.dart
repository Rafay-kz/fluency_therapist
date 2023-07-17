import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:image_picker/image_picker.dart';

class EditProfileScreenController extends GetxController{

  TextEditingController nameTEController = TextEditingController();
  TextEditingController emailTEController = TextEditingController();
  TextEditingController passwordTEController = TextEditingController();

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
    final image = await _picker.pickImage(source: ImageSource.camera);
    if(image != null){
      imagePath.value = image.path.toString();

    }

  }
  Future getGalleryImage() async {
    final ImagePicker _picker = ImagePicker();
    final image = await _picker.pickImage(source: ImageSource.gallery);
    if (image != null) {
      imagePath.value = image.path.toString();
    }


    void onRegisterTap() {
      GetUtils.isAlphabetOnly(
        nameTEController.text,
      )
          ? print('valid')
          : print('invalid Name');
      GetUtils.isEmail(emailTEController.text)
          ? print('Valid')
          : print('Invalid Email');
      GetUtils.isAlphabetOnly(
          passwordTEController.text)
          ? print('Valid ')
          : print('invalid Password');
    }
  }
}