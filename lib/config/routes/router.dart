import 'package:dakakeen/config/routes/routes.dart';
import 'package:dakakeen/presentation/auth/login_screen.dart';
import 'package:dakakeen/presentation/intro/onboarding_screen.dart';
import 'package:dakakeen/presentation/intro/spalsh_screen.dart';
import 'package:flutter/material.dart';

class AppRoutes {
  static Route onGenerateRoutes(RouteSettings settings) {
    switch (settings.name) {
      case Routes.splash:
        return _materialRoute(const SplashScreen());

      case Routes.login:
        return _materialRoute(const LoginScreen());

      case Routes.onboarding:
        return _materialRoute(const OnboardingScreen());
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
