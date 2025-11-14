import 'package:flutter/material.dart';

class PerfilPantalla extends StatelessWidget {
  // Propiedades finales para recibir los datos
  final String nombre;
  final String email;
  final String color;
  final bool notificaciones;
  final int edad;

  // Constructor que requiere todos los datos
  const PerfilPantalla({
    super.key,
    required this.nombre,
    required this.email,
    required this.color,
    required this.notificaciones,
    required this.edad,
  });

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text('Tu Perfil Creado')),
      body: Padding(
        padding: const EdgeInsets.all(20.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              '¡Perfil creado con éxito!',
              style: Theme.of(context).textTheme.headlineSmall,
            ),
            const SizedBox(height: 10),
            Text('Nombre: $nombre', style: Theme.of(context).textTheme.bodyLarge),
            const SizedBox(height: 10),
            Text('Email: $email', style: Theme.of(context).textTheme.bodyLarge),
            const SizedBox(height: 10),
            Text(
              'Color Favorito: $color',
              style: Theme.of(context).textTheme.bodyLarge,
            ),
            const SizedBox(height: 10),
            Text(
              'Edad: $edad años',
              style: Theme.of(context).textTheme.bodyLarge,
            ),
            const SizedBox(height: 10),
            Text(
              'Recibir Notificaciones: ${notificaciones ? "Sí" : "No"}',
              style: Theme.of(context).textTheme.bodyLarge,
            ),

            ElevatedButton (
              child: const Text('Volver'),
              onPressed: () async{
                 Navigator.pop(context,'Perfil consultado correctamente');
              },
            ),
          ],
        ),
      ),
    );
  }
}
