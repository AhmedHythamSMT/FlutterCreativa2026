import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:task_6_node_firebase/core/features/auth/data/models/user_data_class.dart';
import 'package:task_6_node_firebase/core/features/auth/data/services/firebase_auth_services.dart';
import 'package:task_6_node_firebase/core/features/auth/ui/screens/home_screen.dart';
import 'package:task_6_node_firebase/core/features/auth/ui/widgets/custom_auth_button.dart';
import 'package:task_6_node_firebase/core/features/auth/ui/widgets/custom_social_button.dart';
import 'package:task_6_node_firebase/core/features/auth/ui/widgets/custom_textfield.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:task_6_node_firebase/core/routes/app_routes.dart';
import 'package:task_6_node_firebase/firebase/firebase_firestore.dart';
import 'login_screen.dart';

class RegisterScreen extends StatefulWidget {
  const RegisterScreen({super.key});

  @override
  State<RegisterScreen> createState() => _RegisterScreenState();
}

class _RegisterScreenState extends State<RegisterScreen> {
  final TextEditingController _emailController = TextEditingController();
  final TextEditingController _passwordController = TextEditingController();
  final TextEditingController _usernameController = TextEditingController();

  UserDataClass get _registerData => UserDataClass(
    email: _emailController.text.trim(),
    password: _passwordController.text.trim(),
    username: _usernameController.text.trim(),
  );

  final FirebaseFirestore firestore = FirebaseFirestore.instance;
  bool _isLoading = false;
  bool _isRegisterLoading = false;
  bool _isGoogleLoading = false;

  void _onGoogleSignInPressed() async {
    setState(() => _isGoogleLoading = true);

    String? result = await FirebaseAuthServices.signInWithGoogle();

    if (!mounted) return;
    setState(() => _isLoading = false);

    if (result == "Success") {
      Navigator.pushReplacementNamed(context, AppRoutes.home);
    } else if (result == "تم إلغاء عملية الدخول") {
      return;
    } else {
      _showSnackBar(result ?? "حدث خطأ ما");
    }
  }

  void _onRegisterButtonPressed() async {
    if (_emailController.text.isEmpty ||
        _passwordController.text.isEmpty ||
        _usernameController.text.isEmpty) {
      _showSnackBar("يرجى ملء جميع الحقول");
      return;
    }

    setState(() => _isLoading = true);
    String? result = await FirebaseAuthServices.signUp(_registerData);

    if (result == "Success") {
      try {
        final user = FirebaseAuth.instance.currentUser;
        if (user != null) {
          await FirebaseFirestoreServices.createUser(
            user,
            _usernameController.text.trim(),
          );
        }

        _showSnackBar("تم إنشاء الحساب بنجاح!", isError: false);

        if (!mounted) return;
        Navigator.pushReplacement(
          context,
          MaterialPageRoute(builder: (context) => const LoginScreen()),
        );
      } catch (e) {
        _showSnackBar("تم إنشاء الحساب لكن فشل حفظ البيانات: $e");
      }
    } else {
      _showSnackBar(result ?? "حدث خطأ ما");
    }

    if (mounted) setState(() => _isLoading = false);
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
    final size = MediaQuery.of(context).size;
    return Scaffold(
      body: Center(
        child: SingleChildScrollView(
          padding: EdgeInsets.symmetric(horizontal: size.width * 0.08),
          child: Column(
            children: [
              const Icon(
                Icons.person_add_alt_1,
                size: 80,
                color: Colors.greenAccent,
              ),
              const SizedBox(height: 20),
              const Text(
                "إنشاء حساب جديد",
                style: TextStyle(fontSize: 24, fontWeight: FontWeight.bold),
              ),
              const SizedBox(height: 30),
              CustomTextfield(
                controller: _usernameController,
                label: "اسم المستخدم",
                icon: Icons.person_outline,
              ),
              const SizedBox(height: 15),
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
                text: "تسجيل حساب جديد",
                isLoading: _isRegisterLoading,
                onPressed: _onRegisterButtonPressed,
              ),
              const SizedBox(height: 15),
              const Text("أو بواسطة", style: TextStyle(color: Colors.grey)),
              const SizedBox(height: 15),

              SocialAuthButton(
                onPressed: _onGoogleSignInPressed,
                text: "تسجيل الدخول عبر جوجل",
                isLoading: _isGoogleLoading,
              ),

              const SizedBox(height: 10),
              TextButton(
                onPressed: () => Navigator.pushReplacement(
                  context,
                  MaterialPageRoute(builder: (_) => const LoginScreen()),
                ),
                child: const Text(
                  "لديك حساب بالفعل؟ سجل دخولك",
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
    _usernameController.dispose();
    super.dispose();
  }
}
