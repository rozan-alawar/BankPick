import 'package:dakakeen/controller/home_provider.dart';
import 'package:flutter/cupertino.dart';
import 'package:provider/provider.dart';

import '../config/theme/assets_manager.dart';
import '../model/message_model.dart';
import '../model/user_model.dart';

class ProfileProvider with ChangeNotifier {
  User? user = HomeProvider().user;
  void saveProfile(GlobalKey<FormState> formKey, BuildContext context,
      String name, String email, String phone) {
    if (formKey.currentState?.validate() ?? false) {
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
    List<Message> contactUsMessages = [
      Message(
        sender: User(
            name: 'Bank',
            avatarUrl: ImageAssets.appLogoPng,
            birthDate: DateTime.now(),
            cards: [],
            email: '',
            joinedDate: DateTime.now(),
            phoneNumber: ""),
        body: "Hello! How can we assist you today?",
        date: DateTime.now().subtract(const Duration(minutes: 5)),
      ),
      Message(
        sender: HomeProvider().user!,
        body: "I have a question about my recent transaction.",
        date: DateTime.now().subtract(const Duration(minutes: 3)),
      ),
    ];

    void sendMessage({
      required TextEditingController controller,
    }) {
      if (controller.text.trim().isNotEmpty) {
        contactUsMessages.add(
          Message(
            sender: user!,
            body: controller.text.trim(),
            date: DateTime.now(),
          ),
        );
        notifyListeners();
        controller.clear();
      }
    }
  }

