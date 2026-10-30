import 'package:flutter/material.dart';

class ForgotPasswordPage extends StatefulWidget {
  const ForgotPasswordPage({super.key});

  @override
  State<ForgotPasswordPage> createState() => _ForgotPasswordPageState();
}

class _ForgotPasswordPageState extends State<ForgotPasswordPage> {
  final TextEditingController emailController = TextEditingController();
  final GlobalKey<FormState> formKey = GlobalKey<FormState>();

  @override
  void dispose() {
    emailController.dispose();
    super.dispose();
  }

  void recuperarPassword() {
    if (formKey.currentState!.validate()) {
      ScaffoldMessenger.of(context).showSnackBar(
        SnackBar(
          content: Text('Enlace de recuperación enviado a: ${emailController.text}'),
          backgroundColor: const Color(0xFF10B981),
        ),
      );
      Navigator.pop(context);
    }
  }

  @override
  Widget build(BuildContext context) {
    const Color fondoApp = Color(0xFF0A0E1A);
    const Color superficieCard = Color(0xFF131C31);
    const Color acentoPrimario = Color(0xFF38BDF8);
    const Color textoPrincipal = Color(0xFFF1F5F9);
    const Color textoSecundario = Color(0xFF94A3B8);

    return Scaffold(
      backgroundColor: fondoApp,
      appBar: AppBar(
        title: const Text('Recuperar Contraseña'),
        backgroundColor: superficieCard,
        foregroundColor: textoPrincipal,
        elevation: 0,
      ),
      body: Center(
        child: SingleChildScrollView(
          padding: const EdgeInsets.symmetric(horizontal: 20.0, vertical: 30.0),
          child: ConstrainedBox(
            constraints: const BoxConstraints(maxWidth: 400.0),
            child: Card(
              color: superficieCard,
              elevation: 10.0,
              shadowColor: Colors.black54,
              shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(16.0),
                side: const BorderSide(color: Color(0xFF1E293B)),
              ),
              child: Padding(
                padding: const EdgeInsets.symmetric(horizontal: 28.0, vertical: 36.0),
                child: Form(
                  key: formKey,
                  child: Column(
                    mainAxisSize: MainAxisSize.min,
                    children: [
                      const Icon(Icons.lock_reset, size: 54.0, color: acentoPrimario),
                      const SizedBox(height: 16.0),
                      const Text(
                        '¿Olvidaste tu contraseña?',
                        textAlign: TextAlign.center,
                        style: TextStyle(
                          fontSize: 20.0,
                          fontWeight: FontWeight.bold,
                          color: textoPrincipal,
                        ),
                      ),
                      const SizedBox(height: 8.0),
                      const Text(
                        'Ingresa tu correo para recibir las instrucciones de restablecimiento.',
                        textAlign: TextAlign.center,
                        style: TextStyle(fontSize: 13.0, color: textoSecundario),
                      ),
                      const SizedBox(height: 24.0),
                      TextFormField(
                        controller: emailController,
                        style: const TextStyle(color: textoPrincipal),
                        keyboardType: TextInputType.emailAddress,
                        decoration: InputDecoration(
                          labelText: 'Correo electrónico',
                          labelStyle: const TextStyle(color: textoSecundario),
                          prefixIcon: const Icon(Icons.mail_outline, color: textoSecundario, size: 20.0),
                          enabledBorder: OutlineInputBorder(
                            borderRadius: BorderRadius.circular(8.0),
                            borderSide: const BorderSide(color: Color(0xFF334155)),
                          ),
                          focusedBorder: OutlineInputBorder(
                            borderRadius: BorderRadius.circular(8.0),
                            borderSide: const BorderSide(color: acentoPrimario, width: 1.5),
                          ),
                          filled: true,
                          fillColor: const Color(0xFF0A0E1A),
                        ),
                        validator: (value) {
                          if (value == null || value.trim().isEmpty) {
                            return 'El correo es requerido';
                          }
                          return null;
                        },
                      ),
                      const SizedBox(height: 24.0),
                      SizedBox(
                        width: double.infinity,
                        height: 46.0,
                        child: ElevatedButton(
                          style: ElevatedButton.styleFrom(
                            backgroundColor: const Color(0xFF2563EB),
                            foregroundColor: Colors.white,
                            shape: RoundedRectangleBorder(
                              borderRadius: BorderRadius.circular(8.0),
                            ),
                            elevation: 0,
                          ),
                          onPressed: recuperarPassword,
                          child: const Text('Enviar enlace', style: TextStyle(fontSize: 15.0, fontWeight: FontWeight.w600)),
                        ),
                      ),
                    ],
                  ),
                ),
              ),
            ),
          ),
        ),
      ),
    );
  }
}