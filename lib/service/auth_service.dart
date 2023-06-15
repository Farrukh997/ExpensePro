import 'dart:io';

import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/foundation.dart';
import 'package:expense_pro/models/user.dart' as model;
import 'package:flutter/material.dart';

enum AuthStatus { authorized, notAuthorized }

enum RequestStatus { successful, failure }

model.User? _getUserFromFirebase(User? user) =>
    user != null ? model.User(user.uid) : null;

class AuthService {
  AuthService._internal();

  static final instance = AuthService._internal();

  final FirebaseAuth _auth = FirebaseAuth.instance;
  String verificationID = '';

  bool authStatus() {
    return _auth.currentUser != null;
  }

  Future<AuthStatus> signInAnon() async {
    try {
      final UserCredential credential = await _auth.signInAnonymously();
      // credential.credential;
      // return _getUserFromFirebase(credential.user);
      return credential.user != null ? AuthStatus.authorized : AuthStatus.notAuthorized;
    } catch (error) {
      if (kDebugMode) print(error);
      return AuthStatus.notAuthorized;
    }
  }

  Future<AuthStatus?> verifyPhoneNumber(
    String phoneNumber, {
    int timeout = 120,
    TextEditingController? controller,
  }) async {
    try {
      UserCredential? result;
      await _auth.verifyPhoneNumber(
        phoneNumber: phoneNumber,
        timeout: Duration(seconds: timeout),
        verificationCompleted: (PhoneAuthCredential phoneAuthCredential) async {
          if (Platform.isAndroid) {
            //! Android Only
            controller?.text = phoneAuthCredential.smsCode ?? '';
            result = await _auth.signInWithCredential(phoneAuthCredential);
          }
        },
        verificationFailed: (FirebaseAuthException error) {
          if (error.code == 'invalid-phone-number') {
            if (kDebugMode) print('The provided phone number is not valid.');
          }
        },
        codeSent: (String verificationId, int? forceResendingToken) async {
          // Update the UI - wait for the user to enter the SMS code
          // String smsCode = '';
          verificationID = verificationId;
          // Create a PhoneAuthCredential with the code
          // PhoneAuthCredential credential = PhoneAuthProvider.credential(
          // verificationId: verificationId, smsCode: smsCode);
          // Sign the user in (or link) with the credential
          // result = await _auth.signInWithCredential(credential);
        },
        codeAutoRetrievalTimeout: (String verificationId) {
          verificationID = verificationId;
        },
      );
      return result != null ? AuthStatus.authorized : AuthStatus.notAuthorized;
    } catch (error) {
      if (kDebugMode) {
        print(error.toString());
      }
      rethrow;
    }
  }

  Future<AuthStatus> phoneLogIn(String sms) async {
    final credential =
        PhoneAuthProvider.credential(verificationId: verificationID, smsCode: sms);
    try {
      final UserCredential response = await _auth.signInWithCredential(credential);
      return response.user != null ? AuthStatus.authorized : AuthStatus.notAuthorized;
    } catch (error) {
      if (kDebugMode) {
        print(error.toString());
      }
      return AuthStatus.notAuthorized;
    }
  }

  Future<void> logout() async {
    try {
      await _auth.signOut();
    } catch (e) {
      rethrow;
    }
  }
}
