import 'package:flutter/material.dart';
import '../config/theme/theme_manager.dart';
import '../core/utils/cache_helper.dart';

class ServiceProvider with ChangeNotifier {
  bool _isDark = false;

  ThemeData _themeDataStyle = ThemeDataStyle.light;

  bool get isDark => _isDark;

  //----------------------------- CHANGE CURRENT THEME MODE --------------------------------

  void changeTheme({required bool isDark}) {
    if (isDark) {
      _isDark = isDark;
      _themeDataStyle = ThemeDataStyle.dark;
    } else {
      _isDark = isDark;
      _themeDataStyle = ThemeDataStyle.light;
    }

    notifyListeners();

    print('in provider $_isDark');
  }

  //--------------------------------- GET THEME VALUE -------------------------------------

  bool getThemeValue() {
    return _isDark;
  }

  //--------------------- GET SAVED THEME MODE FROM CACHE --------------------------------
  getThemeFromCache() async {
    _isDark = await CacheHelper.getData(key: 'isDark');
    notifyListeners();
  }

  //-------------------------------- GET THEME MODE ---------------------------------------
  ThemeData getTheme() {
    print('Them is dark? ${CacheHelper.getData(key: 'isDark')}');
    getThemeFromCache();
    _themeDataStyle = _isDark ? ThemeDataStyle.dark : ThemeDataStyle.light;
    return _themeDataStyle;
  }
}
