import 'package:dakakeen/config/theme/assets_manager.dart';
import 'package:dakakeen/model/user_model.dart';

class Message {
  final User sender;
  final String subject;
  final String body;
  final DateTime date;

  Message({
    required this.sender,
    required this.subject,
    required this.body,
    required this.date,
  });
  static final List<Message> messages = [
    Message(
      sender:User(name:  "John Doe", avatarUrl: ImageAssets.profile, email: "JohnDoe@gmail.com", phoneNumber: '059874125', birthDate: DateTime.now(), joinedDate: DateTime.now(), cards: []),
      subject: "Welcome to our service",
      body: "Thank you for signing up for our service. We're glad to have you!",
      date: DateTime.now().subtract(const Duration(days: 1)),
    ),
    Message(
      sender:User(name: "Jane Smith", avatarUrl: ImageAssets.profile, email: "janeSmith@gmail.com", phoneNumber: '059874125', birthDate: DateTime.now(), joinedDate: DateTime.now(), cards: []),
      subject: "Your monthly report",
      body: "Here is your monthly report for June. Please review the attached documents.",
      date: DateTime.now().subtract(const Duration(days: 2)),
    ),
    Message(
      sender:User(name: "Jane Smith", avatarUrl: ImageAssets.profile, email: "janeSmith@gmail.com", phoneNumber: '059874125', birthDate: DateTime.now(), joinedDate: DateTime.now(), cards: []),
      subject: "Your monthly report",
      body: "Here is your monthly report for June. Please review the attached documents.",
      date: DateTime.now().subtract(const Duration(days: 2)),
    ), Message(
      sender:User(name: "Jane Smith", avatarUrl: ImageAssets.profile, email: "janeSmith@gmail.com", phoneNumber: '059874125', birthDate: DateTime.now(), joinedDate: DateTime.now(), cards: []),
      subject: "Your monthly report",
      body: "Here is your monthly report for June. Please review the attached documents.",
      date: DateTime.now().subtract(const Duration(days: 2)),
    ), Message(
      sender:User(name: "Jane Smith", avatarUrl: ImageAssets.profile, email: "janeSmith@gmail.com", phoneNumber: '059874125', birthDate: DateTime.now(), joinedDate: DateTime.now(), cards: []),
      subject: "Your monthly report",
      body: "Here is your monthly report for June. Please review the attached documents.",
      date: DateTime.now().subtract(const Duration(days: 2)),
    ), Message(
      sender:User(name: "Jane Smith", avatarUrl: ImageAssets.profile, email: "janeSmith@gmail.com", phoneNumber: '059874125', birthDate: DateTime.now(), joinedDate: DateTime.now(), cards: []),
      subject: "Your monthly report",
      body: "Here is your monthly report for June. Please review the attached documents.",
      date: DateTime.now().subtract(const Duration(days: 2)),
    ), Message(
      sender:User(name: "Jane Smith", avatarUrl: ImageAssets.profile, email: "janeSmith@gmail.com", phoneNumber: '059874125', birthDate: DateTime.now(), joinedDate: DateTime.now(), cards: []),
      subject: "Your monthly report",
      body: "Here is your monthly report for June. Please review the attached documents.",
      date: DateTime.now().subtract(const Duration(days: 2)),
    ),
    // Add more messages here
  ];

}
