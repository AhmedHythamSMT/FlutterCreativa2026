import 'package:flutter/material.dart';
import 'package:task_5/core/routes/app_routes.dart';
import 'package:task_5/core/routes/routes.dart';

void main() {
  runApp(const MainApp());
}

class MainApp extends StatelessWidget {
  const MainApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      initialRoute: Routes.splashscreen,
      onGenerateRoute: AppRoutes.generateRoute,
    );
  }
}
