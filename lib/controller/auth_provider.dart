import 'dart:async';

import 'package:flutter/material.dart';

class AuthProvider extends ChangeNotifier {
  bool isPasswordVisible = true;
  bool _isEmailValid = true;


  String _email = '';
  String _password = '';
  bool _isLoading = false;
  bool _isLoggedIn = false;

  String get email => _email;
  String get password => _password;
  bool get isLoading => _isLoading;
  bool get isLoggedIn => _isLoggedIn;

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
    await Timer(Duration(seconds: 3), () {
      _isLoading = false;
          notifyListeners();
    },);


    notifyListeners();
      }}


  void togglePasswordVisibility() {
    isPasswordVisible = !isPasswordVisible;
    notifyListeners();
  }

}
