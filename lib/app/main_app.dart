import 'package:flutter/material.dart';
import 'package:flutter_localizations/flutter_localizations.dart';
import 'package:layout/layout.dart';
import 'package:provider/provider.dart';

import '../core/provider/provider_setup.dart';
import '../core/route/navigation_service.dart';
import '../core/route/routes.dart';
import '../core/utils/app_theme.dart';
import 'pages/home/home_page.dart';

class MainApp extends StatelessWidget {
  const MainApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MultiProvider(
      providers: providers,
      child: Layout(
        child: MaterialApp(
          title: 'Portfolio',
          debugShowCheckedModeBanner: false,
          theme: AppTheme.lightThemeData,
          localizationsDelegates: const [
            GlobalMaterialLocalizations.delegate,
            GlobalWidgetsLocalizations.delegate,
            GlobalCupertinoLocalizations.delegate,
          ],
          supportedLocales: const [
            Locale('pt', "BR"),
            Locale('en', "US"),
            Locale('es', "ES"),
            Locale('fr', "FR"),
          ],
          navigatorKey: NavigationService.navigationKey,
          home: const HomePage(),
          //home: I18n(child: const HomePage()),
          routes: Routes.routes,
        ),
      ),
    );
  }
}
