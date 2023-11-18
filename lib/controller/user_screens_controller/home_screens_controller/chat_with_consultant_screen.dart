import 'package:flutter/cupertino.dart';
import 'package:get/get.dart';
import 'package:firebase_database/firebase_database.dart';

import '../../../model/doctor_model.dart';
import '../../../model/user_model.dart';
import '../../../utils/chat_message.dart';
import '../../../utils/user_session.dart';

class ChatWithConsultantScreenController extends GetxController {
  DatabaseReference _messagesRef = FirebaseDatabase.instance.reference().child('messages');

  UserSession userSession = UserSession();
  Rx<UserModel> userModel = UserModel.empty().obs;
  Rx<DoctorModel> doctorModel = DoctorModel.empty().obs;
  RxList<ChatMessage> messages = <ChatMessage>[].obs;

  late TextEditingController textFieldController = TextEditingController();
  String messageText = '';

  @override
  void onInit() async {
    super.onInit();
    await getUserInfo();
    await getDoctorInfo();
    _setupMessageListener();

  }

  @override
  void onClose() {
    textFieldController.dispose();
    super.onClose();
  }
  Future<void> initializeData() async {
    await getUserInfo();
    await getDoctorInfo();


  }
  Future<void> getDoctorInfo() async {
    doctorModel.value = await userSession.getDoctorInformation();
  }

  Future<void> getUserInfo() async {
    userModel.value = await userSession.getUserInformation();
  }

  Future<void> sendMessage(String messageText) async {
    if (messageText.isNotEmpty) {
      await _sendAndReceiveMessage(
        senderId: doctorModel.value.id,
        senderFirstName: doctorModel.value.firstName,
        receiverId: userModel.value.id,
        receiverFirstName: userModel.value.firstName,
        text: messageText,
      );

      // Clear the message text after sending
      this.messageText = '';
      textFieldController.clear();
    }
  }

  Future<void> _sendAndReceiveMessage({
    required String senderId,
    required String senderFirstName,
    required String receiverId,
    required String receiverFirstName,
    required String text,
  }) async {
    await _messagesRef.push().set({
      'senderId': senderId,
      'senderFirstName': senderFirstName,
      'receiverId': receiverId,
      'receiverFirstName': receiverFirstName,
      'text': text,
      'timestamp': DateTime.now().millisecondsSinceEpoch,
    });
  }

  void _setupMessageListener() {
    _messagesRef.onChildAdded.listen((event) {
      dynamic data = event.snapshot.value;

      if (data != null && data is Map<dynamic, dynamic>) {
        ChatMessage message = _mapToChatMessage(data);
        messages.add(message);
      }
    });
  }

  ChatMessage _mapToChatMessage(Map<dynamic, dynamic> data) {
    return ChatMessage(
      senderId: data['senderId'] as String? ?? '',
      senderFirstName: data['senderFirstName'] as String? ?? '',
      receiverId: data['receiverId'] as String? ?? '',
      receiverFirstName: data['receiverFirstName'] as String? ?? '',
      text: data['text'] as String? ?? '',
      timestamp: DateTime.fromMillisecondsSinceEpoch(data['timestamp'] as int? ?? 0),
    );
  }
}
