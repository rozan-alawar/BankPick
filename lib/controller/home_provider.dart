import 'package:dakakeen/config/theme/assets_manager.dart';
import 'package:dakakeen/config/theme/theme_manager.dart';
import 'package:dakakeen/core/utils/navigation.dart';
import 'package:dakakeen/injection_container.dart';
import 'package:dakakeen/model/card_model.dart';
import 'package:dakakeen/presentation/card/card_screen.dart';
import 'package:dakakeen/presentation/home/home_screen.dart';
import 'package:dakakeen/presentation/settings/settings_screen.dart';
import 'package:dakakeen/presentation/statistic/statistics_screen.dart';
import 'package:flutter/material.dart';

import '../core/utils/cache_helper.dart';
import '../model/transaction_model.dart';
import '../model/user_model.dart';

class HomeProvider with ChangeNotifier {

  int _currentIndex = 0;
  bool _isDark = false;
  int get currentIndex => _currentIndex;
   User_Model? user = CacheHelper.getData(key: 'user')??User_Model(
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




  void setIndex(int index) {
    _currentIndex = index;
    notifyListeners();
  }



  void addTransaction(TransactionModel transaction) {
    // _transactions.add(transaction);
    notifyListeners();
  }

  final screens = <Widget>[
    const HomeScreen(),
    const CardScreen(),
    const StatisticsScreen(),
    const SettingsScreen()
  ];

}
