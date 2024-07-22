import 'package:dakakeen/config/routes/routes.dart';
import 'package:dakakeen/presentation/auth/auth_screen.dart';
import 'package:dakakeen/presentation/auth/change_password_screen.dart';
import 'package:dakakeen/presentation/auth/login_register_screen.dart';
import 'package:dakakeen/presentation/auth/login_screen.dart';
import 'package:dakakeen/presentation/auth/signup_screen.dart';
import 'package:dakakeen/presentation/card/add_card_screen.dart';
import 'package:dakakeen/presentation/card/add_new_reciver.dart';
import 'package:dakakeen/presentation/card/show_cards_screen.dart';
import 'package:dakakeen/presentation/home/home_screen.dart';
import 'package:dakakeen/presentation/home/main_screen.dart';
import 'package:dakakeen/presentation/home/search_screen.dart';
import 'package:dakakeen/presentation/home/transaction_history_screen.dart';
import 'package:dakakeen/presentation/intro/onboarding_screen.dart';
import 'package:dakakeen/presentation/intro/spalsh_screen.dart';
import 'package:dakakeen/presentation/profile/edit_profile_screen.dart';
import 'package:dakakeen/presentation/profile/message_center_screen.dart';
import 'package:dakakeen/presentation/profile/personal_information_screen.dart';
import 'package:dakakeen/presentation/profile/profile_screen.dart';
import 'package:dakakeen/presentation/settings/contact_us_screen.dart';
import 'package:dakakeen/presentation/settings/language_screen.dart';
import 'package:dakakeen/presentation/settings/term_and_condition_screen.dart';
import 'package:dakakeen/presentation/statistic/notification_screen.dart';
import 'package:flutter/material.dart';

import '../../presentation/card/request_screen.dart';
import '../../presentation/card/send_money_screen.dart';

class AppRoutes {
  static Route onGenerateRoutes(RouteSettings settings) {
    switch (settings.name) {
      case Routes.splash:
        return _materialRoute(const SplashScreen());

      case Routes.onboarding:
        return _materialRoute(const OnboardingScreen());

      case Routes.login:
        return _materialRoute(const LoginRegisterScreen());

      // case Routes.signup:
      //   return _materialRoute(const SignupScreen());

      case Routes.auth:
        return _materialRoute(const AuthScreen());

      case Routes.home:
        return _materialRoute(const MainScreen());

      case Routes.add_card:
        return _materialRoute(const AddCardScreen());

      case Routes.show_cards:
        return _materialRoute(const CardsScreen());

      case Routes.language:
        return _materialRoute(const LanguageScreen());

      case Routes.profile:
        return _materialRoute(const ProfileScreen());

      case Routes.edit_profile:
        return _materialRoute(const EditProfileScreen());

      case Routes.transaction_history:
        return _materialRoute(const TransactionHistoryScreen());

      case Routes.search:
        return _materialRoute(const SearchScreen());

      case Routes.send:
        return _materialRoute(const SendMoneyScreen());

      case Routes.request:
        return _materialRoute(const RequestMoneyScreen());

      case Routes.term_condition:
        return _materialRoute(const TermAndConditionScreen());

      case Routes.change_password:
        return _materialRoute(const ChangePasswordScreen());

      case Routes.message_center:
        return _materialRoute(const MessageCenterScreen());

      case Routes.add_new_reciver:
        return _materialRoute(const AddNewReciver());

      case Routes.notification:
        return _materialRoute(const NotificationScreen());

      case Routes.personal_information:
        return _materialRoute(const PersonalInformationScreen());

      case Routes.contact_us:
        return _materialRoute(const ContactUsScreen());

      default:
        return _materialRoute(
          Text('No route defined for ${settings.name}'),
        );
    }
  }

  static Route<dynamic> _materialRoute(Widget view) {
    return MaterialPageRoute(builder: (_) => view);
  }
}
