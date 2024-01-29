import 'package:fluency_therapist/screens/common_screens/auth_screens/profile_setup_screen.dart';
import 'package:fluency_therapist/screens/doctor_module/doctor_booked_appointments_screen.dart';
import 'package:fluency_therapist/screens/doctor_module/doctor_edit_profile_screen.dart';
import 'package:fluency_therapist/screens/doctor_module/doctor_scheduling_screen.dart';
import 'package:fluency_therapist/screens/doctor_module/doctor_verification_screen.dart';
import 'package:fluency_therapist/screens/user_module/home_screens/booked_appointment_screen.dart';

import 'package:get/get.dart';
import '../exercises/exercises_screen_one.dart';
import '../screens/common_screens/auth_screens/create_new_password_screen.dart';
import '../screens/common_screens/auth_screens/email_verification_screen.dart';
import '../screens/common_screens/auth_screens/forget_password_screen.dart';
import '../screens/common_screens/auth_screens/login_screen.dart';
import '../screens/common_screens/auth_screens/otp_verification_screen.dart';
import '../screens/common_screens/auth_screens/signup_screen.dart';
import '../screens/common_screens/auth_screens/splash_screen.dart';
import '../screens/common_screens/auth_screens/welcome_screen.dart';

import '../screens/doctor_module/doctor_home_screen.dart';
import '../screens/doctor_module/doctor_inbox_screen.dart';
import '../screens/doctor_module/doctor_profile_screen.dart';
import '../screens/doctor_module/doctor_profile_setup_screen.dart';
import '../screens/user_module/home_screens/appointment_booking_screen.dart';
import '../screens/user_module/home_screens/call_log_screen.dart';
import '../screens/user_module/home_screens/calling_consultant_screen.dart';
import '../screens/user_module/home_screens/chat_with_consultant_screen.dart';
import '../screens/user_module/home_screens/consult_therapist_screen.dart';
import '../screens/user_module/home_screens/consultant_calling_screen.dart';
import '../screens/user_module/home_screens/consultant_profile_screen.dart';
import '../screens/user_module/home_screens/customize_program_final_Screen.dart';
import '../screens/user_module/home_screens/customized_program_screen.dart';
import '../screens/user_module/home_screens/edit_profile_screen.dart';
import '../screens/user_module/home_screens/home_screen.dart';
import '../screens/user_module/home_screens/inbox_screen.dart';
import '../screens/user_module/home_screens/ongoing_call_screen.dart';
import '../screens/user_module/home_screens/payment_screen.dart';
import '../screens/user_module/home_screens/progress_tracking_screen.dart';
import '../screens/user_module/home_screens/reminder_screen.dart';
import '../screens/user_module/home_screens/search_screen.dart';
import '../screens/user_module/home_screens/speech_exercises_screen.dart';
import '../screens/user_module/home_screens/user_profile_screen.dart';
import '../screens/user_module/home_screens/video_call_screen.dart';
import 'app_constants.dart';
import 'screen_bindings.dart';

//created by Abdul Rafay on 1-5-2023

class RouteGenerator {
  static List<GetPage> getPages() {
    return [
      GetPage(
        name: kSplashScreen,
        page: () => const SplashScreen(),
        binding: ScreenBindings(),
      ),
      GetPage(
        name: kWelcomescreen,
        page: () => const WelcomeScreen(),
        binding: ScreenBindings(),
      ),
      GetPage(
        name: kSignUpScreen,
        page: () => const SignUpScreen(),
        binding: ScreenBindings(),
      ),
      GetPage(
        name: kLoginScreen,
        page: () => LoginScreen(),
        binding: ScreenBindings(),
      ),
      GetPage(
        name: kEmailVerificationScreen,
        page: () => const EmailVerificationScreen(),
        binding: ScreenBindings(),
      ),
      GetPage(
        name: kForgetPassScreen,
        page: () => const ForgetPassScreen(),
        binding: ScreenBindings(),
      ),
      GetPage(
        name: kOtpVerificationScreen,
        page: () => const OtpVerificationScreen(),
        binding: ScreenBindings(),
      ),
      GetPage(
        name: kCreateNewPasswordScreen,
        page: () => const CreateNewPasswordScreen(),
        binding: ScreenBindings(),
      ),
      GetPage(
        name: kHomeScreen,
        page: () => const HomeScreen(),
        binding: ScreenBindings(),
      ),
      GetPage(
        name: kSearchScreen,
        page: () => const SearchScreen(),
        binding: ScreenBindings(),
      ),
      GetPage(
        name: kSpeechExercisesScreen,
        page: () => const SpeechExercisesScreen(),
        binding: ScreenBindings(),
      ),
      GetPage(
        name: kConsultTherapistScreen,
        page: () => const ConsultTherapistScreen(),
        binding: ScreenBindings(),
      ),
      GetPage(
        name: kConsultantProfileScreen,
        page: () => const ConsultantProfileScreen(),
        binding: ScreenBindings(),
      ),
      GetPage(
        name: kChatWithConsultantScreen,
        page: () => const ChatWithConsultantScreen(),
        binding: ScreenBindings(),
      ),
      GetPage(
        name: kCallingConsultantScreen,
        page: () => const CallingConsultantScreen(),
        binding: ScreenBindings(),
      ),
      GetPage(
        name: kVideoCallScreen,
        page: () => const VideoCallScreen(),
        binding: ScreenBindings(),
      ),
      GetPage(
        name: kConsultantCalLingScreen,
        page: () => const ConsultantCallingScreen(),
        binding: ScreenBindings(),
      ),
      GetPage(
        name: kOngoingCallScreen,
        page: () => const OngoingCallScreen(),
        binding: ScreenBindings(),
      ),
      GetPage(
        name: kCustomizedProgramScreen,
        page: () => const CustomizedProgramScreen(),
        binding: ScreenBindings(),
      ),
      GetPage(
        name: kReminderScreen,
        page: () => const ReminderScreen(),
        binding: ScreenBindings(),
      ),
      GetPage(
        name: kCustomizeProgramFinalScreen,
        page: () => const CustomizeProgramFinalScreen(),
        binding: ScreenBindings(),
      ),
      GetPage(
        name: kProgressTrackingScreen,
        page: () => ProgressTrackingScreen(),
        binding: ScreenBindings(),
      ),
      GetPage(
        name: kEditProfileScreen,
        page: () => EditProfileScreen(),
        binding: ScreenBindings(),
      ),
      GetPage(
        name: kUserProfileScreen,
        page: () => UserProfileScreen(),
        binding: ScreenBindings(),
      ),
      GetPage(
        name: kInboxScreen,
        page: () => const InboxScreen(),
        binding: ScreenBindings(),
      ),
      GetPage(
        name: kCallLogScreen,
        page: () => const CallLogScreen(),
        binding: ScreenBindings(),
      ),
      GetPage(
        name: kDoctorHomeScreen,
        page: () => const DoctorHomeScreen(),
        binding: ScreenBindings(),
      ),
      GetPage(
        name: kDoctorEditProfileScreen,
        page: () => DoctorEditProfileScreen(),
        binding: ScreenBindings(),
      ),
      GetPage(
        name: kDoctorSchedulingScreen,
        page: () => const DoctorSchedulingScreen(),
        binding: ScreenBindings(),
      ),
      GetPage(
        name: kAppointmentBookingScreen,
        page: () => const AppointmentBookingScreen(),
        binding: ScreenBindings(),
      ),
      GetPage(
        name: kExercisesScreenOne,
        page: () => ExcerisesScreenOne(),
        binding: ScreenBindings(),
      ),
      GetPage(
        name: kBookedAppointmentScreen,
        page: () => const BookedAppointmentScreen(),
        binding: ScreenBindings(),
      ),
      GetPage(
        name: kDoctorBookedAppointmentsScreen,
        page: () => const DoctorBookedAppointmentsScreen(),
        binding: ScreenBindings(),
      ),
      GetPage(
        name: kProfileSetUpScreen,
        page: () => ProfileSetUpScreen(),
        binding: ScreenBindings(),
      ),
      GetPage(
        name: kDoctorProfileSetUpScreen,
        page: () => DoctorProfileSetUpScreen(),
        binding: ScreenBindings(),
      ),
      GetPage(
        name: kDoctorInboxScreen,
        page: () => DoctorInboxScreen(),
        binding: ScreenBindings(),
      ),
      GetPage(
        name: kDoctorProfileScreen,
        page: () => DoctorProfileScreen(),
        binding: ScreenBindings(),
      ),
      GetPage(
        name: kDoctorVerificationScreen,
        page: () => DoctorVerificationScreen(),
        binding: ScreenBindings(),
      ),
      GetPage(
        name: kPaymentScreen,
        page: () => const PaymentScreen(),
        binding: ScreenBindings(),
      ),
    ];
  }
}
