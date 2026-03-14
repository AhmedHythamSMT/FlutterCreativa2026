import 'package:flutter/material.dart';
import 'package:task_4/core/features/custom_navbar/custom_navbar.dart';
import 'package:task_4/core/features/logchoice/custom_button.dart';
import 'package:task_4/core/features/loginscreen/custom_textfield.dart';
import 'package:task_4/core/screens/forgotpassword.dart';
import 'package:task_4/core/screens/homescreen.dart';
import 'package:task_4/core/screens/signup.dart';

class Loginscreen extends StatefulWidget {
  const Loginscreen({super.key});

  @override
  // ignore: library_private_types_in_public_api
  _LoginscreenState createState() => _LoginscreenState();
}

class _LoginscreenState extends State<Loginscreen> {
  int _currentIndex = 0;
  final TextEditingController _phoneController = TextEditingController();
  final TextEditingController _passController = TextEditingController();

  void _onTabTapped(int index) {
    setState(() => _currentIndex = index);
  }

  @override
  Widget build(BuildContext context) {
    // final double screenHeight = MediaQuery.of(context).size.height;
    final double screenWidth = MediaQuery.of(context).size.width;

    return Scaffold(
      resizeToAvoidBottomInset: true,
      bottomNavigationBar: CustomBottomNavBar(
        currentIndex: _currentIndex,
        onTap: _onTabTapped,
      ),
      body: Stack(
        children: [
          Align(
            alignment: Alignment.topCenter,
            child: Image.asset('assets/images/logowbg.jpg', fit: BoxFit.cover),
          ),

          Align(
            alignment: Alignment.bottomCenter,
            child: SingleChildScrollView(
              child: Container(
                width: double.infinity,
                decoration: const BoxDecoration(
                  color: Colors.blueAccent,
                  borderRadius: BorderRadius.only(
                    topLeft: Radius.circular(40),
                    topRight: Radius.circular(40),
                  ),
                ),
                padding: EdgeInsets.only(
                  top: 30,
                  left: screenWidth * 0.04,
                  right: screenWidth * 0.04,
                  bottom: 40,
                ),
                child: Column(
                  mainAxisSize: MainAxisSize.min,
                  children: [
                    const Text(
                      'أهلاً بك نحن سعداء بعودتك',
                      textAlign: TextAlign.center,
                      style: TextStyle(
                        color: Colors.white,
                        fontWeight: FontWeight.bold,
                        fontSize: 22,
                      ),
                    ),
                    const SizedBox(height: 8),
                    const Text(
                      'من فضلك قم بتسجيل الدخول',
                      textAlign: TextAlign.center,
                      style: TextStyle(
                        color: Colors.white,
                        fontWeight: FontWeight.w400,
                        fontSize: 18,
                      ),
                    ),
                    const SizedBox(height: 30),

                    CustomTextField(
                      controller: _phoneController,
                      labelText: 'رقم الهاتف',
                      prefixIcon: Icons.person_4_outlined,
                      iconColor: Colors.blueAccent,
                      labelColor: Colors.grey,
                      fontSize: 16,
                    ),
                    const SizedBox(height: 15),

                    CustomTextField(
                      controller: _passController,
                      labelText: 'كلمة المرور',
                      prefixIcon: Icons.lock_person_outlined,
                      suffixIcon: Icons.visibility_outlined,
                      suffixOnPressed: () => () {},
                      iconColor: Colors.blueAccent,
                      labelColor: Colors.grey,
                      fontSize: 16,
                    ),

                    Align(
                      alignment: Alignment.centerLeft,
                      child: TextButton(
                        onPressed: () => Navigator.push(
                          context,
                          MaterialPageRoute(
                            builder: (_) => const Forgotpassword(),
                          ),
                        ),
                        child: const Text(
                          'هل نسيت كلمة المرور؟',
                          style: TextStyle(color: Colors.white, fontSize: 14),
                        ),
                      ),
                    ),

                    const SizedBox(height: 20),

                    SizedBox(
                      width: screenWidth * 0.6,
                      height: 50,
                      child: CustomButton(
                        text: "تسجيل الدخول",
                        onPressed: () {
                          if (_phoneController.text.isNotEmpty) {
                            Navigator.push(
                              context,
                              MaterialPageRoute(builder: (_) => Homescreen()),
                            );
                          }
                        },
                      ),
                    ),

                    const SizedBox(height: 8),

                    Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      textDirection: TextDirection.rtl,
                      children: [
                        const Text(
                          'ليس لديك حساب؟',
                          style: TextStyle(
                            color: Colors.black,
                            fontSize: 14,
                            fontWeight: .w900,
                          ),
                        ),
                        TextButton(
                          onPressed: () => Navigator.push(
                            context,
                            MaterialPageRoute(builder: (_) => const Signup()),
                          ),
                          child: const Text(
                            'إنشاء حساب',
                            style: TextStyle(
                              color: Colors.white,
                              fontWeight: FontWeight.bold,
                            ),
                          ),
                        ),
                      ],
                    ),
                  ],
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }
}
