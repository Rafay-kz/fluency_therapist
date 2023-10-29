import 'package:get/get.dart';

import '../../../model/user_model.dart';
import '../../../utils/user_session.dart';



class SpeechExercisesScreenController extends GetxController{



  UserSession userSession = UserSession();
  Rx<UserModel> userModel=UserModel.empty().obs;
  late int index;




  @override
  void onInit(){
    getUserInfo();
    super.onInit();
  }

  Future<void> getUserInfo() async{
    userModel.value=await userSession.getUserInformation();
  }


  final List<ExerciseData> exerciseData = [
    ExerciseData(
      "Recognition",
      "Recognition of disease\nand Speech Disorders\nin Children",
    ),
    ExerciseData(
      "Exercises",
      "Speech Disorders in Children",
    ),
    ExerciseData(
      "Exercises",
      "Fluency exercises for clear speak",
    ),
    // Add more ExerciseData objects as needed
  ];






}
class ExerciseData {
  final String title;
  final String description;

  ExerciseData(this.title, this.description);
}
