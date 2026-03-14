import 'package:flutter/material.dart';
import 'package:task_4/core/routes/routes.dart';
import 'package:task_4/core/routes/screens/editrpofile.dart';
import 'package:task_4/core/routes/screens/homescreen.dart';
import 'package:task_4/core/routes/screens/profilescreen.dart';

class AppRoutes {
  static Route<dynamic> generateRoute(RouteSettings settings) {
    switch (settings.name) {
      case Routes.home:
        return MaterialPageRoute(builder: (_) => const Homescreen());
      case Routes.profile:
        final args = settings.arguments as Map<String, dynamic>?;
        String? name = args != null ? args['name'] as String? : null;
        return MaterialPageRoute(
          builder: (_) => Profilescreen(name: name ?? "Guest"),
        );
      case Routes.editProfile:
        return MaterialPageRoute(builder: (_) => const Editrpofile());
      default:
        return MaterialPageRoute(
          builder: (_) => Scaffold(
            body: Center(child: Text('No route defined for ${settings.name}')),
          ),
        );
    }
  }
}
