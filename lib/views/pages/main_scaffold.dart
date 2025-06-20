import 'package:flutter/material.dart';
import '../widgets/custom_bottom_nav_bar.dart';
import '../data/notifiers.dart';
import 'home.dart';
import 'mis_vuelos.dart';
import 'perfil.dart';

class MainScaffold extends StatefulWidget {
  static const String routeName = '/main';
  const MainScaffold({super.key});

  @override
  State<MainScaffold> createState() => _MainScaffoldState();
}

class _MainScaffoldState extends State<MainScaffold> {
  final List<Widget> pages = const [
    MyHomePage(),
    MisVuelosPage(),
    PerfilPage(),
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: AnimatedBuilder(
        animation: pageNotifier,
        builder: (context, child) => pages[pageNotifier.selectedPage],
      ),
      bottomNavigationBar: AnimatedBuilder(
        animation: pageNotifier,
        builder: (context, child) => CustomBottomNavBar(
          currentIndex: pageNotifier.selectedPage,
          onTap: (index) => pageNotifier.setPage(index),
        ),
      ),
    );
  }
} 