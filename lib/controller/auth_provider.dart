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
  bool _isLoggedIn = false;

  String get fullName => _fullName;
  String get phoneNumber => _phoneNumber;
  String get email => _email;
  String get password => _password;
  bool get isLoading => _isLoading;
  bool get isLoggedIn => _isLoggedIn;

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

  Future<void> signUp(GlobalKey<FormState> formKey) async {
    if (formKey.currentState!.validate()) {
      _isLoading = true;
      notifyListeners();

      // Simulate a network call
      await Timer(Duration(seconds: 3), () {
        _isLoading = false;
        sl<NavigationService>().navigateToAndRemove(Routes.login);
        notifyListeners();
      });
    }
  }

  void togglePasswordVisibility() {
    isPasswordVisible = !isPasswordVisible;
    notifyListeners();
  }


  Future<void> logout() async {
    try {
      await FirebaseAuth.instance.signOut();
      _isLoggedIn = false;
      notifyListeners();
    } catch (e) {
      // Handle error
      sl<AppConfig>().showCustomSnackBar('Error logging out: $e'??"Auth faild , Try again later!",Success: false,);
      _isLoading = false;
      notifyListeners();
    }
  }

}
