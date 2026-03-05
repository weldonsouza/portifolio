import 'package:flutter/material.dart';

/// Provider para o menu mobile.
class MenuProvider extends ChangeNotifier {
  bool _isOpen = false;

  bool get isOpen => _isOpen;

  void toggle() {
    _isOpen = !_isOpen;
    notifyListeners();
  }

  void close() {
    if (_isOpen) {
      _isOpen = false;
      notifyListeners();
    }
  }
}
