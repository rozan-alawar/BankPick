class NotificationModel {
  final String title;
  final String message;
  final DateTime date;
  final bool isRead;

  NotificationModel({
    required this.title,
    required this.message,
    required this.date,
    this.isRead = false,
  });
  static final List<NotificationModel> notifications = [
    NotificationModel(
      title: "Payment Successful",
      message: "Your payment of \$100 was successful.",
      date: DateTime.now().subtract(const Duration(minutes: 5)),
      isRead: true
    ),
    NotificationModel(
      title: "New Message",
      message: "You have received a new message from John.",
      date: DateTime.now().subtract(const Duration(hours: 1)),
    ),
    NotificationModel(
      title: "Reminder",
      message: "Your subscription is about to expire in 3 days.",
      date: DateTime.now().subtract(const Duration(days: 1)),
    ),
    // Add more notifications here
  ];

}
