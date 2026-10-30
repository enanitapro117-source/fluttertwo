import 'package:flutter/material.dart';
import '../../core/constants/app_colors.dart';
import '../routes/app_routes.dart';

class LoginPage extends StatefulWidget {
  const LoginPage({super.key});

  @override
  State<LoginPage> createState() => _LoginPageState();
}

class _LoginPageState extends State<LoginPage> {
  final TextEditingController emailController = TextEditingController();
  final TextEditingController passwordController = TextEditingController();
  final GlobalKey<FormState> formKey = GlobalKey<FormState>();
  bool obscurePassword = true;
  bool isLoading = false;

  @override
  void dispose() {
    emailController.dispose();
    passwordController.dispose();
    super.dispose();
  }

  void _iniciarSesion() {
    if (formKey.currentState!.validate()) {
      setState(() => isLoading = true);
      Future.delayed(const Duration(seconds: 2), () {
        if (!mounted) return;
        setState(() => isLoading = false);
        Navigator.pushReplacementNamed(context, AppRoutes.dashboard);
      });
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColors.fondo,
      body: Stack(
        fit: StackFit.expand,
        children: [
          Image.asset(
            'assets/img1.jpg',
            fit: BoxFit.cover,
          ),
          Container(
            color: Colors.black.withOpacity(0.4),
          ),
          Center(
            child: SingleChildScrollView(
              padding: const EdgeInsets.symmetric(horizontal: 24.0, vertical: 30.0),
              child: ConstrainedBox(
                constraints: const BoxConstraints(maxWidth: 380.0),
                child: Form(
                  key: formKey,
                  child: Column(
                    mainAxisSize: MainAxisSize.min,
                    children: [
                      const Text(
                        'Iniciar Sesión',
                        style: TextStyle(
                          fontSize: 26.0,
                          fontWeight: FontWeight.bold,
                          color: AppColors.textoClaro,
                          letterSpacing: 0.5,
                        ),
                      ),
                      const SizedBox(height: 32.0),

                      // Campo Correo
                      TextFormField(
                        controller: emailController,
                        keyboardType: TextInputType.emailAddress,
                        style: const TextStyle(color: AppColors.textoClaro),
                        decoration: InputDecoration(
                          hintText: 'Correo electrónico',
                          hintStyle: TextStyle(
                            color: AppColors.textoClaro.withOpacity(0.6),
                            fontSize: 14,
                          ),
                          filled: true,
                          fillColor: const Color(0xFF0F172A).withOpacity(0.6),
                          contentPadding: const EdgeInsets.symmetric(horizontal: 18, vertical: 16),
                          enabledBorder: OutlineInputBorder(
                            borderRadius: BorderRadius.circular(12.0),
                            borderSide: BorderSide(color: AppColors.cianAcento.withOpacity(0.4)),
                          ),
                          focusedBorder: OutlineInputBorder(
                            borderRadius: BorderRadius.circular(12.0),
                            borderSide: const BorderSide(color: AppColors.cianAcento, width: 1.5),
                          ),
                        ),
                        validator: (value) {
                          if (value == null || value.trim().isEmpty) {
                            return 'Ingrese su correo';
                          }
                          return null;
                        },
                      ),
                      const SizedBox(height: 18.0),

                      // Campo Contraseña
                      TextFormField(
                        controller: passwordController,
                        obscureText: obscurePassword,
                        style: const TextStyle(color: AppColors.textoClaro),
                        decoration: InputDecoration(
                          hintText: 'Contraseña',
                          hintStyle: TextStyle(
                            color: AppColors.textoClaro.withOpacity(0.6),
                            fontSize: 14,
                          ),
                          filled: true,
                          fillColor: const Color(0xFF0F172A).withOpacity(0.6),
                          contentPadding: const EdgeInsets.symmetric(horizontal: 18, vertical: 16),
                          suffixIcon: IconButton(
                            icon: Icon(
                              obscurePassword ? Icons.visibility_off_outlined : Icons.visibility_outlined,
                              color: AppColors.textoGris,
                              size: 20,
                            ),
                            onPressed: () => setState(() => obscurePassword = !obscurePassword),
                          ),
                          enabledBorder: OutlineInputBorder(
                            borderRadius: BorderRadius.circular(12.0),
                            borderSide: BorderSide(color: AppColors.cianAcento.withOpacity(0.4)),
                          ),
                          focusedBorder: OutlineInputBorder(
                            borderRadius: BorderRadius.circular(12.0),
                            borderSide: const BorderSide(color: AppColors.cianAcento, width: 1.5),
                          ),
                        ),
                        validator: (value) {
                          if (value == null || value.trim().isEmpty) {
                            return 'Ingrese su contraseña';
                          }
                          return null;
                        },
                      ),
                      const SizedBox(height: 26.0),

                      // Botón Ingresar
                      SizedBox(
                        width: double.infinity,
                        height: 48.0,
                        child: ElevatedButton(
                          style: ElevatedButton.styleFrom(
                            backgroundColor: const Color(0xFF7086FD),
                            foregroundColor: Colors.white,
                            shape: RoundedRectangleBorder(
                              borderRadius: BorderRadius.circular(24.0),
                            ),
                            elevation: 4,
                          ),
                          onPressed: isLoading ? null : _iniciarSesion,
                          child: isLoading
                              ? const SizedBox(
                                  width: 22,
                                  height: 22,
                                  child: CircularProgressIndicator(
                                    color: Colors.white,
                                    strokeWidth: 2.5,
                                  ),
                                )
                              : const Text(
                                  'Ingresar',
                                  style: TextStyle(fontSize: 16.0, fontWeight: FontWeight.bold),
                                ),
                        ),
                      ),
                      const SizedBox(height: 18.0),

                      // Enlaces de texto
                      TextButton(
                        onPressed: () {
                          Navigator.pushNamed(context, AppRoutes.forgotPassword);
                        },
                        child: Text(
                          '¿Olvidaste tu contraseña?',
                          style: TextStyle(
                            color: AppColors.textoClaro.withOpacity(0.85),
                            fontSize: 13.0,
                          ),
                        ),
                      ),
                      TextButton(
                        onPressed: () {
                          Navigator.pushNamed(context, AppRoutes.register);
                        },
                        child: const Text(
                          '¿No tienes cuenta? Regístrate',
                          style: TextStyle(
                            color: AppColors.cianAcento,
                            fontSize: 13.0,
                            fontWeight: FontWeight.w600,
                          ),
                        ),
                      ),
                    ],
                  ),
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }
}