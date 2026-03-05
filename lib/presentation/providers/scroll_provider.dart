import 'package:flutter/material.dart';

/// Provider para detectar se o header foi scrollado e qual seção está ativa.
class ScrollProvider extends ChangeNotifier {
  bool _isScrolled = false;
  String _activeSection = '';

  bool get isScrolled => _isScrolled;
  String get activeSection => _activeSection;

  void update({
    required double scrollOffset,
    required List<String> sectionIds,
    required Map<String, GlobalKey> sectionKeys,
  }) {
    final newScrolled = scrollOffset > 50;
    String? newActive;
    for (final id in sectionIds.reversed) {
      final key = sectionKeys[id];
      final ctx = key?.currentContext;
      if (ctx != null) {
        final ro = ctx.findRenderObject();
        if (ro is RenderBox) {
          final pos = ro.localToGlobal(Offset.zero);
          if (pos.dy <= 150) {
            newActive = id;
            break;
          }
        }
      }
    }
    final resolvedActive = newActive ?? '';

    final scrolledChanged = newScrolled != _isScrolled;
    final activeChanged = resolvedActive != _activeSection;

    if (!scrolledChanged && !activeChanged) return;

    _isScrolled = newScrolled;
    _activeSection = resolvedActive;
    notifyListeners();
  }

  void setActiveSection(String id) {
    if (_activeSection != id) {
      _activeSection = id;
      notifyListeners();
    }
  }
}
