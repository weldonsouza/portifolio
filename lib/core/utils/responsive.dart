import 'package:flutter/material.dart';

/// Utilitários de responsividade.
bool isMobile(BuildContext context) {
  return MediaQuery.sizeOf(context).width < 768;
}

bool isDesktop(BuildContext context) {
  return MediaQuery.sizeOf(context).width >= 768;
}

double screenWidth(BuildContext context) {
  return MediaQuery.sizeOf(context).width;
}
