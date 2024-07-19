import 'package:dakakeen/controller/home_provider.dart';
import 'package:flutter/cupertino.dart';
import 'package:provider/provider.dart';

import '../model/user_model.dart';

class ProfileProvider with ChangeNotifier{
  User? user  =HomeProvider().user;
  void saveProfile(GlobalKey<FormState> formKey, BuildContext context ,String name , String email, String phone) {
    if (formKey.currentState?.validate()??false) {
          user = User(
            name: name,
            avatarUrl: user!.avatarUrl,
            email: email,
            phoneNumber: phone,
            birthDate: user!.birthDate,
            joinedDate: user!.joinedDate,
            cards: user!.cards,
          );
          notifyListeners();

      Navigator.pop(context);
    }
  }
}