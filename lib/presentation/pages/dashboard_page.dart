import 'package:flutter/material.dart';
import '../../core/constants/app_colors.dart';
import 'profile_page.dart';

class DashboardPage extends StatefulWidget {
  const DashboardPage({super.key});

  @override
  State<DashboardPage> createState() => _DashboardPageState();
}

class _DashboardPageState extends State<DashboardPage> {
  int _currentIndex = 0;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColors.fondo,
      body: _currentIndex == 0 ? const _DashboardHome() : const ProfilePage(),
      bottomNavigationBar: BottomNavigationBar(
        currentIndex: _currentIndex,
        onTap: (index) => setState(() => _currentIndex = index),
        backgroundColor: AppColors.superficie,
        selectedItemColor: AppColors.cianAcento,
        unselectedItemColor: AppColors.textoGris,
        elevation: 10,
        items: const [
          BottomNavigationBarItem(icon: Icon(Icons.home), label: 'Inicio'),
          BottomNavigationBarItem(icon: Icon(Icons.person), label: 'Perfil'),
        ],
      ),
    );
  }
}

class _DashboardHome extends StatelessWidget {
  const _DashboardHome();

  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      padding: const EdgeInsets.only(bottom: 30),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          // Cabecera superior
          Container(
            width: double.infinity,
            padding: const EdgeInsets.symmetric(horizontal: 24.0, vertical: 24.0),
            decoration: const BoxDecoration(
              color: AppColors.superficie,
              border: Border(bottom: BorderSide(color: AppColors.borde)),
            ),
            child: const Row(
              children: [
                CircleAvatar(
                  radius: 26,
                  backgroundColor: AppColors.violeta,
                  child: Icon(Icons.person, color: Colors.white, size: 30),
                ),
                SizedBox(width: 14),
                Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      'Hola, Valery 👋',
                      style: TextStyle(
                        color: AppColors.textoClaro,
                        fontSize: 18,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                    SizedBox(height: 2),
                    Text(
                      'ID: 404040',
                      style: TextStyle(
                        color: AppColors.textoGris,
                        fontSize: 13,
                      ),
                    ),
                  ],
                ),
              ],
            ),
          ),

          // Cuadrícula con 6 tarjetas
          Padding(
            padding: const EdgeInsets.all(20.0),
            child: Center(
              child: ConstrainedBox(
                constraints: const BoxConstraints(maxWidth: 850),
                child: LayoutBuilder(
                  builder: (context, constraints) {
                    final bool isWide = constraints.maxWidth > 550;
                    return GridView.count(
                      shrinkWrap: true,
                      physics: const NeverScrollableScrollPhysics(),
                      crossAxisCount: isWide ? 2 : 1,
                      mainAxisSpacing: 16,
                      crossAxisSpacing: 16,
                      childAspectRatio: isWide ? 1.7 : 1.5,
                      children: const [
                        _OpcionCard(
                          titulo: 'Datos Personales',
                          icono: Icons.school_outlined,
                          colorIcono: Color(0xFF38BDF8),
                          fondoIcono: Color(0xFF0F2942),
                        ),
                        _OpcionCard(
                          titulo: 'Horario de Clases',
                          icono: Icons.calendar_today_outlined,
                          colorIcono: Color(0xFF34D399),
                          fondoIcono: Color(0xFF063326),
                        ),
                        _OpcionCard(
                          titulo: 'Inscripciones',
                          icono: Icons.copy_outlined,
                          colorIcono: Color(0xFFFBBF24),
                          fondoIcono: Color(0xFF3B2F04),
                        ),
                        _OpcionCard(
                          titulo: 'Plan de Estudio',
                          icono: Icons.menu_book_outlined,
                          colorIcono: Color(0xFF818CF8),
                          fondoIcono: Color(0xFF1E1B4B),
                        ),
                        _OpcionCard(
                          titulo: 'Calificaciones',
                          icono: Icons.grade_outlined,
                          colorIcono: Color(0xFFF472B6),
                          fondoIcono: Color(0xFF37172B),
                        ),
                        _OpcionCard(
                          titulo: 'Certificados',
                          icono: Icons.verified_outlined,
                          colorIcono: Color(0xFF2DD4BF),
                          fondoIcono: Color(0xFF0A2E2B),
                        ),
                      ],
                    );
                  },
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }
}

class _OpcionCard extends StatelessWidget {
  final String titulo;
  final IconData icono;
  final Color colorIcono;
  final Color fondoIcono;

  const _OpcionCard({
    required this.titulo,
    required this.icono,
    required this.colorIcono,
    required this.fondoIcono,
  });

  @override
  Widget build(BuildContext context) {
    return Card(
      color: AppColors.superficie,
      elevation: 4,
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(16),
        side: const BorderSide(color: AppColors.borde),
      ),
      child: InkWell(
        borderRadius: BorderRadius.circular(16),
        onTap: () {
          ScaffoldMessenger.of(context).showSnackBar(
            SnackBar(
              content: Text('Sección: $titulo'),
              backgroundColor: AppColors.superficie,
            ),
          );
        },
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            CircleAvatar(
              radius: 30,
              backgroundColor: fondoIcono,
              child: Icon(icono, color: colorIcono, size: 28),
            ),
            const SizedBox(height: 14),
            Text(
              titulo,
              style: const TextStyle(
                color: AppColors.textoClaro,
                fontSize: 15,
                fontWeight: FontWeight.w600,
              ),
            ),
          ],
        ),
      ),
    );
  }
}