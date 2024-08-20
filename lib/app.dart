import 'package:flutter/material.dart';
import 'package:flutter_localizations/flutter_localizations.dart';
import 'package:todo/core/theme/theme_data.dart';
import 'package:todo/generated/l10n.dart';
import 'package:todo/router/app_routes.dart';
import 'package:todo/router/name_routes.dart';

class App extends StatelessWidget {
  const App({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      navigatorKey: rootNavigatorKey,
      initialRoute: Routes.initial,
      onGenerateRoute: AppRoutes.onGenerateRoute,
      themeMode: ThemeMode.light,
      theme: lightTheme,
      locale: const Locale("en"),
      supportedLocales: AppLocalization.delegate.supportedLocales,
      localizationsDelegates: const [
        AppLocalization.delegate,
        GlobalCupertinoLocalizations.delegate,
        GlobalMaterialLocalizations.delegate,
        GlobalWidgetsLocalizations.delegate,
      ],
    );
  }
}
