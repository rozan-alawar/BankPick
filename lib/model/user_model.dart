import 'package:dakakeen/model/card_model.dart';

class User_Model {
  final String name;
  final String avatarUrl;
  final String email;
  final String phoneNumber;
  final DateTime birthDate;
  final DateTime joinedDate;
  final List<CardModel> cards;

  User_Model({
    required this.name,
    required this.avatarUrl,
    required this.email,
    required this.phoneNumber,
    required this.birthDate,
    required this.joinedDate,
    required this.cards,
  });
}