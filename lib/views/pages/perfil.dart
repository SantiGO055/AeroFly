import 'package:flutter/material.dart';
import '../data/notifiers.dart';

class PerfilPage extends StatelessWidget {
  static const String routeName = '/perfil';
  const PerfilPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Mi Perfil'),
        backgroundColor: Theme.of(context).colorScheme.primary,
        foregroundColor: Colors.white,
      ),
      body: AnimatedBuilder(
        animation: authNotifier,
        builder: (context, child) => SingleChildScrollView(
          padding: const EdgeInsets.all(16.0),
          child: Column(
            children: [
              // Sección de información del usuario
              Card(
                elevation: 4,
                child: Padding(
                  padding: const EdgeInsets.all(16.0),
                  child: Column(
                    children: [
                      const CircleAvatar(
                        radius: 50,
                        backgroundColor: Colors.grey,
                        child: Icon(
                          Icons.person,
                          size: 50,
                          color: Colors.white,
                        ),
                      ),
                      const SizedBox(height: 16),
                      Text(
                        authNotifier.userName ?? 'Usuario AeroFly',
                        style: const TextStyle(
                          fontSize: 24,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                      const SizedBox(height: 8),
                      Text(
                        authNotifier.userEmail ?? 'usuario@aerofly.com',
                        style: const TextStyle(
                          fontSize: 16,
                          color: Colors.grey,
                        ),
                      ),
                      const SizedBox(height: 16),
                      ElevatedButton(
                        onPressed: () {
                          // TODO: Implementar edición de perfil
                        },
                        child: const Text('Editar Perfil'),
                      ),
                    ],
                  ),
                ),
              ),
              const SizedBox(height: 24),
              
              // Sección de estadísticas
              Card(
                elevation: 4,
                child: Padding(
                  padding: const EdgeInsets.all(16.0),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      const Text(
                        'Mis Estadísticas',
                        style: TextStyle(
                          fontSize: 20,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                      const SizedBox(height: 16),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceAround,
                        children: [
                          _buildStatItem('Vuelos', '12', Icons.flight),
                          _buildStatItem('Destinos', '8', Icons.location_on),
                          _buildStatItem('Millas', '15,420', Icons.star),
                        ],
                      ),
                    ],
                  ),
                ),
              ),
              const SizedBox(height: 24),
              
              // Sección de opciones
              Card(
                elevation: 4,
                child: Column(
                  children: [
                    _buildOptionTile(
                      context,
                      'Configuración',
                      Icons.settings,
                      () {
                        // TODO: Navegar a configuración
                      },
                    ),
                    _buildOptionTile(
                      context,
                      'Notificaciones',
                      Icons.notifications,
                      () {
                        // TODO: Navegar a notificaciones
                      },
                    ),
                    _buildOptionTile(
                      context,
                      'Historial de Vuelos',
                      Icons.history,
                      () {
                        // TODO: Navegar a historial
                      },
                    ),
                    _buildOptionTile(
                      context,
                      'Ayuda y Soporte',
                      Icons.help,
                      () {
                        // TODO: Navegar a ayuda
                      },
                    ),
                    _buildOptionTile(
                      context,
                      'Cerrar Sesión',
                      Icons.logout,
                      () {
                        _showLogoutDialog(context);
                      },
                      isDestructive: true,
                    ),
                  ],
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }

  Widget _buildStatItem(String label, String value, IconData icon) {
    return Column(
      children: [
        Icon(icon, size: 30, color: Colors.blue),
        const SizedBox(height: 8),
        Text(
          value,
          style: const TextStyle(
            fontSize: 20,
            fontWeight: FontWeight.bold,
          ),
        ),
        Text(
          label,
          style: const TextStyle(
            fontSize: 14,
            color: Colors.grey,
          ),
        ),
      ],
    );
  }

  Widget _buildOptionTile(
    BuildContext context,
    String title,
    IconData icon,
    VoidCallback onTap, {
    bool isDestructive = false,
  }) {
    return ListTile(
      leading: Icon(
        icon,
        color: isDestructive ? Colors.red : null,
      ),
      title: Text(
        title,
        style: TextStyle(
          color: isDestructive ? Colors.red : null,
        ),
      ),
      trailing: const Icon(Icons.arrow_forward_ios),
      onTap: onTap,
    );
  }

  void _showLogoutDialog(BuildContext context) {
    showDialog(
      context: context,
      builder: (BuildContext context) {
        return AlertDialog(
          title: const Text('Cerrar Sesión'),
          content: const Text('¿Estás seguro de que quieres cerrar sesión?'),
          actions: [
            TextButton(
              onPressed: () => Navigator.of(context).pop(),
              child: const Text('Cancelar'),
            ),
            TextButton(
              onPressed: () {
                Navigator.of(context).pop();
                authNotifier.logout();
                // TODO: Navegar a la pantalla de login
              },
              child: const Text(
                'Cerrar Sesión',
                style: TextStyle(color: Colors.red),
              ),
            ),
          ],
        );
      },
    );
  }
} 