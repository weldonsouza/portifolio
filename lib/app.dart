import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:portifolio/core/theme/app_theme.dart';
import 'package:portifolio/presentation/pages/home_page.dart';
import 'package:portifolio/presentation/providers/menu_provider.dart';
import 'package:portifolio/presentation/providers/scroll_provider.dart';

/// Widget raiz da aplicação com Provider e tema.
class App extends StatelessWidget {
  const App({super.key});

  @override
  Widget build(BuildContext context) {
    return MultiProvider(
      providers: [
        ChangeNotifierProvider(create: (_) => ScrollProvider()),
        ChangeNotifierProvider(create: (_) => MenuProvider()),
      ],
      child: MaterialApp(
        title: 'Weldon Souza | Senior Software Engineer | Flutter Specialist | Mobile Architecture | White Label Architect | Ex-Android Native',
        debugShowCheckedModeBanner: false,
        theme: AppTheme.dark,
        home: const HomePage(),
      ),
    );
  }
}
