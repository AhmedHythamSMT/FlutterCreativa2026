import 'package:flutter/material.dart';
import 'package:task_5/core/routes/routes.dart';
import 'package:task_5/core/screens/editprofile.dart';
import 'package:task_5/core/screens/homescreen.dart';
import 'package:task_5/core/screens/loginscreen.dart';
import 'package:task_5/core/screens/profilescreen.dart';
import 'package:task_5/core/screens/logchoice.dart';
import 'package:task_5/core/screens/signup.dart';
import 'package:task_5/core/screens/splash.dart';

class AppRoutes {
  static Route<dynamic> generateRoute(RouteSettings settings) {
    switch (settings.name) {
      case Routes.splashscreen:
        return MaterialPageRoute(builder: (_) => const SplashScreen());
      case Routes.logChoice:
        return MaterialPageRoute(builder: (_) => const LogChoice());
      case Routes.login:
        return MaterialPageRoute(builder: (_) => const Loginscreen());
      case Routes.signup:
        return MaterialPageRoute(builder: (_) => const Signup());
      case Routes.home:
        return MaterialPageRoute(builder: (_) => const Homescreen());
      case Routes.profile:
        final args = settings.arguments as Map<String, dynamic>?;
        String? name = args != null ? args['name'] as String? : null;
        return MaterialPageRoute(
          builder: (_) => Profilescreen(name: name ?? "Guest"),
        );
      case Routes.editProfile:
        return MaterialPageRoute(builder: (_) => const Editprofile());

      default:
        return MaterialPageRoute(
          builder: (_) => Scaffold(
            body: Center(child: Text('No route defined for ${settings.name}')),
          ),
        );
    }
  }
}
