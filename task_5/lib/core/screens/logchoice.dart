import 'package:flutter/material.dart';
import 'package:task_5/core/features/custom_navbar/custom_navbar.dart';
import 'package:task_5/core/features/logchoice/custom_button.dart';
import 'package:task_5/core/screens/loginscreen.dart';
import 'package:task_5/core/screens/signup.dart';

class LogChoice extends StatefulWidget {
  const LogChoice({super.key});

  @override
  // ignore: library_private_types_in_public_api
  _LogChoiceState createState() => _LogChoiceState();
}

class _LogChoiceState extends State<LogChoice> {
  int _currentIndex = 0;

  void _onTabTapped(int index) {
    setState(() {
      _currentIndex = index;
    });
  }

  @override
  Widget build(BuildContext context) {
    // Use MediaQuery to get screen dimensions
    final double screenHeight = MediaQuery.of(context).size.height;
    final double screenWidth = MediaQuery.of(context).size.width;

    return Scaffold(
      // Placing the navbar here automatically handles spacing if you use SafeArea
      bottomNavigationBar: CustomBottomNavBar(
        currentIndex: _currentIndex,
        onTap: _onTabTapped,
      ),
      body: Stack(
        children: [
          // 1. Background Image - Positioned to take top 60% of screen
          Positioned(
            top: 0,
            left: 0,
            right: 0,
            height: screenHeight * 0.6, // Takes 60% of screen height
            child: Image.asset('assets/images/crctr2.jpg', fit: BoxFit.cover),
          ),

          // 2. The Blue Content Area
          Column(
            children: [
              // This pushes the blue container to the bottom
              const Spacer(),
              Container(
                width: double.infinity,
                padding: EdgeInsets.symmetric(
                  horizontal: screenWidth * 0.1, // 10% horizontal padding
                  vertical: 30,
                ),
                decoration: const BoxDecoration(
                  color: Colors.blueAccent,
                  borderRadius: BorderRadius.only(
                    topLeft: Radius.circular(40),
                    topRight: Radius.circular(40),
                  ),
                ),
                child: Column(
                  mainAxisSize: MainAxisSize.min,
                  children: [
                    const Text(
                      'أهلاً بك في مؤسسة المسار',
                      textAlign: TextAlign.center,
                      style: TextStyle(
                        color: Colors.white,
                        fontSize: 22,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                    const Text(
                      'للفئات الخاصة',
                      textAlign: TextAlign.center,
                      style: TextStyle(color: Colors.white, fontSize: 24),
                    ),
                    const SizedBox(height: 30),

                    _buildResponsiveButton("تسجيل الدخول", () {
                      Navigator.push(
                        context,
                        MaterialPageRoute(builder: (_) => Loginscreen()),
                      );
                    }),

                    const SizedBox(height: 15),

                    _buildResponsiveButton("إنشاء حساب", () {
                      Navigator.push(
                        context,
                        MaterialPageRoute(builder: (_) => Signup()),
                      );
                    }),

                    const SizedBox(height: 10),
                  ],
                ),
              ),
            ],
          ),
        ],
      ),
    );
  }

  Widget _buildResponsiveButton(String text, VoidCallback onPressed) {
    return SizedBox(
      width: double.infinity,
      height: 55,
      child: CustomButton(text: text, onPressed: onPressed),
    );
  }
}
