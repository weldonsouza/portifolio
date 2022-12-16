import 'package:flutter/material.dart';
import 'package:flutter_localizations/flutter_localizations.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:i18n_extension/i18n_widget.dart';
import 'package:provider/provider.dart';

import '../core/provider/provider_setup.dart';
import '../core/route/navigation_service.dart';
import '../core/utils/constants.dart';
import 'pages/home/home_page.dart';
import 'pages/project_details/project_details_page.dart';
import 'pages/recommendation_details/recommendation_details_page.dart';
import 'pages/splash/splash_page.dart';

class MainApp extends StatelessWidget {
  const MainApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MultiProvider(
      providers: providers,
      child: MaterialApp(
        title: 'Portfolio',
        debugShowCheckedModeBanner: false,
        theme: ThemeData.dark().copyWith(
          primaryColor: Constants.primaryColor,
          scaffoldBackgroundColor: Constants.bgColor,
          canvasColor: Constants.bgColor,
          textTheme: GoogleFonts.poppinsTextTheme(Theme.of(context).textTheme)
              .apply(bodyColor: Colors.white)
              .copyWith(
            bodyText1: const TextStyle(color: Constants.bodyTextColor),
            bodyText2: const TextStyle(color: Constants.bodyTextColor),
          ),
        ),
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
        home: I18n(
          child: const SplashPage(),
        ),
        routes: {
          SplashPage.routeName: (BuildContext context) => const SplashPage(),
          HomePage.routeName: (BuildContext context) => const HomePage(),
          ProjectDetailsPage.routeName: (BuildContext context) => const ProjectDetailsPage(),
          RecommendationDetailsPage.routeName: (BuildContext context) => const RecommendationDetailsPage(),
        },
      ),
    );
  }
}
