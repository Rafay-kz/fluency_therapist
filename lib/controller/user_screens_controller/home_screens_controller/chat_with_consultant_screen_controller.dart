import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:intl/intl.dart';

import '../../../model/doctor_model.dart';
import '../../../model/user_model.dart';
import '../../../utils/chat_message.dart';
import '../../../utils/user_session.dart';

class ChatWithConsultantScreenController extends GetxController {
  FirebaseFirestore _firestore = FirebaseFirestore.instance;
  final ScrollController scrollController = ScrollController();


  UserSession userSession = UserSession();
  Rx<UserModel> userModel = UserModel.empty().obs;
  Rx<DoctorModel> doctorModel = DoctorModel.empty().obs;
  RxList<ChatMessage> messages = <ChatMessage>[].obs;
  RxString textToShow = ''.obs;
  RxString imageUrl = ''.obs;

  late TextEditingController textFieldController = TextEditingController();
  String messageText = '';
  late int callId = Get.arguments ?? 0;
  RxBool sendingMessage = false.obs;

  void setSendingMessage(bool value) {
    sendingMessage.value = value;
  }

  @override
  void onInit() {
    super.onInit();
    initializeData();
    setupMessageListener();
  }

  @override
  void onClose() {
    textFieldController.dispose();

    super.onClose();
  }
  void scrollToBottom() {
    scrollController.animateTo(
      scrollController.position.maxScrollExtent,
      duration: const Duration(milliseconds: 300),
      curve: Curves.easeOut,
    );
  }
  Future<void> initializeData() async {
    await getUserInfo();
    await getDoctorInfo();
    await initializeChat();
    scrollToBottom();
  }

  Future<void> getDoctorInfo() async {
    doctorModel.value = await userSession.getDoctorInformation();
  }

  Future<void> getUserInfo() async {
    userModel.value = await userSession.getUserInformation();
  }

  Future<void> initializeChat() async {
    String senderId = '';
    String receiverId = '';

    if (userModel.value.id.isEmpty) {
      senderId = doctorModel.value.id;
      receiverId = await determineReceiverId();
    } else {
      senderId = userModel.value.id;
      receiverId = await determineReceiverId();
    }

    DocumentReference chatDocRef =
        _firestore.collection('chats').doc('${senderId}_$receiverId');

    DocumentSnapshot<Object?> chatSnapshot = await chatDocRef.get();

    if (!chatSnapshot.exists) {
      await chatDocRef.set({
        'participants': [senderId, receiverId],
      });
    }
  }

  Future<String> determineReceiverId() async {
    try {
      QuerySnapshot<Map<String, dynamic>> querySnapshot =
          await FirebaseFirestore.instance
              .collection('booked_appointments')
              .where('callId', isEqualTo: callId)
              .get();

      if (querySnapshot.docs.isNotEmpty) {
        String userId = querySnapshot.docs.first.get('userId');
        String doctorId = querySnapshot.docs.first.get('doctorId');

        return userModel.value.id.isEmpty ? userId : doctorId;
      } else {
        print('No appointment found for the given callId');
        return '';
      }
    } catch (e) {
      print('Error fetching receiverId: $e');
      return '';
    }
  }

  String formatTimestamp(DateTime timestamp) {
    final now = DateTime.now();
    final today = DateTime(now.year, now.month, now.day);
    final messageTime = DateTime(timestamp.year, timestamp.month, timestamp.day);

    if (messageTime == today) {
      return DateFormat.jm().format(timestamp); // Display time only for today's messages
    } else {
      return DateFormat('dd/MM/yyyy• HH:mm').format(timestamp); // Display date and time for older messages
    }
  }

  Future<void> sendMessage(String messageText) async {
    if (messageText.isNotEmpty && !sendingMessage.value) {
      setSendingMessage(true);
      String senderId = "";
      String senderFirstName = "";
      String receiverId = "";
      String receiverFirstName = "";

      if (userModel.value.id.isEmpty) {
        senderId = doctorModel.value.id;
        senderFirstName = doctorModel.value.firstName;
        receiverId = await determineReceiverId(); // Fetch receiverId
        receiverFirstName =
            "await determineReceiverFirstName"; // Fetch receiver's first name
      } else {
        senderId = userModel.value.id;
        senderFirstName = userModel.value.firstName;
        receiverId = await determineReceiverId(); // Fetch receiverId
        receiverFirstName =
            await "determineReceiverFirstName"; // Fetch receiver's first name
      }

      await _sendAndReceiveMessage(
        senderId: senderId,
        senderFirstName: senderFirstName,
        receiverId: receiverId,
        receiverFirstName: receiverFirstName,
        text: messageText,
      );


      this.messageText = '';
      textFieldController.clear();
    }
    WidgetsBinding.instance!.addPostFrameCallback((_) {
      if (scrollController.hasClients) {
        scrollController.jumpTo(scrollController.position.maxScrollExtent);

      }
    });
    setSendingMessage(false);

  }

  Future<void> _sendAndReceiveMessage({
    required String senderId,
    required String senderFirstName,
    required String receiverId,
    required String receiverFirstName,
    required String text,
  }) async {
    DocumentReference chatDocRef =
        _firestore.collection('chats').doc('${senderId}_$receiverId');
    CollectionReference messagesRef = chatDocRef.collection('messages');

    DocumentReference messageRef = messagesRef.doc();

    String messageId = messageRef.id;
    DateTime timestamp = DateTime.now();

    await _firestore.runTransaction((transaction) async {
      transaction.set(chatDocRef, {
        'participants': [senderId, receiverId],
      });

      transaction.set(messageRef, {
        'id': messageId,
        'senderId': senderId,
        'senderFirstName': senderFirstName,
        'receiverId': receiverId,
        'receiverFirstName': receiverFirstName,
        'text': text,
        'timestamp': timestamp,
      });
    });

    // Add the message locally only if it's sent by the current user
    if (senderId == userModel.value.id || senderId == doctorModel.value.id) {
      messages.add(
        ChatMessage(
          id: messageId,
          // Use messageId here
          senderId: senderId,
          senderFirstName: senderFirstName,
          receiverId: receiverId,
          receiverFirstName: receiverFirstName,
          text: text,
          timestamp: timestamp,
        ),
      );

      // Trigger UI update
      update(); // Ensure this triggers a UI update in GetX
    }

  }

  void setupMessageListener() {
    _firestore
        .collection('chats')
        .snapshots()
        .listen((QuerySnapshot chatSnapshot) {
      chatSnapshot.docChanges.forEach((change) {
        if (change.type == DocumentChangeType.added) {
          var chatDocRef = change.doc.reference;

          chatDocRef
              .collection('messages')
              .orderBy('timestamp')
              .snapshots()
              .listen((QuerySnapshot messageSnapshot) {
            messageSnapshot.docChanges.forEach((messageChange) {
              if (messageChange.type == DocumentChangeType.added) {
                var messageData =
                messageChange.doc.data() as Map<String, dynamic>;

                String existingMessageId = messageData['id'] ?? '';

                // Check if the message already exists locally
                bool messageExists = messages.any((message) => message.id == existingMessageId);

                if (!messageExists) {
                  String senderId = messageData['senderId'] ?? '';
                  String receiverId = messageData['receiverId'] ?? '';
                  String senderFirstName = messageData['senderFirstName'] ?? '';
                  String receiverFirstName = messageData['receiverFirstName'] ?? '';
                  String text = messageData['text'] ?? '';
                  DateTime timestamp = messageData['timestamp']?.toDate() ?? DateTime.now();

                  // Create a ChatMessage instance from messageData
                  ChatMessage newMessage = ChatMessage(
                    id: existingMessageId,
                    senderId: senderId,
                    senderFirstName: senderFirstName,
                    receiverId: receiverId,
                    receiverFirstName: receiverFirstName,
                    text: text,
                    timestamp: timestamp,
                  );

                  // Add the new message to the local messages list
                  messages.add(newMessage);

                  // Sort messages based on timestamp
                  messages.sort((a, b) => a.timestamp.compareTo(b.timestamp));

                  // Trigger UI update
                  update();

                  Future.delayed(Duration(milliseconds: 100), () {
                    scrollController.jumpTo(scrollController.position.maxScrollExtent);

                  });

                  // Ensure this triggers a UI update in GetX
                }
              }
            });
          });
        }
      });
    });
  }



}
