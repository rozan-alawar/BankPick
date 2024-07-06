
import 'package:dakakeen/presentation/card/card_screen.dart';
import 'package:dakakeen/presentation/home/home_screen.dart';
import 'package:dakakeen/presentation/settings/settings_screen.dart';
import 'package:dakakeen/presentation/statistic/statistics_screen.dart';
import 'package:flutter/material.dart';

import '../model/transaction_model.dart';

class HomeProvider with ChangeNotifier {
  String _name = 'Tanya Myroniuk';

  int _currentIndex = 0;

  int get currentIndex => _currentIndex;

  void setIndex(int index) {
    _currentIndex = index;
    notifyListeners();
  }

  String get name => _name;
  // List<TransactionModel> get transactions => _transactions;

  void updateName(String newName) {
    _name = newName;
    notifyListeners();
  }

  void addTransaction(TransactionModel transaction) {
    // _transactions.add(transaction);
    notifyListeners();
  }

  final screens =<Widget>[
    const HomeScreen(),
    const CardScreen(),
    const StatisticsScreen(),
    const SettingsScreen()
  ];
}

