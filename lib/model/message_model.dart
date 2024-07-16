class Message {
  final String sender;
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
      sender: "John Doe",
      subject: "Welcome to our service",
      body: "Thank you for signing up for our service. We're glad to have you!",
      date: DateTime.now().subtract(Duration(days: 1)),
    ),
    Message(
      sender: "Jane Smith",
      subject: "Your monthly report",
      body: "Here is your monthly report for June. Please review the attached documents.",
      date: DateTime.now().subtract(Duration(days: 2)),
    ),
    // Add more messages here
  ];

}
