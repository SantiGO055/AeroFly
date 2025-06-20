import 'package:flutter/material.dart';
import '../pages/mis_vuelos.dart';
import '../pages/home.dart';

typedef OnTabCallback = void Function(int);

class CustomBottomNavBar extends StatelessWidget {
  final int currentIndex;
  final OnTabCallback? onTap;
  const CustomBottomNavBar({super.key, required this.currentIndex, this.onTap});

  @override
  Widget build(BuildContext context) {
    return BottomNavigationBar(
      currentIndex: currentIndex,
      onTap: (index) {
        if (onTap != null) {
          onTap!(index);
          return;
        }
        if (index == 0 && currentIndex != 0) {
          Navigator.pushReplacementNamed(context, MyHomePage.routeName);
        } else if (index == 1 && currentIndex != 1) {
          Navigator.pushReplacementNamed(context, MisVuelosPage.routeName);
        } else if (index == 2 && currentIndex != 2) {
          // Aquí podrías navegar a la pantalla de perfil si la creas
        }
      },
      items: const [
        BottomNavigationBarItem(
          icon: Icon(Icons.home),
          label: 'Inicio',
        ),
        BottomNavigationBarItem(
          icon: Icon(Icons.flight),
          label: 'Mis Vuelos',
        ),
        BottomNavigationBarItem(
          icon: Icon(Icons.person),
          label: 'Perfil',
        ),
      ],
    );
  }
} 