import 'package:aerofly/views/widgets/custom_app_bar.dart';
import 'package:flutter/material.dart';

class MisVuelosPage extends StatelessWidget {
  static const String routeName = '/mis-vuelos';
  const MisVuelosPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: const CustomAppBar(),
      body: const Center(
        child: Text('Aquí se mostrarán tus vuelos.'),
      ),
    );
  }
} 