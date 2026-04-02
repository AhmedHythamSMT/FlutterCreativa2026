import 'package:flutter/material.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:task_6_node_firebase/core/features/auth/ui/screens/counter_screen.dart';
import 'firebase/firebase_options.dart';
import 'package:task_6_node_firebase/core/routes/app_routes.dart';

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
      home: CounterScreen(),
      // initialRoute: FirebaseAuth.instance.currentUser == null
      //     ? AppRoutes.register
      //     : AppRoutes.home,

      // onGenerateRoute: AppRoutes.generateRoute,
    );
  }
}
