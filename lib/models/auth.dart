import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:habit_o_meter/common/AppState.dart';
import 'dart:developer';

enum LoginView{
  Phone,
  OTP,
  User
}

class AuthModel extends ChangeNotifier{
  late FirebaseAuth _auth;
  late AppState _currentAppState = AppState.LoggedOut;
  String? _verificationId;
  LoginView _currentLoginState = LoginView.Phone;

  AuthModel(){
    _auth = FirebaseAuth.instance;
    _auth.authStateChanges().listen(authChangeHandler);
  }

  // getters
  AppState get currentAppState => _currentAppState;

  LoginView get currentLoginState => _currentLoginState;

  // Setters
  set verificationId(String? verificationIdValue)  => _verificationId = verificationIdValue;

  void authChangeHandler(User? user){
    log('Handling auth state change event in stream');
    if(user == null){
      log('User Logged out');
      _currentAppState = AppState.LoggedOut;
    }else{
      log('User Logged in');
      _currentAppState = AppState.LoggedIn;
    }
    notifyListeners();
    log('AuthModel listener has been notified of possible auth state change');
  }

  void verifyPhoneNumber(String phoneNumber){
    this._auth.verifyPhoneNumber(
        phoneNumber: phoneNumber,
        verificationCompleted: (phoneAuthCredential){
          this._auth.signInWithCredential(phoneAuthCredential);
          _currentAppState = AppState.LoggedIn;
          notifyListeners();
        },
        verificationFailed: (error) {
          if (error.code == 'invalid-phone-number') {
            print('The provided phone number is not valid.');
          }
        },
        codeSent: (verificationId, forceResendingToken){
          log('Code Sent');
          this._verificationId =  verificationId;
          _currentLoginState = LoginView.OTP;
          notifyListeners();
        },
        codeAutoRetrievalTimeout: (verificationId) {
          log('OTP Timeout');
        },
    );
  }

  Future<void> registerUserWithOTP(String? otp) async {
    PhoneAuthCredential credentials = PhoneAuthProvider.credential(verificationId: this._verificationId??"", smsCode: otp??"");
    await this._auth.signInWithCredential(credentials);
    _currentAppState = AppState.LoggedIn;
    notifyListeners();
  }

  void logout(){
    this._auth.signOut();
    _currentLoginState = LoginView.Phone;
  }
}