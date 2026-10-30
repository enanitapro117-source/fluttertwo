import 'package:flutter/material.dart';
import 'presentation/page/splash.dart';
import 'presentation/page/login.dart';
import 'presentation/page/registro.dart';
import 'presentation/page/recuperar.dart';

void main() {
  runApp(const MyAppTwo());
}

class MyAppTwo extends StatelessWidget {
  const MyAppTwo({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'App de prueba',
      debugShowCheckedModeBanner: false,
      initialRoute: '/',
      routes: {
        '/': (context) => const SplashPage(),
        '/login': (context) => const LoginPage(),
        '/registro': (context) => const RegistroPage(),
        '/recuperar': (context) => const RecuperarPage(),
      },
    );
  }
}