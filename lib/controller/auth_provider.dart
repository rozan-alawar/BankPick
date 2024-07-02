import 'dart:async';

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

  Future<void> login(GlobalKey<FormState> formKey) async {
    if (formKey.currentState!.validate()) {
      _isLoading = true;
      notifyListeners();

      print(isLoading);
      // _isLoggedIn = await _authenticationService.login(_email, _password);
      await Timer(
        Duration(seconds: 3),
        () {
          _isLoading = false;
          sl<NavigationService>().navigateToAndRemove(Routes.home);
          notifyListeners();
        },
      );

      notifyListeners();
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
}
