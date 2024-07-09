class CardModel{
  final String cardNumber;
  final String cardHolder;
  final String expiryDate;
  final String cvv;
  final String cardType; // e.g., Mastercard, Visa

  CardModel({
    required this.cardNumber,
    required this.cardHolder,
    required this.expiryDate,
    required this.cvv,
    required this.cardType,
  });
}