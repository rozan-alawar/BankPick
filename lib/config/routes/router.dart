import 'package:flutter/material.dart';

class AppRoutes {
  static Route onGenerateRoutes(RouteSettings settings) {
    switch (settings.name) {
      // case '/':
      //   return _materialRoute(const DailyNews());

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
