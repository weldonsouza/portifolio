import 'package:flutter/material.dart';

import '../utils/constants.dart';

final NavigationService navigationService = NavigationService();

class NavigationService {
  static GlobalKey<NavigatorState> navigationKey = GlobalKey<NavigatorState>();

  static void showSnackBarMessage(String message, bool isSuccess) {
    ScaffoldMessenger.of(NavigationService.navigationKey.currentContext!)
      ..hideCurrentSnackBar
      ..showSnackBar(
        SnackBar(
          content: Text(
            message,
            style: TextStyle(
              color: isSuccess ? Constants.blackColor : Constants.whiteColor,
            ),
          ),
          backgroundColor: isSuccess
              ? Constants.successSnackBarColor
              : Constants.errorSnackBarColor,
        ),
      );
  }

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
