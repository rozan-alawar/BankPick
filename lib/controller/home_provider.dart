
import 'package:dakakeen/presentation/card/card_screen.dart';
import 'package:dakakeen/presentation/home/home_screen.dart';
import 'package:dakakeen/presentation/settings/settings_screen.dart';
import 'package:dakakeen/presentation/statistic/statistics_screen.dart';
import 'package:flutter/material.dart';

class HomeProvider with ChangeNotifier {
  String _name = 'Tanya Myroniuk';
  // List<TransactionModel> _transactions = [
  //   TransactionModel(icon: Icons.apple, title: 'Apple Store', subtitle: 'Entertainment', amount: '- \$5.99'),
  //   TransactionModel(icon: Icons.music_note, title: 'Spotify', subtitle: 'Music', amount: '- \$12.99'),
  //   TransactionModel(icon: Icons.swap_horiz, title: 'Money Transfer', subtitle: 'Transaction', amount: '\$300'),
  //   TransactionModel(icon: Icons.shopping_cart, title: 'Grocery', subtitle: 'Shopping', amount: '- \$88'),
  // ];

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
    HomeScreen(),
    CardScreen(),
    StatisticsScreen(),
    SettingsScreen()
  ];
}


class TransactionModel {
  final IconData icon;
  final String title;
  final String subtitle;
  final String amount;

  TransactionModel({
    required this.icon,
    required this.title,
    required this.subtitle,
    required this.amount,
  });
}