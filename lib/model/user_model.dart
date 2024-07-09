import 'package:dakakeen/model/card_model.dart';

class User {
  final String name;
  final String avatarUrl;
  final String email;
  final String phoneNumber;
  final DateTime birthDate;
  final DateTime joinedDate;
  final String designation;
  final List<CardModel> cards;

  User({
    required this.name,
    required this.avatarUrl,
    required this.email,
    required this.phoneNumber,
    required this.birthDate,
    required this.joinedDate,
    required this.designation,
    required this.cards,
  });
}