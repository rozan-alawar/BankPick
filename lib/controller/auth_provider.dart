import 'dart:async';

import 'package:dakakeen/core/utils/app_config.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';

import '../config/routes/routes.dart';
import '../core/utils/navigation.dart';
import '../injection_container.dart';

class AuthProvider extends ChangeNotifier {
  bool isPasswordVisible = true;

  String _fullName = '';
  String _phoneNumber = '';
  String _email = '';
  String _password = '';
  bool _isLoading = false;
  bool showLoginScreen = true;

  String get fullName => _fullName;
  String get phoneNumber => _phoneNumber;
  String get email => _email;
  String get password => _password;
  bool get isLoading => _isLoading;

  void setFullName(String name) {
    _fullName = name;
    notifyListeners();
  }

  void setPhoneNumber(String number) {
    _phoneNumber = number;
    notifyListeners();
  }

  void setEmail(String email) {
    _email = email;
    notifyListeners();
  }

  void setPassword(String password) {
    _password = password;
    notifyListeners();
  }

  Future<void> login(
      {required GlobalKey<FormState> formKey,
      required String email,
      required String password}) async {
    if (formKey.currentState!.validate()) {
      _isLoading = true;
      notifyListeners();

      try {
        await FirebaseAuth.instance
            .signInWithEmailAndPassword(email: email, password: password);
        _isLoading = false;
        notifyListeners();
      } on FirebaseAuthException catch (e) {
        print(e.message);
        String  message = 'Authentication failed. Please check your email or password';

        sl<AppConfig>().showCustomSnackBar(message, Success: false);
      } finally {
        _isLoading = false;
        notifyListeners();
      }

    }
  }

  Future<void> signup({
    required GlobalKey<FormState> formKey,
    required String fullName,
    required String phoneNumber,
    required String email,
    required String password,
  }) async {
    if (formKey.currentState!.validate()) {
      _isLoading = true;
      notifyListeners();

      try {
        await FirebaseAuth.instance.createUserWithEmailAndPassword(email: email, password: password);

        // Update user profile
        User? user = FirebaseAuth.instance.currentUser;
        await user?.updateProfile(displayName: fullName);

        // Optionally, add additional user information to Firestore or another database

        _fullName = fullName;
        _phoneNumber = phoneNumber;
        _email = email;
        _password = password;

        String message = 'Signup successful. Welcome, $fullName!';
        sl<AppConfig>().showCustomSnackBar(message, Success: true);
      } on FirebaseAuthException catch (e) {
        print(e.message);
        String message;
        switch (e.code) {
          case 'email-already-in-use':
            message = 'The email address is already in use by another account.';
            break;
          case 'invalid-email':
            message = 'The email address is not valid.';
            break;
          case 'operation-not-allowed':
            message = 'Email/password accounts are not enabled.';
            break;
          case 'weak-password':
            message = 'The password is too weak.';
            break;
          default:
            message = 'Signup failed. Please try again later.';
        }
        sl<AppConfig>().showCustomSnackBar(message, Success: false);
      } finally {
        _isLoading = false;
        notifyListeners();
      }
    }
  }

  void togglePasswordVisibility() {
    isPasswordVisible = !isPasswordVisible;
    notifyListeners();
  }


  void togglePages() {
    showLoginScreen = !showLoginScreen;
    notifyListeners();
  }


  Future<void> logout() async {
    try {
      await FirebaseAuth.instance.signOut();
      notifyListeners();
    } catch (e) {
      // Handle error
      sl<AppConfig>().showCustomSnackBar('Error logging out: $e'??"Auth faild , Try again later!",Success: false,);
      _isLoading = false;
      notifyListeners();
    }
  }

}
