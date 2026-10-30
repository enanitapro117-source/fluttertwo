import 'package:flutter/material.dart';
import '../pages/splash_page.dart';
import '../pages/login_page.dart';
import '../pages/register_page.dart';
import '../pages/forgot_password_page.dart';
import '../pages/dashboard_page.dart';

class AppRoutes {
  static const String splash = '/';
  static const String login = '/login';
  static const String register = '/register';
  static const String forgotPassword = '/forgot_password';
  static const String dashboard = '/dashboard';

  static Map<String, WidgetBuilder> getRoutes() {
    return {
      splash: (context) => const SplashPage(),
      login: (context) => const LoginPage(),
      register: (context) => const RegisterPage(),
      forgotPassword: (context) => const ForgotPasswordPage(),
      dashboard: (context) => const DashboardPage(),
    };
  }
}