import 'package:flutter/material.dart';
import 'package:task_4/core/routes/app_routes.dart';
import 'package:task_4/core/routes/routes.dart';
import 'package:task_4/core/routes/screens/profilescreen.dart';

void main() {
  runApp(const MainApp());
}

class MainApp extends StatelessWidget {
  const MainApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      initialRoute: Routes.home,
      onGenerateRoute: AppRoutes.generateRoute,
    );
  }
}
