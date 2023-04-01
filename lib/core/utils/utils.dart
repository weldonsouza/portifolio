import 'package:flutter/material.dart';
import 'package:url_launcher/url_launcher.dart';

class Utils {
  static mediaQuery(BuildContext context, double value, {String direction = 'V'}) {
    MediaQueryData mediaQuery = MediaQuery.of(context);
    Size size = mediaQuery.size;
    if (direction.toUpperCase() == 'H') {
      return size.height * value;
    } else {
      return size.width * value;
    }
  }

  static Future<void> launchInBrowser(String url) async {
    final Uri urlLaunch = Uri.parse(url);

    if (!await launchUrl(
      urlLaunch,
      mode: LaunchMode.externalApplication,
    )) {
      throw 'Could not launch $urlLaunch';
    }
  }

  static scrollToSection(BuildContext context) {
    Scrollable.ensureVisible(
      context,
      duration: const Duration(milliseconds: 600),
    );
  }
}
