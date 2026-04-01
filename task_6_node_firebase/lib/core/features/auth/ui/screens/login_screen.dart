import 'package:flutter/material.dart';
import 'package:task_6_node_firebase/core/features/auth/data/models/user_data_class.dart';
import 'package:task_6_node_firebase/core/features/auth/data/services/firebase_auth_services.dart';
import 'package:task_6_node_firebase/core/features/auth/ui/screens/home_screen.dart';
import 'package:task_6_node_firebase/core/features/auth/ui/screens/register_screen.dart';
import 'package:task_6_node_firebase/core/features/auth/ui/widgets/custom_auth_button.dart';
import 'package:task_6_node_firebase/core/features/auth/ui/widgets/custom_social_button.dart';
import 'package:task_6_node_firebase/core/features/auth/ui/widgets/custom_textfield.dart';
import 'package:task_6_node_firebase/core/routes/app_routes.dart';

class LoginScreen extends StatefulWidget {
  const LoginScreen({super.key});

  @override
  State<LoginScreen> createState() => _LoginScreenState();
}

class _LoginScreenState extends State<LoginScreen> {
  final TextEditingController _emailController = TextEditingController();
  final TextEditingController _passwordController = TextEditingController();

  bool _isLoading = false;

  UserDataClass get _userData => UserDataClass(
    email: _emailController.text.trim(),
    password: _passwordController.text.trim(),
  );

  void _onGoogleSignInPressed() async {
    setState(() => _isLoading = true);

    String? result = await FirebaseAuthServices.signInWithGoogle();

    if (!mounted) return;
    setState(() => _isLoading = false);

    if (result == "Success") {
      _showSnackBar("تم تسجيل الدخول عبر جوجل بنجاح", isError: false);
      Navigator.pushReplacementNamed(context, AppRoutes.home);
    } else if (result == "تم إلغاء عملية الدخول" ||
        result == "تم إلغاء تسجيل الدخول بواسطة المستخدم") {
      debugPrint("User opted out of login.");
    } else {
      _showSnackBar(result ?? "حدث خطأ ما");
    }
  }

  void _onLoginButtonPressed() async {
    final data = _userData;

    if (data.email.isEmpty || data.password.isEmpty) {
      _showSnackBar("يرجى إدخال البريد وكلمة المرور");
      return;
    }

    setState(() => _isLoading = true);

    String? result = await FirebaseAuthServices.signIn(data);

    if (!mounted) return;
    setState(() => _isLoading = false);

    if (result == "Success") {
      _showSnackBar("تم تسجيل الدخول بنجاح", isError: false);
      Navigator.pushReplacement(
        context,
        MaterialPageRoute(builder: (_) => const HomeScreen()),
      );
    } else {
      _showSnackBar(result ?? "خطأ في تسجيل الدخول");
    }
  }

  void _showSnackBar(String message, {bool isError = true}) {
    ScaffoldMessenger.of(context).showSnackBar(
      SnackBar(
        content: Text(message, textAlign: TextAlign.right),
        backgroundColor: isError ? Colors.redAccent : Colors.green,
        behavior: SnackBarBehavior.floating,
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: SingleChildScrollView(
          padding: const EdgeInsets.symmetric(horizontal: 30),
          child: Column(
            children: [
              const Icon(
                Icons.lock_person_rounded,
                size: 80,
                color: Colors.greenAccent,
              ),
              const SizedBox(height: 20),
              const Text(
                "تسجيل الدخول",
                style: TextStyle(fontSize: 24, fontWeight: FontWeight.bold),
              ),
              const SizedBox(height: 30),
              CustomTextfield(
                controller: _emailController,
                label: "البريد الإلكتروني",
                icon: Icons.email_outlined,
              ),
              const SizedBox(height: 15),
              CustomTextfield(
                controller: _passwordController,
                label: "كلمة المرور",
                icon: Icons.lock_outline,
                isPassword: true,
              ),
              const SizedBox(height: 30),

              CustomAuthButton(
                text: "تسجيل الدخول",
                isLoading: _isLoading,
                onPressed: _onLoginButtonPressed,
              ),

              const SizedBox(height: 15),
              const Text("أو بواسطة", style: TextStyle(color: Colors.grey)),
              const SizedBox(height: 15),

              SocialAuthButton(
                isLoading: _isLoading,
                onPressed: _onGoogleSignInPressed,
                text: "تسجيل الدخول عبر جوجل",
              ),

              const SizedBox(height: 10),
              TextButton(
                onPressed: () => Navigator.pushReplacement(
                  context,
                  MaterialPageRoute(builder: (_) => const RegisterScreen()),
                ),
                child: const Text(
                  "ليس لديك حساب ؟ سجل حساب جديد",
                  style: TextStyle(color: Colors.grey),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }

  @override
  void dispose() {
    _emailController.dispose();
    _passwordController.dispose();
    super.dispose();
  }
}
