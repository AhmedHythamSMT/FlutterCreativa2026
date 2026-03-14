import 'package:flutter/material.dart';
import 'package:task_4/core/features/custom_navbar/custom_navbar.dart';
import 'package:task_4/core/features/logchoice/custom_button.dart';
import 'package:task_4/core/features/loginscreen/custom_textfield.dart';
import 'package:task_4/core/screens/homescreen.dart';

class Signup extends StatefulWidget {
  const Signup({super.key});

  @override
  State<Signup> createState() => _SignupState();
}

class _SignupState extends State<Signup> {
  int _currentIndex = 0;
  final TextEditingController _nameController = TextEditingController();
  final TextEditingController _emailController = TextEditingController();
  final TextEditingController _phoneController = TextEditingController();
  final TextEditingController _passController = TextEditingController();
  bool _isChecked = false;

  void _onTabTapped(int index) {
    setState(() => _currentIndex = index);
  }

  @override
  Widget build(BuildContext context) {
    final double screenHeight = MediaQuery.of(context).size.height;
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
            child: Container(
              width: double.infinity,
              constraints: BoxConstraints(maxHeight: screenHeight * 0.75),
              decoration: const BoxDecoration(
                color: Colors.blueAccent,
                borderRadius: BorderRadius.only(
                  topLeft: Radius.circular(40),
                  topRight: Radius.circular(40),
                ),
              ),
              child: SingleChildScrollView(
                physics: const BouncingScrollPhysics(),
                padding: EdgeInsets.only(
                  top: 30,
                  left: screenWidth * 0.04,
                  right: screenWidth * 0.04,
                  bottom: 30,
                ),
                child: Column(
                  children: [
                    CustomTextField(
                      controller: _nameController,
                      labelText: 'الاسم بالكامل',
                      prefixIcon: Icons.person_4_outlined,
                      suffixOnPressed: () => () {},
                      iconColor: Colors.deepPurple,
                      labelColor: Colors.grey,
                      fontSize: 16,
                    ),
                    const SizedBox(height: 15),
                    CustomTextField(
                      controller: _emailController,
                      labelText: 'البريد الإلكتروني',
                      prefixIcon: Icons.lock_person_outlined,
                      suffixOnPressed: () => () {},
                      iconColor: Colors.deepPurple,
                      labelColor: Colors.grey,
                      fontSize: 16,
                    ),
                    const SizedBox(height: 15),
                    CustomTextField(
                      controller: _phoneController,
                      labelText: 'رقم الموبايل مع رمز الدولة بدون (+)',
                      prefixIcon: Icons.phone_in_talk_outlined,
                      iconColor: Colors.deepPurple,
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
                      iconColor: Colors.deepPurple,
                      labelColor: Colors.grey,
                      fontSize: 16,
                    ),
                    const SizedBox(height: 10),

                    Directionality(
                      textDirection: TextDirection.rtl,
                      child: Padding(
                        padding: const EdgeInsets.symmetric(horizontal: 30),
                        child: Row(
                          children: [
                            Checkbox(
                              value: _isChecked,
                              activeColor: Colors.white,
                              checkColor: const Color(0xFF4285F4),
                              onChanged: (value) =>
                                  setState(() => _isChecked = value ?? false),
                            ),
                            Expanded(
                              child: RichText(
                                text: const TextSpan(
                                  text: 'أوافق على ',
                                  style: TextStyle(
                                    color: Color.fromARGB(255, 255, 212, 82),
                                    fontSize: 14,
                                  ),
                                  children: [
                                    TextSpan(
                                      text: 'الشروط والأحكام',
                                      style: TextStyle(
                                        color: Colors.white,
                                        fontWeight: FontWeight.bold,
                                      ),
                                    ),
                                  ],
                                ),
                              ),
                            ),
                          ],
                        ),
                      ),
                    ),

                    const SizedBox(height: 20),

                    SizedBox(
                      width: screenWidth * 0.6,
                      height: 50,
                      child: CustomButton(
                        text: "إنشاء حساب",
                        textColor: Colors.deepPurpleAccent,
                        onPressed: () {
                          if (_isChecked && _nameController.text.isNotEmpty) {
                            Navigator.push(
                              context,
                              MaterialPageRoute(builder: (_) => Homescreen()),
                            );
                          }
                        },
                      ),
                    ),

                    const SizedBox(height: 10),

                    Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      textDirection: TextDirection.rtl,
                      children: [
                        const Text(
                          'لديك حساب؟',
                          style: TextStyle(
                            color: Color.fromARGB(255, 255, 212, 82),
                          ),
                        ),
                        TextButton(
                          onPressed: () => Navigator.pop(context),
                          child: const Text(
                            'تسجيل الدخول',
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
