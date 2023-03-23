import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/foundation.dart';

class AuthService {
  final authInstance = FirebaseAuth.instance;

  Future logInAnonymous() async {
    try {
      final credential = await authInstance.signInAnonymously();
      return credential.credential;
    } catch (error) {
      if (kDebugMode) print(error);
    }
  }

  Future verifyPhoneNumber(String phoneNumber) async {
    try {
      final credential = await authInstance.signInWithPhoneNumber(phoneNumber);
    } catch (error) {
      if (kDebugMode) {
        print(error.toString());
      }
    }
  }

  Future phoneLogIn(String phoneNumber) async {
    try {
      final credential = await authInstance.signInWithPhoneNumber(phoneNumber);
    } catch (error) {
      if (kDebugMode) {
        print(error.toString());
      }
    }
  }
}
