import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

import '../config/theme/assets_manager.dart';
import '../core/utils/app_config.dart';
import '../core/utils/cache_helper.dart';
import '../core/utils/navigation.dart';
import '../injection_container.dart';
import '../model/card_model.dart';
import '../model/money_transaction_model.dart';
import '../model/user_model.dart';

class WalletProvider with ChangeNotifier {
  User_Model? user = CacheHelper.getData(key: 'user') ??
      User_Model(
        name: 'Tanya Myroniuk',
        avatarUrl: ImageAssets.profile,
        email: 'tanya.myroniuk@gmail.com',
        phoneNumber: '+8801712663389',
        birthDate: DateTime(2000, 9, 28),
        joinedDate: DateTime(2021, 1, 28),
        cards: [
          CardModel(
            cardNumber: '1234 5678 9876 5432',
            cardHolder: 'Rozan AbuAlawar',
            expiryDate: '09/25',
            cvv: '123',
            cardType: 'Visa',
          ),
          CardModel(
            cardNumber: '4321 8765 6789 1234',
            cardHolder: 'Tanya Myroniuk',
            expiryDate: '11/24',
            cvv: '456',
            cardType: 'Mastercard',
          ),
        ],
      );
  bool isLoading = false;

  double spendingLimit = 8545;

  //---------------------------------- UPDATE SPENDING LIMIT -----------------------------------------------------
  //we can't update spending limit , its should be fixed according user spending limit
  void updateSpendingLimit(double newLimit) {
    spendingLimit = newLimit;
    notifyListeners();
  }

  //---------------------------------- ADD NEW CARD --------------------------------------------------------
  void addCard(
      {required GlobalKey<FormState> formkey, required CardModel newCard}) {
    print(formkey.currentState?.validate());
    if (formkey.currentState?.validate() ?? false) {
      user?.cards.add(newCard);
      notifyListeners();
      sl<NavigationService>().pop();
    }
  }

//---------------------------------- REQUEST MONEY FROM FRIENDS --------------------------------------------
  void sendMoneyToFriend({
    required GlobalKey<FormState> formKey,
    required String payerName,
    required String email,
    required String amount,
    String? description,
  }) {
    if (formKey.currentState!.validate()) {
      isLoading = true;
      notifyListeners();
    }
    isLoading = false;
    notifyListeners();
  }

//---------------------------------- SEND MONEY TO FRIENDS -------------------------------------------------
  void requestMoneyFromFriend({
    required GlobalKey<FormState> formKey,
    required String payerName,
    required String email,
    required String currency,
    required double amount,
    DateTime? date,
    String? description,
  }) {
    if (formKey.currentState!.validate()) {
      final moneyRequest = MoneyTransactionModel(
        payerName: payerName,
        emailAddress: email,
        description: description,
        dueDate: date ?? DateTime.now(),
        amount: amount,
        currency: currency,
        isRequest: true, // Set to true for money request
      );

      // You can now use this moneyRequest object to send a request to the backend or handle it as needed.
      print(moneyRequest);

      // Show a confirmation message to the user

      sl<AppConfig>()
          .showCustomSnackBar('Request sent successfully!', Success: true);

      isLoading = false;
      notifyListeners();
    }
  }
}
