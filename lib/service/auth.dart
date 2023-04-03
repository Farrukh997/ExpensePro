import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/foundation.dart';
import 'package:expense_pro/models/user.dart' as userModel;

class AuthService {
  final FirebaseAuth _auth = FirebaseAuth.instance;

  userModel.User? _getUserFromFirebase(User? user) =>
      user != null ? userModel.User(user.uid) : null;

  Future signInAnon() async {
    try {
      final credential = await _auth.signInAnonymously();
      credential.credential;
      return _getUserFromFirebase(credential.user);
    } catch (error) {
      if (kDebugMode) print(error);
      return null;
    }
  }

  Future verifyPhoneNumber(String phoneNumber) async {
    try {
      final credential = await _auth.signInWithPhoneNumber(phoneNumber);
    } catch (error) {
      if (kDebugMode) {
        print(error.toString());
      }
    }
  }

  Future phoneLogIn(String phoneNumber) async {
    try {
      final credential = await _auth.signInWithPhoneNumber(phoneNumber);
    } catch (error) {
      if (kDebugMode) {
        print(error.toString());
      }
    }
  }
}
