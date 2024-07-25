import 'package:flutter/material.dart';

import '../config/theme/theme_manager.dart';

class ServiceProvider with ChangeNotifier {
  bool isDark = false;
  ThemeData _themeDataStyle = ThemeDataStyle.light;

  ThemeData getTheme() {
    return _themeDataStyle;
  }

  void changeTheme({required bool isDark}) {
    print(isDark);
    if (isDark) {
      _themeDataStyle = ThemeDataStyle.dark;
    } else {
      _themeDataStyle = ThemeDataStyle.light;
    }
    notifyListeners();
  }
}
