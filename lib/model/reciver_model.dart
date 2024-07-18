import 'package:dakakeen/config/theme/assets_manager.dart';

class ReciverModel {
  final String firstName;
  final String lastName;
  final String avatarUrl;
  final String email;

  ReciverModel(
      {required this.firstName,
      required this.lastName,
      required this.avatarUrl,
      required this.email});

  static final recivers = [
    ReciverModel(
      avatarUrl: ImageAssets.profile,
      email: 'email@gmail.com',
      firstName: 'Mohammed',
      lastName: 'Ali',
    ),
    ReciverModel(
      avatarUrl: ImageAssets.profile,
      email: 'noor2002@gmail.com',
      firstName: 'Noor',
      lastName: 'Ahmed',
    ),
    ReciverModel(
      lastName: 'Alawar',
      avatarUrl: ImageAssets.profile,
      email: 'rozanna@gmail.com',
      firstName: 'Rozanna',
    ),
    ReciverModel(
      avatarUrl: ImageAssets.profile,
      email: 'hala2021@gmail.com',
      firstName: 'Hala',
      lastName: 'Hamid',
    ),
  ];
}
