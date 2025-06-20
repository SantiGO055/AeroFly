import 'package:flutter/material.dart';

class MisVuelosPage extends StatelessWidget {
  static const String routeName = '/mis-vuelos';
  const MisVuelosPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Mis Vuelos'),
      ),
      body: const Center(
        child: Text('Aquí se mostrarán tus vuelos.'),
      ),
    );
  }
} 