import 'package:flutter/material.dart';

import 'navigation_service.dart';

class AlertService {
  static Future<void> showAlert({String title = 'Alert', required String message}) async {
    final context = NavigationService.navigationKey.currentContext;
    if (context != null) {
      await showDialog(
        context: context,
        builder: (context) {
          return AlertDialog(
            title: Text(message),
            actions: [
              TextButton(
                onPressed: () => Navigator.of(context).pop(),
                child: const Text('OK'),
              ),
            ],
          );
        },
      );
    }
  }
}
