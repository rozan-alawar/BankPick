import 'package:dakakeen/controller/home_provider.dart';
import 'package:flutter/cupertino.dart';
import 'package:provider/provider.dart';

import '../model/user_model.dart';

class ProfileProvider with ChangeNotifier{
  User? user  ;
  void saveProfile(GlobalKey<FormState> formKey, BuildContext context ,String name , String email, String phone) {
    if (formKey.currentState?.validate()??false) {
user =Provider.of<HomeProvider>(context).user;
          user = User(
            name: name,
            avatarUrl: user!.avatarUrl,
            email: email,
            phoneNumber: phone,
            birthDate: user!.birthDate,
            joinedDate: user!.joinedDate,
            designation: user!.designation,
            cards: user!.cards,
          );
          notifyListeners();

      Navigator.pop(context);
    }
  }
}