import 'package:flutter/material.dart';

class NavigationService {
  // GlobalKey for managing SnackBars.
  final GlobalKey<ScaffoldMessengerState> snackBarKey =
      GlobalKey<ScaffoldMessengerState>();

  // GlobalKey for managing Tooltips.
  GlobalKey<TooltipState> toolTipKey = GlobalKey<TooltipState>();

  // GlobalKey for managing navigation.
  GlobalKey<NavigatorState> navigatorKey = GlobalKey<NavigatorState>();

  // Navigate to a specified route with optional arguments.
  navigateTo(String routeName, {Object? args}) {
    return navigatorKey.currentState!.pushNamed(
      routeName,
      arguments: args,
    );
  }

  // Navigate to a specified route and replace the current route.
  navigateToAndReplacement(String routeName, {Object? args}) {
    return navigatorKey.currentState!.pushReplacementNamed(
      routeName,
      arguments: args,
    );
  }

  // Navigate to a specified route and remove all previous routes.
  navigateToAndRemove(String routeName, {Object? args}) {
    return navigatorKey.currentState!.pushNamedAndRemoveUntil(
        routeName, (Route<dynamic> route) => false,
        arguments: args);
  }

  // Pop the current route.
  pop() {
    return navigatorKey.currentState!.pop();
  }
}
