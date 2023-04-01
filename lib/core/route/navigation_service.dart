import 'package:flutter/material.dart';

final NavigationService navigationService = NavigationService();

class NavigationService {
  static GlobalKey<NavigatorState> navigationKey = GlobalKey<NavigatorState>();

  Future<dynamic> push(String name, {Object? arguments}) async {
    return navigationKey.currentState?.pushNamed<dynamic>(
      name,
      arguments: arguments,
    );
  }

  Future<dynamic> pushRoute(Route<dynamic> route) async {
    return navigationKey.currentState?.push(route);
  }

  Future<dynamic> pushReplacement(String name, {Object? arguments}) async {
    return navigationKey.currentState?.pushNamedAndRemoveUntil<dynamic>(
      name,
      (route) => false,
      arguments: arguments,
    );
  }

  Future<dynamic> pop([dynamic result]) async {
    return navigationKey.currentState?.pop<dynamic>(result);
  }

  bool canPop() {
    return navigationKey.currentState?.canPop() == true;
  }
}
