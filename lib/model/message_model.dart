import 'package:dakakeen/config/theme/assets_manager.dart';
import 'package:dakakeen/controller/home_provider.dart';
import 'package:dakakeen/model/user_model.dart';
import 'package:provider/provider.dart';

import '../injection_container.dart';

class Message {
  final User_Model sender;
  final String body;
  final DateTime date;

  Message({
    required this.sender,
    required this.body,
    required this.date,
  });
  static final List<Message> messages = [
    Message(
      sender:User_Model(name:  "John Doe", avatarUrl: ImageAssets.profile, email: "JohnDoe@gmail.com", phoneNumber: '059874125', birthDate: DateTime.now(), joinedDate: DateTime.now(), cards: []),
      body: "Thank you for signing up for our service. We're glad to have you!",
      date: DateTime.now().subtract(const Duration(days: 1)),
    ),
    Message(
      sender:User_Model(name: "Jane Smith", avatarUrl: ImageAssets.profile, email: "janeSmith@gmail.com", phoneNumber: '059874125', birthDate: DateTime.now(), joinedDate: DateTime.now(), cards: []),
      body: "Here is your monthly report for June. Please review the attached documents.",
      date: DateTime.now().subtract(const Duration(days: 2)),
    ),
    Message(
      sender:User_Model(name: "Jane Smith", avatarUrl: ImageAssets.profile, email: "janeSmith@gmail.com", phoneNumber: '059874125', birthDate: DateTime.now(), joinedDate: DateTime.now(), cards: []),
      body: "Here is your monthly report for June. Please review the attached documents.",
      date: DateTime.now().subtract(const Duration(days: 2)),
    ), Message(
      sender:User_Model(name: "Jane Smith", avatarUrl: ImageAssets.profile, email: "janeSmith@gmail.com", phoneNumber: '059874125', birthDate: DateTime.now(), joinedDate: DateTime.now(), cards: []),
      body: "Here is your monthly report for June. Please review the attached documents.",
      date: DateTime.now().subtract(const Duration(days: 2)),
    ), Message(
      sender:User_Model(name: "Jane Smith", avatarUrl: ImageAssets.profile, email: "janeSmith@gmail.com", phoneNumber: '059874125', birthDate: DateTime.now(), joinedDate: DateTime.now(), cards: []),
      body: "Here is your monthly report for June. Please review the attached documents.",
      date: DateTime.now().subtract(const Duration(days: 2)),
    ), Message(
      sender:User_Model(name: "Jane Smith", avatarUrl: ImageAssets.profile, email: "janeSmith@gmail.com", phoneNumber: '059874125', birthDate: DateTime.now(), joinedDate: DateTime.now(), cards: []),
      body: "Here is your monthly report for June. Please review the attached documents.",
      date: DateTime.now().subtract(const Duration(days: 2)),
    ), Message(
      sender:User_Model(name: "Jane Smith", avatarUrl: ImageAssets.profile, email: "janeSmith@gmail.com", phoneNumber: '059874125', birthDate: DateTime.now(), joinedDate: DateTime.now(), cards: []),
      body: "Here is your monthly report for June. Please review the attached documents.",
      date: DateTime.now().subtract(const Duration(days: 2)),
    ),
    // Add more messages here
  ];





}
