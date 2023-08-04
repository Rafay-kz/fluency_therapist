

import 'package:get/get.dart';

import '../../utils/app_constants.dart';

class CustomizedProgramScreenController extends GetxController{

  //Validator of answer
  bool validateAnswer() {
    return selectedValue.value != -1;
  }
  //Method to update the value
  var selectedValue = RxInt(-1);

  void updateSelectedValue(int value) {
    selectedValue.value = value;
  }


//Button method

void checkAnswer() {
  if (validateAnswer()) {
    Get.toNamed(kReminderScreen);
  } else {
    Get.snackbar('Error', 'Please select an answer.');
  }
}


}