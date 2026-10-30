import 'package:flutter/material.dart';

class RegisterPage extends StatefulWidget {
  const RegisterPage({super.key});

  @override
  State<RegisterPage> createState() => _RegisterPageState();
}

class _RegisterPageState extends State<RegisterPage> {
  final nombre = TextEditingController();
  final correo = TextEditingController();
  final clave = TextEditingController();
  final confirmar = TextEditingController();

  void mensaje(String texto) {
    ScaffoldMessenger.of(context).showSnackBar(SnackBar(content: Text(texto)));
  }

  void registrar() {
    if (nombre.text.isEmpty || correo.text.isEmpty || clave.text.isEmpty) {
      mensaje('Llena todos los campos');
    } else if (!correo.text.contains('@')) {
      mensaje('El correo no es válido');
    } else if (clave.text != confirmar.text) {
      mensaje('Las contraseñas no coinciden');
    } else {
      mensaje('¡Registro exitoso!');
      Navigator.pushReplacementNamed(context, '/login');
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        width: double.infinity,
        height: double.infinity,
        decoration: const BoxDecoration(
          image: DecorationImage(
            image: AssetImage('assets/img1.jpg'),
            fit: BoxFit.cover,
          ),
        ),
        child: Center(
          child: SingleChildScrollView(
            child: Container(
              width: 350,
              padding: const EdgeInsets.all(24),
              decoration: BoxDecoration(
                color: const Color(0xCC0A1A4A),
                borderRadius: BorderRadius.circular(20),
                border: Border.all(color: const Color(0xFF22D3EE)),
              ),
              child: Column(
                mainAxisSize: MainAxisSize.min,
                children: [
                  const Text(
                    'Crear Cuenta',
                    style: TextStyle(
                      fontSize: 26,
                      fontWeight: FontWeight.bold,
                      color: Colors.white,
                    ),
                  ),
                  const SizedBox(height: 20),
                  TextField(
                    controller: nombre,
                    style: const TextStyle(color: Colors.white),
                    decoration: const InputDecoration(
                      labelText: 'Nombre completo',
                      labelStyle: TextStyle(color: Colors.white70),
                      border: OutlineInputBorder(),
                      enabledBorder: OutlineInputBorder(
                        borderSide: BorderSide(color: Color(0xFF22D3EE)),
                      ),
                    ),
                  ),
                  const SizedBox(height: 15),
                  TextField(
                    controller: correo,
                    style: const TextStyle(color: Colors.white),
                    decoration: const InputDecoration(
                      labelText: 'Correo electrónico',
                      labelStyle: TextStyle(color: Colors.white70),
                      border: OutlineInputBorder(),
                      enabledBorder: OutlineInputBorder(
                        borderSide: BorderSide(color: Color(0xFF22D3EE)),
                      ),
                    ),
                  ),
                  const SizedBox(height: 15),
                  TextField(
                    controller: clave,
                    obscureText: true,
                    style: const TextStyle(color: Colors.white),
                    decoration: const InputDecoration(
                      labelText: 'Contraseña',
                      labelStyle: TextStyle(color: Colors.white70),
                      border: OutlineInputBorder(),
                      enabledBorder: OutlineInputBorder(
                        borderSide: BorderSide(color: Color(0xFF22D3EE)),
                      ),
                    ),
                  ),
                  const SizedBox(height: 15),
                  TextField(
                    controller: confirmar,
                    obscureText: true,
                    style: const TextStyle(color: Colors.white),
                    decoration: const InputDecoration(
                      labelText: 'Confirmar contraseña',
                      labelStyle: TextStyle(color: Colors.white70),
                      border: OutlineInputBorder(),
                      enabledBorder: OutlineInputBorder(
                        borderSide: BorderSide(color: Color(0xFF22D3EE)),
                      ),
                    ),
                  ),
                  const SizedBox(height: 20),
                  ElevatedButton(
                    onPressed: registrar,
                    style: ElevatedButton.styleFrom(
                      backgroundColor: const Color(0xFF7C3AED),
                      foregroundColor: Colors.white,
                    ),
                    child: const Text('Registrarme'),
                  ),
                  TextButton(
                    onPressed: () {
                      Navigator.pushReplacementNamed(context, '/login');
                    },
                    child: const Text(
                      '¿Ya tienes cuenta? Inicia sesión',
                      style: TextStyle(color: Color(0xFF22D3EE)),
                    ),
                  ),
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }
}