import 'package:dakakeen/config/theme/assets_manager.dart';
import 'package:flutter/material.dart';

class IntroProvider with ChangeNotifier{
  int _currentPage = 0;

  int get currentPage => _currentPage;

  void setPage(int page) {
    _currentPage = page;
    notifyListeners();
  }

  final List<String> titles = [
    'Fastest Payment in the world',
    'The most Secure Platform for Customer',
    'Paying for Everything is Easy and Convenient'
  ];
  final List<String> subtitles = [
    'Integrate multiple payment methods to help you up the process quickly',
    'Built-in fingerprint, face recognition and more, keeping you completely safe',
    'Built-in fingerprint, face recognition and more, keeping you completely safe'
  ];
  final List<String> images = [
    ImageAssets.onboarding1,
    ImageAssets.onboarding2,
    ImageAssets.onboarding3
  ];


}
