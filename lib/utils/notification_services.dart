import 'dart:convert';
import 'dart:developer';

import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:fluency_therapist/utils/app_constants.dart';
import 'package:flutter/foundation.dart';
import 'package:get/get.dart';
import 'package:firebase_messaging/firebase_messaging.dart';
import 'package:flutter_local_notifications/flutter_local_notifications.dart';
import 'package:http/http.dart' as http;



/*class NotificationServices extends GetxController {
  FirebaseMessaging messaging = FirebaseMessaging.instance;
  final FlutterLocalNotificationsPlugin _flutterLocalNotificationsPlugin =
  FlutterLocalNotificationsPlugin();
  RxString channelId = 'default_channel_id'.obs;


  @override
  void onInit() {
    super.onInit();
 *//*   initLocalNotifications();
    FirebaseMessaging.onBackgroundMessage(_handleBackgroundMessage);
    firebaseInit();*//*
  }

  Future<void> _handleBackgroundMessage(RemoteMessage message) async {
    print("Handling background message: ${message.notification?.title}");
    showNotification(message);
  }

  void requestNotificationPermission() async {
    NotificationSettings? settings = await messaging.requestPermission(
      alert: true,
      badge: true,
      announcement: true,
      carPlay: true,
      criticalAlert: true,
      provisional: true,
      sound: true,
    );
    if (settings != null &&
        settings.authorizationStatus == AuthorizationStatus.authorized) {
      print('user granted permission');
    } else if (settings != null &&
        settings.authorizationStatus == AuthorizationStatus.provisional) {
      print('user granted provisional permission');
    }
  }

  void initLocalNotifications() async {
    var androidInitializationSettings =
    AndroidInitializationSettings('@mipmap/ic_launcher');
    var iosInitializationSettings = DarwinInitializationSettings();

    var initializationSettings = InitializationSettings(
      android: androidInitializationSettings,
      iOS: iosInitializationSettings,
    );

    await _flutterLocalNotificationsPlugin.initialize(
      initializationSettings,
      onDidReceiveNotificationResponse: (Payload) {},
    );
  }

  Future<void> showNotification(RemoteMessage message) async {
    print('---------------------->>${message.notification!.body}');
    if (message.notification != null) {
      channelId.value =
          message.notification!.android?.channelId ?? 'default_channel_id';

      AndroidNotificationChannel channel = AndroidNotificationChannel(
        channelId.value,
        'High Importance Notifications',
        importance: Importance.max,
      );

      AndroidNotificationDetails androidNotificationDetails =
      AndroidNotificationDetails(
        channel.id,
        channel.name,
        channelDescription: 'your_channel_description',
        importance: Importance.max,
        priority: Priority.high,
        ticker: 'ticker ',
        icon: '@mipmap/ic_launcher',
      );

      DarwinNotificationDetails darwinNotificationDetails =
      DarwinNotificationDetails(
        presentAlert: true,
        presentBadge: true,
        presentSound: true,
      );

      NotificationDetails notificationDetails = NotificationDetails(
        android: androidNotificationDetails,
        iOS: darwinNotificationDetails,
      );

      await _flutterLocalNotificationsPlugin.show(
        0,
        message.notification!.title ?? 'Default Title',
        message.notification!.body ?? 'Default Body',
        notificationDetails,
      );
    }
  }

  void firebaseInit() {
    FirebaseMessaging.onMessage.listen((RemoteMessage message) {
      if (kDebugMode) {
        print("onMessage: ${message.notification?.title}");
      }
      print("onMessage: ${message.notification?.body}");
      showNotification(message);

      // Only handle the notification without navigation
      // You can add more conditions based on your notification data

      print('===========>>>${message.data}');
      if (message.data['callId'] != null) {
        // Handle call notification
        int callId = int.parse(message.data['callId']);
        // Do something with callId, e.g., show a toast or perform an action
      } else if (message.data['notificationType'] == 'video_call') {
        // Handle video call notification
        int callId = int.parse(message.data['callId']);
        // Do something with callId, e.g., show a toast or perform an action
      } else if (message.data['notificationType'] == 'chat') {
        // Handle chat notification
        String userId = message.data['userId'];
        // Do something with userId, e.g., show a toast or perform an action
      }
    });
  }




}*/
/*Future<void> showNotification(RemoteMessage message) async {
    print('---------------------->>${message.notification!.body}');
    if (message.notification != null) {
      channelId.value = message.notification!.android?.channelId ?? 'default_channel_id';

      AndroidNotificationChannel channel = AndroidNotificationChannel(
        channelId.value,
        'High Importance Notifications',
        importance: Importance.max,
      );

      AndroidNotificationDetails androidNotificationDetails =
      AndroidNotificationDetails(
        channel.id,
        channel.name,
        channelDescription: 'your_channel_description',
        importance: Importance.max,
        priority: Priority.high,
        ticker: 'ticker ',
        icon: '@mipmap/ic_launcher',
      );

      DarwinNotificationDetails darwinNotificationDetails =
      DarwinNotificationDetails(
        presentAlert: true,
        presentBadge: true,
        presentSound: true,
      );

      NotificationDetails notificationDetails = NotificationDetails(
        android: androidNotificationDetails,
        iOS: darwinNotificationDetails,
      );

      await _flutterLocalNotificationsPlugin.show(
        0,
        message.notification!.title ?? 'Default Title',
        message.notification!.body ?? 'Default Body',
        notificationDetails,
      );
    }
  }*/


class NotificationServices {
  FirebaseMessaging? _message;
  static final NotificationServices _singleton = NotificationServices._internal();
  NotificationServices._internal();
  factory NotificationServices() => _singleton;
  static bool isNotificationPermissionShowing=false;
  initialize() async {
    getFCMInstance();
    isNotificationPermissionShowing=true;
    _message?.requestPermission().then((value) => isNotificationPermissionShowing=false);
    generateFCMToken();
    if (!kIsWeb) {
      await _iOSNoticationSettings();
    }
    FirebaseMessaging.onMessage.listen(_foregroundListner);
    FirebaseMessaging.onMessageOpenedApp.listen(_backgroundNotificationTappedListner);
    FirebaseMessaging.onBackgroundMessage(_terminatedAppListner);
    _terminatedNotificationTappedListner();
  }



  FirebaseMessaging getFCMInstance() {
    _message ??= FirebaseMessaging.instance;
    return _message!;
  }

  Future<String> generateFCMToken() async {
    String token = await _message!.getToken() ?? "";
    log("DEVICE FCM TOKEN=> $token");
    return token;
  }

  _iOSNoticationSettings() async {
    await FirebaseMessaging.instance
        .setForegroundNotificationPresentationOptions(
      alert: true,
      badge: true,
      sound: true,
    );

  }

  _foregroundListner(RemoteMessage message) async {
    print('===========>${message.notification!.body}');
    log('Notification in foreground state with id ${message.data}');


  }

  _backgroundNotificationTappedListner(RemoteMessage message) {
    log('Notification tapped in background state with id ${message.data}');
    int callId = int.parse(message.data['callId']);
    String screenName = message.data['screenName'];

    // Navigate based on the screenName
    if (screenName == 'videoCallScreen') {
      Get.toNamed(kVideoCallScreen, arguments: callId);
    } else if (screenName == 'audioCallScreen') {
      Get.toNamed(kOngoingCallScreen, arguments: callId);
    }
  }

  _terminatedNotificationTappedListner() async{
    var notification= await _message?.getInitialMessage();
    if(notification!=null){
      log('Notification tapped in terminated state with id ${notification.data}');
      Get.toNamed(kOngoingCallScreen,arguments: int.parse(notification.data['callId']));
    }
  }

  deleteFCMToken() async {
    await _message!.deleteToken();
    log("FCM TOKEN DELETED!");
  }
  Future<void> updateDoctorToken(String doctorId, String newToken) async {
    try {
      // Update the 'deviceToken' field for the doctor with doctorId
      await FirebaseFirestore.instance
          .collection('doctor_users')
          .doc(doctorId)
          .update({
        'deviceToken': newToken,
      });
    } catch (e) {
      print('Error updating doctor token: $e');
    }
  }

  Future<void> updateUserToken(String userId, String newToken) async {
    try {
      // Update the 'deviceToken' field for the doctor with doctorId
      await FirebaseFirestore.instance.collection('users').doc(userId).update({
        'deviceToken': newToken,
      });
    } catch (e) {
      print('Error updating user token: $e');
    }
  }


  Future<String?> getDeviceToken() async {
    String? token = await _message!.getToken();
    return token;
  }

  void isTokenRefresh() async {
    _message!.onTokenRefresh.listen((event) {
      print(event.toString());
    });
  }
  Future<void> sendAppointmentNotification(String userDeviceToken, int callId, screenName) async {
    final url = Uri.parse('https://fcm.googleapis.com/fcm/send');
    final serverKey =
        'AAAA7emiHwI:APA91bGWjj2g3LXz7yHIx_AoxOQ8f3S2Ku1BTVmtRogcOND84zI4Y2p26GrVS4ygVgouXdEGmTZGwttuw9rbXGrVNGzLE2oEmKd1EAo3S8brdf3KDsgUiHVMsRybwCdWikLWWnG3U0TR';

    final headers = {
      'Content-Type': 'application/json',
      'Authorization': 'key=$serverKey',
    };

    final message = {
      'notification': {
        'title': 'Appointment Started',
        'body': 'Your appointment has started. Click to join the call.',
      },
      'data':  {
        'callId': callId.toString(),
        "screenName": screenName,

      },
      'to': userDeviceToken,
    };
    print('Sending notification to user with token: $userDeviceToken');

    final response = await http.post(
      url,
      headers: headers,
      body: json.encode(message),
    );

    if (response.statusCode == 200) {
      print('Notification sent successfully');
    } else {
      print('Failed to send notification. Status code: ${response.statusCode}');
    }
  }


  Future<void> sendReminderAppointmentNotification(String userDeviceToken, int callId) async {
    final url = Uri.parse('https://fcm.googleapis.com/fcm/send');
    final serverKey =
        'AAAA7emiHwI:APA91bGWjj2g3LXz7yHIx_AoxOQ8f3S2Ku1BTVmtRogcOND84zI4Y2p26GrVS4ygVgouXdEGmTZGwttuw9rbXGrVNGzLE2oEmKd1EAo3S8brdf3KDsgUiHVMsRybwCdWikLWWnG3U0TR';

    final headers = {
      'Content-Type': 'application/json',
      'Authorization': 'key=$serverKey',
    };

    final message = {
      'notification': {
        'title': 'Appointment Time',
        'body': 'Its your appointment time!.',
      },
      'data':  {
        'callId': callId.toString(),
      },
      'to': userDeviceToken,
    };
    print('Sending notification to user with token: $userDeviceToken');

    final response = await http.post(
      url,
      headers: headers,
      body: json.encode(message),
    );

    if (response.statusCode == 200) {
      print('Notification sent successfully');
    } else {
      print('Failed to send notification. Status code: ${response.statusCode}');
    }
  }

  Future<void> sendAppointmentChatNotification(String userDeviceToken) async {
    final url = Uri.parse('https://fcm.googleapis.com/fcm/send');
    final serverKey =
        'AAAA7emiHwI:APA91bGWjj2g3LXz7yHIx_AoxOQ8f3S2Ku1BTVmtRogcOND84zI4Y2p26GrVS4ygVgouXdEGmTZGwttuw9rbXGrVNGzLE2oEmKd1EAo3S8brdf3KDsgUiHVMsRybwCdWikLWWnG3U0TR';

    final headers = {
      'Content-Type': 'application/json',
      'Authorization': 'key=$serverKey',
    };

    final message = {
      'notification': {
        'title': 'Appointment Started',
        'body': 'Hello! Your appointment has started. Click to join the chat.',
      },
      'data': {
        'screen': 'appointment',
        // Add any additional data you want to send to the app
      },
      'to': userDeviceToken,
    };
    print('Sending notification to user with token: $userDeviceToken');

    final response = await http.post(
      url,
      headers: headers,
      body: json.encode(message),
    );

    if (response.statusCode == 200) {
      print('Notification sent successfully');
    } else {
      print('Failed to send notification. Status code: ${response.statusCode}');
    }
  }
}

@pragma('vm:entry-point')
Future<void> _terminatedAppListner(RemoteMessage message) async {
  await Firebase.initializeApp();
}