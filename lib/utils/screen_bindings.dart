

//created by Abdul Rafay on 1-5-2023

import 'package:fluency_therapist/controller/common_screens_controller/auth_screens_controller/profile_setup_screen_controller.dart';
import 'package:fluency_therapist/controller/doctor_screens_controller/doctor_booked_appointments_screen_controller.dart';
import 'package:fluency_therapist/controller/doctor_screens_controller/doctor_scheduling_screen_controller.dart';
import 'package:fluency_therapist/controller/exercises_screens_controller/exercises_screen_one_controller.dart';
import 'package:fluency_therapist/controller/user_screens_controller/home_screens_controller/appointment_booking_screen_controller.dart';
import 'package:fluency_therapist/utils/app_constants.dart';
import 'package:get/get.dart';

import '../controller/common_screens_controller/auth_screens_controller/create_new_password_screen_controller.dart';
import '../controller/common_screens_controller/auth_screens_controller/email_verification_screen_controller.dart';
import '../controller/common_screens_controller/auth_screens_controller/forget_pass_screen_controller.dart';
import '../controller/common_screens_controller/auth_screens_controller/login_screen_controller.dart';
import '../controller/common_screens_controller/auth_screens_controller/otp_verification_screen_controller.dart';
import '../controller/common_screens_controller/auth_screens_controller/signup_screen_controller.dart';
import '../controller/common_screens_controller/auth_screens_controller/splash_screen_controller.dart';
import '../controller/common_screens_controller/auth_screens_controller/welcome_screen_controller.dart';
import '../controller/doctor_screens_controller/doctor_edit_profile_screen_controller.dart';
import '../controller/doctor_screens_controller/doctor_home_screen_controller.dart';
import '../controller/doctor_screens_controller/doctor_inbox_screen_controller.dart';
import '../controller/doctor_screens_controller/doctor_profile_screen_controller.dart';
import '../controller/doctor_screens_controller/doctor_profile_setup_screen_controller.dart';
import '../controller/user_screens_controller/home_screens_controller/booked_appointment_screen_controller.dart';
import '../controller/user_screens_controller/home_screens_controller/call_log_screen_controller.dart';
import '../controller/user_screens_controller/home_screens_controller/calling_consultant_screen_controller.dart';
import '../controller/user_screens_controller/home_screens_controller/chat_with_consultant_screen.dart';
import '../controller/user_screens_controller/home_screens_controller/consult_therapist_screen_controller.dart';
import '../controller/user_screens_controller/home_screens_controller/consultant_calling_screen_controller.dart';
import '../controller/user_screens_controller/home_screens_controller/consultant_profile_screen_controller.dart';
import '../controller/user_screens_controller/home_screens_controller/customize_program_final_screen_controller.dart';
import '../controller/user_screens_controller/home_screens_controller/customized_program_screen_controller.dart';
import '../controller/user_screens_controller/home_screens_controller/edit_profile_screen_controller.dart';
import '../controller/user_screens_controller/home_screens_controller/home_screen_controller.dart';
import '../controller/user_screens_controller/home_screens_controller/inbox_screen_controller.dart';
import '../controller/user_screens_controller/home_screens_controller/ongoing_call_screen_controller.dart';
import '../controller/user_screens_controller/home_screens_controller/progress_tracking_screen_controller.dart';
import '../controller/user_screens_controller/home_screens_controller/reminder_screen_controller.dart';
import '../controller/user_screens_controller/home_screens_controller/search_screen_controller.dart';
import '../controller/user_screens_controller/home_screens_controller/speech_exercises_screen_controller.dart';
import '../controller/user_screens_controller/home_screens_controller/user_profile_screen_controller.dart';
import '../controller/user_screens_controller/home_screens_controller/video_call_screen_controller.dart';

class ScreenBindings extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut(() => SplashScreenController());
    Get.lazyPut(() => WelcomeScreenController());
    Get.lazyPut(() => LoginScreenController());
    Get.lazyPut(() => SignupScreenController());
    Get.lazyPut(() => ForgetPassScreenController());
    Get.lazyPut(() => EmailVerificationScreenController());
    Get.lazyPut(() => OtpVerificationScreenController());
    Get.lazyPut(() => CreateNewPasswordScreenController());
    Get.lazyPut(() => HomeScreenController(),tag: kHomeScreenController);
    Get.lazyPut(() => SearchScreenController());
    Get.lazyPut(() => SpeechExercisesScreenController());
    Get.lazyPut(() => ConsultTherapistScreenController());
    Get.lazyPut(() => ConsultantProfileScreenController());
    Get.lazyPut(() => ChatWithConsultantScreenController());
    Get.lazyPut(() => CallingConsultantScreenController());
    Get.lazyPut(() => VideoCallScreenController ());
    Get.lazyPut(() => ConsultantCallingScreenController());
    Get.lazyPut(() => OngoingCallScreenController());
    Get.lazyPut(() => CustomizedProgramScreenController());
    Get.lazyPut(() => ReminderScreenController());
    Get.lazyPut(() => CustomizeProgramFinalScreenController());
    Get.lazyPut(() => ProgressTrackingScreenController());
    Get.lazyPut(() => EditProfileScreenController());
    Get.lazyPut(() => UserProfileScreenController());
    Get.lazyPut(() => InboxScreenController());
    Get.lazyPut(() => CallLogScreenController());
    Get.lazyPut(() => DoctorHomeScreenController(),tag: kDoctorHomeScreenController);
    Get.lazyPut(() => DoctorEditProfileScreenController());
    Get.lazyPut(() => DoctorSchedulingScreenController());
    Get.lazyPut(() => AppointmentBookingScreenController());
    Get.lazyPut(() => ExercisesScreenOneController());
    Get.lazyPut(() => BookedAppointmentScreenController());
    Get.lazyPut(() => DoctorBookedAppointmentsScreenController());
    Get.lazyPut(() => ProfileSetUpScreenController());
    Get.lazyPut(() => DoctorProfileSetUpScreenController());
    Get.lazyPut(() => DoctorInboxScreenController());
    Get.lazyPut(() => DoctorProfileScreenController());







  }
}
