import 'package:flutter/material.dart';

import '../config/theme/theme_manager.dart';

class ServiceProvider with ChangeNotifier {

  bool _isDark = false;
  ThemeData _themeDataStyle = ThemeDataStyle.light;

  bool get isDark => _isDark;

  void changeTheme({required bool isDark}) {
    if (isDark) {
      _isDark = isDark;
      _themeDataStyle = ThemeDataStyle.dark;
    } else {
      _isDark = isDark;
      _themeDataStyle = ThemeDataStyle.light;
    }
    // _isDark=isDark;

    notifyListeners();

    print('in provider $_isDark');
  }

  bool getThemeValue() {
    return _isDark;
  }

  ThemeData getTheme() {
    return _themeDataStyle;
  }
}
