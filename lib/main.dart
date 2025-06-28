import 'package:aerofly/views/pages/splash_screen.dart';
import 'package:aerofly/views/pages/main_scaffold.dart';
import 'package:aerofly/views/pages/login_page.dart';
import 'package:flutter/material.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:aerofly/services/auth_service.dart';
import 'package:aerofly/firebase_options.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  
  try {
    print('Initializing Firebase...');
    await Firebase.initializeApp(
      options: DefaultFirebaseOptions.currentPlatform,
    );
    print('Firebase initialized successfully');
  } catch (e) {
    print('Error initializing Firebase: $e');
    // Continuar sin Firebase por ahora
  }
  
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: StreamBuilder<User?>(
        stream: AuthService().authStateChanges,
        builder: (context, snapshot) {
          print('StreamBuilder state: ${snapshot.connectionState}');
          print('StreamBuilder data: ${snapshot.data}');
          print('StreamBuilder error: ${snapshot.error}');
          
          if (snapshot.connectionState == ConnectionState.waiting) {
            print('Showing SplashScreen - waiting for auth state');
            return const SplashScreen();
          }
          
          if (snapshot.hasError) {
            print('Auth error: ${snapshot.error}');
            // En caso de error, mostrar login
            return const LoginPage();
          }
          
          if (snapshot.hasData && snapshot.data != null) {
            print('User authenticated: ${snapshot.data!.email}');
            // Usuario autenticado, ir a la página principal
            return const MainScaffold();
          }
          
          print('User not authenticated, showing LoginPage');
          // Usuario no autenticado, ir al login
          return const LoginPage();
        },
      ),
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
