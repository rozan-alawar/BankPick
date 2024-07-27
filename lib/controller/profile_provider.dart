
import 'package:flutter/cupertino.dart';
import '../config/theme/assets_manager.dart';
import '../core/utils/cache_helper.dart';
import '../model/card_model.dart';
import '../model/message_model.dart';
import '../model/user_model.dart';

class ProfileProvider with ChangeNotifier {
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
  void saveProfile(GlobalKey<FormState> formKey, BuildContext context,
      String name, String email, String phone) {
    if (formKey.currentState?.validate() ?? false) {
      user = User_Model(
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

  List<Message> userMessages = [...Message.messages];

  List<Message> contactUsMessages = [
    Message(
      sender: User_Model(
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
      sender: CacheHelper.getData(key: 'user') ??
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
          ),
      body: "I have a question about my recent transaction.",
      date: DateTime.now().subtract(const Duration(minutes: 3)),
    ),
  ];

  void sendMessage(
      {required TextEditingController controller,
      required bool withOtherUser}) {
    if (controller.text.trim().isNotEmpty) {
      withOtherUser
          ? userMessages.add(
              Message(
                sender: user!,
                body: controller.text.trim(),
                date: DateTime.now(),
              ),
            )
          : contactUsMessages.add(
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
