import 'package:dakakeen/config/routes/routes.dart';
import 'package:dakakeen/presentation/screens/spalsh_screen.dart';
import 'package:flutter/material.dart';

class AppRoutes {
  static Route onGenerateRoutes(RouteSettings settings) {
    switch (settings.name) {
      case Routes.splash:
        return _materialRoute(const SplashScreen());

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
