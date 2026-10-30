import 'package:flutter/material.dart';

class ProfilePage extends StatelessWidget {
  const ProfilePage({super.key});

  @override
  Widget build(BuildContext context) {
    const Color fondoApp = Color(0xFF0A0E1A);
    const Color superficieCard = Color(0xFF131C31);
    const Color acentoPrimario = Color(0xFF38BDF8);
    const Color acentoVioleta = Color(0xFF818CF8);
    const Color textoPrincipal = Color(0xFFF1F5F9);
    const Color textoSecundario = Color(0xFF94A3B8);

    return Scaffold(
      backgroundColor: fondoApp,
      appBar: AppBar(
        title: const Text('Mi Perfil'),
        backgroundColor: superficieCard,
        foregroundColor: textoPrincipal,
        elevation: 0,
      ),
      body: Center(
        child: SingleChildScrollView(
          padding: const EdgeInsets.all(24.0),
          child: ConstrainedBox(
            constraints: const BoxConstraints(maxWidth: 420.0),
            child: Card(
              color: superficieCard,
              elevation: 8.0,
              shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(16.0),
                side: const BorderSide(color: Color(0xFF1E293B)),
              ),
              child: Padding(
                padding: const EdgeInsets.symmetric(horizontal: 24.0, vertical: 32.0),
                child: Column(
                  mainAxisSize: MainAxisSize.min,
                  children: [
                    const CircleAvatar(
                      radius: 48.0,
                      backgroundColor: acentoVioleta,
                      child: Icon(Icons.person, size: 54.0, color: Colors.white),
                    ),
                    const SizedBox(height: 16.0),
                    const Text(
                      'Valery Vergara',
                      style: TextStyle(
                        fontSize: 20.0,
                        fontWeight: FontWeight.bold,
                        color: textoPrincipal,
                      ),
                    ),
                    const SizedBox(height: 4.0),
                    const Text(
                      'valery@ejemplo.com',
                      style: TextStyle(fontSize: 14.0, color: textoSecundario),
                    ),
                    const SizedBox(height: 24.0),
                    const Divider(color: Color(0xFF1E293B)),
                    const SizedBox(height: 12.0),
                    ListTile(
                      leading: const Icon(Icons.badge_outlined, color: acentoPrimario),
                      title: const Text('Rol', style: TextStyle(color: textoSecundario, fontSize: 13.0)),
                      subtitle: const Text('Desarrollador de Software', style: TextStyle(color: textoPrincipal, fontSize: 15.0)),
                    ),
                    ListTile(
                      leading: const Icon(Icons.security_outlined, color: acentoPrimario),
                      title: const Text('Estado de cuenta', style: TextStyle(color: textoSecundario, fontSize: 13.0)),
                      subtitle: const Text('Activo / Verificado', style: TextStyle(color: Color(0xFF34D399), fontSize: 15.0)),
                    ),
                    const SizedBox(height: 20.0),
                    SizedBox(
                      width: double.infinity,
                      height: 44.0,
                      child: OutlinedButton.icon(
                        style: OutlinedButton.styleFrom(
                          foregroundColor: const Color(0xFFF87171),
                          side: const BorderSide(color: Color(0xFFF87171)),
                          shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(8.0),
                          ),
                        ),
                        onPressed: () {
                          Navigator.pushNamedAndRemoveUntil(context, '/login', (route) => false);
                        },
                        icon: const Icon(Icons.logout, size: 18.0),
                        label: const Text('Cerrar Sesión'),
                      ),
                    ),
                  ],
                ),
              ),
            ),
          ),
        ),
      ),
    );
  }
}