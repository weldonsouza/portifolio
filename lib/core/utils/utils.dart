import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import 'package:url_launcher/url_launcher.dart';

import '../../data/datasources/local/i18n/project_details.i18n.dart';

var formatFraction = NumberFormat("#,##0.00", "pt_BR");

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

  static String formatDate(input) {
    if (input.isEmpty) {
      return labelUntilMoment.i18n;
    } else {
      List date = input.split('/');

      return DateFormat('MMM yyyy').format(DateFormat('yyyy-MM-dd').parse('${date[2]}-${date[1]}-${date[0]}'));
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
}
