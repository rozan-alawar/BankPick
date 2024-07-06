
import 'package:flutter/material.dart';

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

List<TransactionModel> transactions = [
  TransactionModel(icon: Icons.apple, title: 'Apple Store', subtitle: 'Entertainment', amount: '- \$5.99'),
  TransactionModel(icon: Icons.music_note, title: 'Spotify', subtitle: 'Music', amount: '- \$12.99'),
  TransactionModel(icon: Icons.swap_horiz, title: 'Money Transfer', subtitle: 'Transaction', amount: '\$300'),
  TransactionModel(icon: Icons.shopping_cart, title: 'Grocery', subtitle: 'Shopping', amount: '- \$88'),
];
