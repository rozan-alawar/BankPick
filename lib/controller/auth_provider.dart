import 'dart:async';
import 'dart:convert';

import 'package:dakakeen/core/utils/app_config.dart';
import 'package:dakakeen/model/user_model.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';

import '../config/routes/routes.dart';
import '../config/theme/assets_manager.dart';
import '../core/utils/cache_helper.dart';
import '../core/utils/navigation.dart';
import '../injection_container.dart';
import '../model/card_model.dart';

class AuthProvider extends ChangeNotifier {
  bool isPasswordVisible = true;

  bool _isLoading = false;
  bool showLoginScreen = true;

  bool get isLoading => _isLoading;

  void togglePasswordVisibility() {
    isPasswordVisible = !isPasswordVisible;
    notifyListeners();
  }

  void togglePages() {
    showLoginScreen = !showLoginScreen;
    print(showLoginScreen);
    notifyListeners();
  }

  //-------------------------------------------------- LOGIN --------------------------------------------------------------------

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
        User_Model user =User_Model(
          name: 'Tanya Myroniuk',
          avatarUrl: ImageAssets.profile,
          email: 'tanya.myroniuk@gmail.com',
          phoneNumber: '+8801712663389',
          birthDate: DateTime(2000, 9, 28),
          joinedDate: DateTime(2021, 1, 28),
          cards: [
            CardModel(
              cardNumber: '1234 5678 9876 5432',
              cardHolder: 'Rozan AbuAlawar',
              expiryDate: '09/25',
              cvv: '123',
              cardType: 'Visa',
            ),
            CardModel(
              cardNumber: '4321 8765 6789 1234',
              cardHolder: 'Tanya Myroniuk',
              expiryDate: '11/24',
              cvv: '456',
              cardType: 'Mastercard',
            ),
          ],
        );
        CacheHelper.saveData(key: 'user',value:  json.encode(user));

        _isLoading = false;
        notifyListeners();
      } on FirebaseAuthException catch (e) {
        print(e.message);
        String message =
            'Authentication failed. Please check your email or password';

        sl<AppConfig>().showCustomSnackBar(message, Success: false);
      } finally {
        _isLoading = false;
        notifyListeners();
      }
    }
  }

  //-------------------------------------------------- SIGN UP --------------------------------------------------------------------
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
        await FirebaseAuth.instance
            .createUserWithEmailAndPassword(email: email, password: password);

        // Update user profile
        User? user = FirebaseAuth.instance.currentUser;
        await user?.updateProfile(
          displayName: fullName,
        );

        // Optionally, add additional user information to Firestore or another database

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


  //-------------------------------------------------- LOGOUT --------------------------------------------------------------------

  Future<void> logout() async {
    _isLoading = true;
    notifyListeners();

    try {
      await FirebaseAuth.instance.signOut();
      notifyListeners();
    } catch (e) {
      _isLoading = false;
      notifyListeners();
      // Handle error
      sl<AppConfig>().showCustomSnackBar(
        'Error logging out: $e' ?? "Auth faild , Try again later!",
        Success: false,
      );
    } finally {
      _isLoading = false;
      notifyListeners();
    }
  }
}
