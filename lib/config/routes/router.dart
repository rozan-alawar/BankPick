import 'package:dakakeen/config/routes/routes.dart';
import 'package:dakakeen/presentation/auth/login_screen.dart';
import 'package:dakakeen/presentation/auth/signup_screen.dart';
import 'package:dakakeen/presentation/card/add_card_screen.dart';
import 'package:dakakeen/presentation/home/home_screen.dart';
import 'package:dakakeen/presentation/home/main_screen.dart';
import 'package:dakakeen/presentation/intro/onboarding_screen.dart';
import 'package:dakakeen/presentation/intro/spalsh_screen.dart';
import 'package:flutter/material.dart';

class AppRoutes {
  static Route onGenerateRoutes(RouteSettings settings) {
    switch (settings.name) {
      case Routes.splash:
        return _materialRoute(const SplashScreen());

      case Routes.onboarding:
        return _materialRoute(const OnboardingScreen());

      case Routes.login:
        return _materialRoute(const LoginScreen());

      case Routes.signup:
        return _materialRoute(const SignupScreen());

      case Routes.home:
        return _materialRoute( const MainScreen());

      case Routes.add_card:
        return _materialRoute( const AddCardScreen());


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
