
import 'package:flutter/material.dart';

class HomeProvider with ChangeNotifier {
  String _name = 'Tanya Myroniuk';
  // List<TransactionModel> _transactions = [
  //   TransactionModel(icon: Icons.apple, title: 'Apple Store', subtitle: 'Entertainment', amount: '- \$5.99'),
  //   TransactionModel(icon: Icons.music_note, title: 'Spotify', subtitle: 'Music', amount: '- \$12.99'),
  //   TransactionModel(icon: Icons.swap_horiz, title: 'Money Transfer', subtitle: 'Transaction', amount: '\$300'),
  //   TransactionModel(icon: Icons.shopping_cart, title: 'Grocery', subtitle: 'Shopping', amount: '- \$88'),
  // ];

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