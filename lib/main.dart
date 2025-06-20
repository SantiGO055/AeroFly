import 'package:aerofly/views/pages/splash_screen.dart';
import 'package:flutter/material.dart';
import 'routes.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      initialRoute: SplashScreen.routeName,
      routes: appRoutes,
      theme: ThemeData(
        colorScheme: ColorScheme.fromSeed(
          seedColor: const Color(0xFF88C7EF),
          primary: const Color(0xFF88C7EF),
          secondary: const Color(0xFFFFB74D),
        ),
        useMaterial3: true,
      ),
    );
  }
}
