class MoneyTransactionModel {
  final String payerName;
  final String emailAddress;
  final String? description;
  final DateTime dueDate;
  final double amount;
  final String currency;
  final bool isRequest; // true for request, false for send

  MoneyTransactionModel({
    required this.payerName,
    required this.emailAddress,
    required this.description,
    required this.dueDate,
    required this.amount,
    required this.currency,
    required this.isRequest,
  });
}
