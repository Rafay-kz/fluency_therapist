import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:get/get.dart';
import 'package:get/get_core/src/get_main.dart';

import '../../utils/app_constants.dart';

class Database {

  final FirebaseAuth _auth = FirebaseAuth.instance;
  final FirebaseFirestore _firestore = FirebaseFirestore.instance;



  Future<void> createAccount(String email, String password) async {
    UserCredential userCredential = await _auth.createUserWithEmailAndPassword(
        email: email, password: password);
    if (userCredential != null) {
      await userCredential.user!.sendEmailVerification();
      Get.offAllNamed(kEmailVerificationScreen);



    }
  }

  Future<void> saveUserDetails(String username, String age, String email) async {
    try {
      await _firestore.collection('users').add({
        'username': username,
        'age': age,
        'email': email,
      });
      // Data saved successfully
    } catch (e) {
      // Handle error
      print('Error saving user details: $e');
    }
  }
  Future<DocumentSnapshot<Map<String, dynamic>>> getUserData(String userId) =>
      _firestore.collection('users').doc(userId).get();
}


