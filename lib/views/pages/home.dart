import 'package:flutter/material.dart';
import '../widgets/custom_app_bar.dart';

class MyHomePage extends StatefulWidget {
  static const String routeName = '/home';
  final String title;
  
  const MyHomePage({super.key, this.title = 'AeroFly'});

  @override
  State<MyHomePage> createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  final _formKey = GlobalKey<FormState>();
  DateTime? _fechaIda;
  DateTime? _fechaVuelta;
  int _pasajeros = 1;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: const CustomAppBar(),
      body: SingleChildScrollView(
        padding: const EdgeInsets.all(16.0),
        child: Form(
          key: _formKey,
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.stretch,
            children: [
              Card(
                elevation: 4,
                child: Padding(
                  padding: const EdgeInsets.all(16.0),
                  child: Column(
                    children: [
                      TextFormField(
                        decoration: const InputDecoration(
                          labelText: 'Desde',
                          prefixIcon: Icon(Icons.flight_takeoff),
                        ),
                        validator: (value) {
                          if (value == null || value.isEmpty) {
                            return 'Por favor ingrese la ciudad de origen';
                          }
                          return null;
                        },
                      ),
                      const SizedBox(height: 16),
                      TextFormField(
                        decoration: const InputDecoration(
                          labelText: 'Hasta',
                          prefixIcon: Icon(Icons.flight_land),
                        ),
                        validator: (value) {
                          if (value == null || value.isEmpty) {
                            return 'Por favor ingrese la ciudad de destino';
                          }
                          return null;
                        },
                      ),
                      const SizedBox(height: 16),
                      Row(
                        children: [
                          Expanded(
                            child: TextButton.icon(
                              onPressed: () async {
                                final fecha = await showDatePicker(
                                  context: context,
                                  initialDate: DateTime.now(),
                                  firstDate: DateTime.now(),
                                  lastDate: DateTime.now().add(const Duration(days: 365)),
                                );
                                if (fecha != null) {
                                  setState(() => _fechaIda = fecha);
                                }
                              },
                              icon: const Icon(Icons.calendar_today),
                              label: Text(_fechaIda == null 
                                ? 'Fecha de ida' 
                                : '${_fechaIda!.day}/${_fechaIda!.month}/${_fechaIda!.year}'),
                            ),
                          ),
                          const SizedBox(width: 16),
                          Expanded(
                            child: TextButton.icon(
                              onPressed: () async {
                                final fecha = await showDatePicker(
                                  context: context,
                                  initialDate: DateTime.now(),
                                  firstDate: DateTime.now(),
                                  lastDate: DateTime.now().add(const Duration(days: 365)),
                                );
                                if (fecha != null) {
                                  setState(() => _fechaVuelta = fecha);
                                }
                              },
                              icon: const Icon(Icons.calendar_today),
                              label: Text(_fechaVuelta == null 
                                ? 'Fecha de vuelta (opcional)' 
                                : '${_fechaVuelta!.day}/${_fechaVuelta!.month}/${_fechaVuelta!.year}'),
                            ),
                          ),
                        ],
                      ),
                      const SizedBox(height: 16),
                      Row(
                        children: [
                          const Icon(Icons.person),
                          const SizedBox(width: 8),
                          const Text('Pasajeros:'),
                          const SizedBox(width: 8),
                          IconButton(
                            icon: const Icon(Icons.remove),
                            onPressed: () {
                              if (_pasajeros > 1) {
                                setState(() => _pasajeros--);
                              }
                            },
                          ),
                          Text('$_pasajeros'),
                          IconButton(
                            icon: const Icon(Icons.add),
                            onPressed: () {
                              setState(() => _pasajeros++);
                            },
                          ),
                        ],
                      ),
                      const SizedBox(height: 24),
                      ElevatedButton(
                        onPressed: () {
                          if (_formKey.currentState!.validate()) {
                            // TODO: Implementar la búsqueda de vuelos
                          }
                        },
                        style: ElevatedButton.styleFrom(
                          minimumSize: const Size(double.infinity, 50),
                        ),
                        child: const Text('Buscar Vuelos'),
                      ),
                    ],
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
} 