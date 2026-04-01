import 'package:flutter/material.dart';
import 'package:task_6_node_firebase/core/features/auth/ui/screens/home_screen.dart';
import 'package:task_6_node_firebase/core/features/auth/ui/screens/login_screen.dart';
import 'package:task_6_node_firebase/core/features/auth/ui/screens/register_screen.dart';

class AppRoutes {
  static const String login = '/login';
  static const String register = '/register';
  static const String home = '/home';

  static Route<dynamic> generateRoute(RouteSettings settings) {
    switch (settings.name) {
      case login:
        return MaterialPageRoute(builder: (_) => const LoginScreen());
      case register:
        return MaterialPageRoute(builder: (_) => const RegisterScreen());
      case home:
        return MaterialPageRoute(builder: (_) => const HomeScreen());
      default:
        return MaterialPageRoute(
          builder: (_) => Scaffold(
            body: Center(child: Text('No route defined for ${settings.name}')),
          ),
        );
    }
  }
}
