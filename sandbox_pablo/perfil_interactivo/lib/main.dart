import 'package:flutter/material.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Perfil Interactivo',
      theme: ThemeData(
        colorScheme: ColorScheme.fromSeed(seedColor: Colors.deepPurple),
      ),
      home: PantallaPrincipal(),
    );
  }
}

class PantallaPrincipal extends StatelessWidget {
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text('Perfil')),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Text('¡Bienvenido a tu perfil interactivo!'),

            ElevatedButton(
              child: Text('Ir al Formulario'),
              onPressed: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(builder: (context) => Formulario()),
                );
              },
            ),
          ],
        ),
      ),
    );
  }
}

// --- 3. Pantalla del Formulario (El Widget con Estado) ---
class Formulario extends StatefulWidget {
  const Formulario({super.key});

  @override
  State<Formulario> createState() => _FormularioCompletoState();
}

class _FormularioCompletoState extends State<Formulario> {
  final _formKey = GlobalKey<FormState>();

  // 2. Variables para guardar los datos de cada campo
  String? _nombreCompleto;
  String? _email;
  String? _colorSeleccionado;
  bool _recibirNotificaciones = false;
  double _edad = 0; // Un valor inicial para el Slider
  bool _aceptaTerminos = false;

  // 3. (Opcional) Lista de colores para el Dropdown
  final List<String> _colores = ['Rojo', 'Verde', 'Azul'];

  // 4. Estado de error para el Checkbox (ya que no tiene validator)
  bool _terminosError = false;

  // --- B. Función de Envío (Submit) ---
  void _submitForm() {
    // 1. Reiniciar el error de los términos
    setState(() {
      _terminosError = false;
    });

    // 2. Validar todos los 'validators' del Form (Email y Color)
    final bool esFormularioValido = _formKey.currentState!.validate();

    // 3. Validar el Checkbox manualmente
    if (!_aceptaTerminos) {
      setState(() {
        _terminosError = true;
      });
    }

    // 4. Comprobar si AMBAS validaciones son correctas
    if (esFormularioValido && _aceptaTerminos) {
      // 5. Si es válido, guarda el estado de los FormFields (el email)
      _formKey.currentState!.save();

      // 6. ¡Navegar a la pantalla de perfil!
      Navigator.push(
        context,
        MaterialPageRoute(
          builder: (context) => PerfilPantalla(
            nombre: _nombreCompleto!,
            email: _email!,
            color: _colorSeleccionado!,
            notificaciones: _recibirNotificaciones,
            edad: _edad.round(), // Redondear la edad a un entero
          ),
        ),
      );
    } else {
      // 7. Si algo falla, mostrar un SnackBar
      ScaffoldMessenger.of(context).showSnackBar(
        const SnackBar(
          content: Text('Por favor, revisa los campos e inténtalo de nuevo.'),
          backgroundColor: Colors.red,
        ),
      );
    }
  }

  // --- C. El Método Build (UI) ---
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text('Completa tu Perfil')),
      // Usamos un Form que usa nuestra _formKey
      body: Form(
        key: _formKey,
        // SingleChildScrollView evita que el teclado tape los campos
        child: SingleChildScrollView(
          padding: const EdgeInsets.symmetric(horizontal: 30.0, vertical: 20.0),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.stretch,
            children: [
              TextFormField(
                decoration: const InputDecoration(labelText: 'Nombre Completo'),
                keyboardType: TextInputType.name,
                validator: (value) {
                  if (value == null || value.isEmpty) {
                    return 'El campo no puede estar vacío';
                  }
                  return null;
                },
                onSaved: (value) {
                  _nombreCompleto = value;
                },
              ),
              // --- 1. Email (TextFormField) ---
              TextFormField(
                decoration: const InputDecoration(
                  labelText: 'Correo Electrónico',
                ),
                keyboardType: TextInputType.emailAddress,
                autovalidateMode: AutovalidateMode.onUserInteraction,
                validator: (value) {
                  if (value == null || value.isEmpty) {
                    return 'El campo no puede estar vacío';
                  }
                  String pattern =
                      r"^[a-zA-Z0-9._%+-]+@[a-zA-Z0-9.-]+\.[a-zA-Z]{2,}$";
                  RegExp regex = RegExp(pattern);
                  if (!regex.hasMatch(value)) {
                    return 'Introduce un formato de email válido';
                  }
                  return null;
                },
                onSaved: (value) {
                  _email = value;
                },
              ),
              const SizedBox(height: 20),

              // --- 2. Color (DropdownButtonFormField) ---
              DropdownButtonFormField<String>(
                decoration: const InputDecoration(labelText: 'Color Favorito'),
                value: _colorSeleccionado,
                items: _colores.map((String color) {
                  return DropdownMenuItem<String>(
                    value: color,
                    child: Text(color),
                  );
                }).toList(),
                onChanged: (newValue) {
                  setState(() {
                    _colorSeleccionado = newValue;
                  });
                },
                validator: (value) =>
                    value == null ? 'Por favor, selecciona un color' : null,
                // No usamos onSaved, _colorSeleccionado se actualiza en onChanged
              ),
              const SizedBox(height: 20),

              // --- 3. Notificaciones (SwitchListTile) ---
              // Usamos SwitchListTile para tener texto y switch en una línea
              SwitchListTile(
                title: const Text('¿Recibir notificaciones?'),
                value: _recibirNotificaciones,
                onChanged: (newValue) {
                  setState(() {
                    _recibirNotificaciones = newValue;
                  });
                },
              ),
              const SizedBox(height: 10),

              // --- 4. Edad (Slider) ---
              Text('Edad: ${_edad.round()}'), // Muestra la edad seleccionada
              Slider(
                value: _edad,
                min: 0.0,
                max: 70.0,
                divisions: 60, // (70 - 10) para que vaya de 1 en 1
                label: _edad.round().toString(),
                onChanged: (newValue) {
                  setState(() {
                    _edad = newValue;
                  });
                },
              ),
              const SizedBox(height: 10),

              // --- 5. Términos (CheckboxListTile) ---
              CheckboxListTile(
                title: const Text('Acepto los términos y condiciones'),
                value: _aceptaTerminos,
                onChanged: (newValue) {
                  setState(() {
                    _aceptaTerminos = newValue!;
                  });
                },
                // Mostramos el error del checkbox manualmente
                subtitle: _terminosError
                    ? const Text(
                        'Debes aceptar los términos para continuar',
                        style: TextStyle(color: Colors.red, fontSize: 12),
                      )
                    : null,
                controlAffinity: ListTileControlAffinity.leading,
              ),
              const SizedBox(height: 30),

              // --- 6. Botón de Envío (ElevatedButton) ---
              ElevatedButton(
                onPressed: _submitForm, // Llama a nuestra función de lógica
                style: ElevatedButton.styleFrom(
                  padding: const EdgeInsets.symmetric(vertical: 16),
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(10),
                  ),
                ),
                child: const Text('Ver Perfil', style: TextStyle(fontSize: 16)),
              ),
            ],
          ),
        ),
      ),
    );
  }
}

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
            const SizedBox(height: 20),
            Text('Nombre: $nombre'),
            const SizedBox(height: 20),
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
