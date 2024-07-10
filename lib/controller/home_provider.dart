import 'package:dakakeen/config/theme/assets_manager.dart';
import 'package:dakakeen/core/utils/navigation.dart';
import 'package:dakakeen/injection_container.dart';
import 'package:dakakeen/model/card_model.dart';
import 'package:dakakeen/presentation/card/card_screen.dart';
import 'package:dakakeen/presentation/home/home_screen.dart';
import 'package:dakakeen/presentation/settings/settings_screen.dart';
import 'package:dakakeen/presentation/statistic/statistics_screen.dart';
import 'package:flutter/material.dart';

import '../model/transaction_model.dart';
import '../model/user_model.dart';

class HomeProvider with ChangeNotifier {
  String _name = 'Tanya Myroniuk';

  int _currentIndex = 0;
  double _spendingLimit = 8545;
  int get currentIndex => _currentIndex;
  User? _user = User(
    name: 'Tanya Myroniuk',
    avatarUrl: ImageAssets.profile,
    email: 'tanya.myroniuk@gmail.com',
    phoneNumber: '+8801712663389',
    birthDate: DateTime(2000, 9, 28),
    joinedDate: DateTime(2021, 1, 28),
    designation: 'Senior Designer',
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

  User? get user => _user;

  void setUser(User user) {
    _user = user;
    notifyListeners();
  }

  void setIndex(int index) {
    _currentIndex = index;
    notifyListeners();
  }

  // String get name => _name;
  double get spendingLimit => _spendingLimit;

  // void updateName(String newName) {
  //   _name = newName;
  //   notifyListeners();
  // }

  void addTransaction(TransactionModel transaction) {
    // _transactions.add(transaction);
    notifyListeners();
  }

  final screens = <Widget>[
    const HomeScreen(),
    const CardScreen(),
    const StatisticsScreen(),
    const SettingsScreen()
  ];

  void updateSpendingLimit(double newLimit) {
    _spendingLimit = newLimit;
    notifyListeners();
  }

  void addCard({ required GlobalKey<FormState> formkey, required CardModel newCard}) {
    print(formkey.currentState?.validate());
    if (formkey.currentState?.validate()??false) {

      _user?.cards.add(newCard);
      notifyListeners();
      sl<NavigationService>().pop();
    }
  }
}
