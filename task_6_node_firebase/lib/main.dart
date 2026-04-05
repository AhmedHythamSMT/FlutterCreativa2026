import 'package:flutter/material.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:task_6_node_firebase/core/features/home/ui/home_screen.dart';
import 'package:task_6_node_firebase/core/theme/app_theme.dart';
import 'firebase_options.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp(options: DefaultFirebaseOptions.currentPlatform);
  runApp(const MainApp());
}

class MainApp extends StatelessWidget {
  const MainApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      theme: AppTheme.lightTheme,
      darkTheme: AppTheme.darkTheme,
      themeMode: ThemeMode.system,

      // themeMode: switchTheme(),
      home: HomeScreen(isdarktheme: false),

      // initialRoute: FirebaseAuth.instance.currentUser == null
      //     ? AppRoutes.register
      //     : AppRoutes.home,
      // onGenerateRoute: AppRoutes.generateRoute,
    );
  }
}
