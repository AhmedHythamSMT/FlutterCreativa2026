import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:task_6_node_firebase/core/screens/register_screen.dart';
import 'firebase_options.dart';
// Import your register screen here
// import 'package:task_5/core/screens/register_screen.dart';

void main() async {
  // 1. Fixed: Added parentheses ()
  WidgetsFlutterBinding.ensureInitialized();

  // 2. Initialize Firebase
  await Firebase.initializeApp(options: DefaultFirebaseOptions.currentPlatform);

  runApp(const MainApp());
}

class MainApp extends StatelessWidget {
  const MainApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Flutter Firebase Auth',
      theme: ThemeData(primarySwatch: Colors.blue, useMaterial3: true),
      // 3. Point this to your RegisterScreen class
      home: const RegisterScreen(),
    );
  }
}
