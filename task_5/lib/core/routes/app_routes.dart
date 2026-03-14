import 'package:flutter/material.dart';
import 'package:task_5/core/routes/routes.dart';
import 'package:task_5/core/screens/forgotpassword.dart';
import 'package:task_5/core/screens/onboarding.dart';
import 'package:task_5/core/screens/logchoice.dart';
import 'package:task_5/core/screens/signup.dart';
import 'package:task_5/core/screens/loginscreen.dart';
import 'package:task_5/core/screens/homescreen.dart';
import 'package:task_5/core/screens/profilescreen.dart';
import 'package:task_5/core/screens/editprofile.dart';
import 'package:task_5/core/screens/task5_screens/homescreen5.dart';
import 'package:task_5/core/screens/task5_screens/orders_screen.dart';

class AppRoutes {
  static Route<dynamic> generateRoute(RouteSettings settings) {
    switch (settings.name) {
      case Routes.splashscreen:
        return MaterialPageRoute(builder: (_) => const OnboardingScreen());
      case Routes.logChoice:
        return MaterialPageRoute(builder: (_) => const LogChoice());
      case Routes.login:
        return MaterialPageRoute(builder: (_) => const Loginscreen());
      case Routes.forgotPassword:
        return MaterialPageRoute(builder: (_) => const Forgotpassword());
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
      // task5 shopping
      case Routes.home5:
        return MaterialPageRoute(builder: (_) => const Homescreen5());
      case Routes.orders:
        return MaterialPageRoute(builder: (_) => const OrdersScreen());

      default:
        return MaterialPageRoute(
          builder: (_) => Scaffold(
            body: Center(child: Text('No route defined for ${settings.name}')),
          ),
        );
    }
  }
}
