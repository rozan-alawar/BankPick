import 'package:flutter/material.dart';
import '../config/theme/assets_manager.dart';
import '../config/theme/theme_manager.dart';
import '../core/utils/cache_helper.dart';

class ServiceProvider with ChangeNotifier {
  bool _isDark = false;

  ThemeData _themeDataStyle = ThemeDataStyle.light;

  bool get isDark => _isDark;

  //----------------------------- CHANGE CURRENT THEME MODE --------------------------------

  void changeTheme({required bool isDark}) {
    print(isDark);
    _themeDataStyle = isDark ? ThemeDataStyle.dark : ThemeDataStyle.light;
    _isDark = isDark;
    notifyListeners();

    // print('in provider $_isDark');
  }

  //--------------------------------- GET THEME VALUE -------------------------------------

  bool getThemeValue() {
    return _isDark;
  }

  //--------------------- GET SAVED THEME MODE FROM CACHE --------------------------------
  getThemeFromCache() async {
    _isDark = await CacheHelper.getData(key: 'isDark')??false;
    notifyListeners();
  }

  //-------------------------------- GET THEME MODE ---------------------------------------
  ThemeData getTheme() {
    getThemeFromCache();
    _themeDataStyle =
        getThemeValue() ? ThemeDataStyle.dark : ThemeDataStyle.light;
    return _themeDataStyle;
  }

  //change language
  String _languageCode = 'en';
  String selectedLanguage = 'English';

  String get languageCode => _languageCode;

  List<Map<String, String>> languages = [
    {'name': 'English', 'flag': ImageAssets.en_flag},
    {'name': 'Australia', 'flag': ImageAssets.au_flag},
    {'name': 'Franch', 'flag': ImageAssets.fr_flag},
    {'name': 'Spanish', 'flag': ImageAssets.es_flag},
    {'name': 'America', 'flag': ImageAssets.us_flag},
    {'name': 'Vietnam', 'flag': ImageAssets.vn_flag},
    {'name': 'Arabic', 'flag': ImageAssets.vn_flag},
  ];

  List<Map<String, String>> filteredLanguages =[
    {'name': 'English', 'flag': ImageAssets.en_flag, 'language_code':'en'},
    {'name': 'Australia', 'flag': ImageAssets.au_flag,'language_code':'au'},
    {'name': 'Franch', 'flag': ImageAssets.fr_flag,'language_code':'fr'},
    {'name': 'Spanish', 'flag': ImageAssets.es_flag,'language_code':'es'},
    {'name': 'America', 'flag': ImageAssets.us_flag,'language_code':'us'},
    {'name': 'Vietnam', 'flag': ImageAssets.vn_flag,'language_code':'vn'},
    {'name': 'Arabic', 'flag': ImageAssets.vn_flag,'language_code':'ar'},
  ];

  void filterLanguages(String query) {
    final filtered = languages.where((language) {
      final languageName = language['name']!.toLowerCase();
      final input = query.toLowerCase();
      return languageName.contains(input);
    }).toList();
    filteredLanguages = filtered;
    notifyListeners();
  }

  void changeLanguage({required String languageCode}) {
    _languageCode = languageCode;
    notifyListeners();
  }

  getLanguageFromCache() async {
    _languageCode = await CacheHelper.getData(key: 'languageCode');
    notifyListeners();
  }

  String getLanguage() {
    getLanguageFromCache();
    return _languageCode;
  }

  void saveLanguageToCache({required String languageCode}) {
    CacheHelper.saveData(key: 'languageCode', value: languageCode);
    notifyListeners();

  }
}
