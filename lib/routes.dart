import 'package:flutter/material.dart';
import 'views/pages/splash_screen.dart';
import 'views/pages/main_scaffold.dart';

final Map<String, WidgetBuilder> appRoutes = {
  SplashScreen.routeName: (_) => const SplashScreen(),
  MainScaffold.routeName: (_) => const MainScaffold(),
}; 