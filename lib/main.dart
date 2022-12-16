import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

import 'app/main_app.dart';
import 'core/utils/constants.dart';

Future<void> main() async {
  SystemChrome.setSystemUIOverlayStyle(
    const SystemUiOverlayStyle(
      statusBarColor: Constants.transparent,
      statusBarIconBrightness: Brightness.dark,
      statusBarBrightness: Brightness.light,
    ),
  );

  runApp(const MainApp());
}