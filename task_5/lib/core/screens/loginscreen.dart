import 'package:flutter/material.dart';
import 'package:task_5/core/features/logchoice/custom_button.dart';
import 'package:task_5/core/screens/homescreen.dart';

class Loginscreen extends StatefulWidget {
  const Loginscreen({super.key});

  @override
  // ignore: library_private_types_in_public_api
  _LoginscreenState createState() => _LoginscreenState();
}

class _LoginscreenState extends State<Loginscreen> {
  final TextEditingController _phoneController = TextEditingController();
  final TextEditingController _passController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Stack(
        children: [
          Align(
            alignment: Alignment.topCenter,
            child: SizedBox(
              child: Image.asset(
                'assets/images/logowbg.jpg',
                fit: BoxFit.contain,
              ),
            ),
          ),

          Align(
            alignment: Alignment.bottomCenter,
            child: Container(
              height: 520,
              width: double.infinity,
              decoration: BoxDecoration(
                color: Colors.blueAccent,
                borderRadius: const BorderRadius.only(
                  topLeft: Radius.circular(30),
                  topRight: Radius.circular(30),
                ),
                boxShadow: [BoxShadow(color: Colors.black26, blurRadius: 10)],
              ),
              child: Padding(
                padding: const EdgeInsets.symmetric(vertical: 20.0),
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.start,
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: [
                    Text(
                      'اهلا بك نحن سعداء بعودتك',
                      style: TextStyle(
                        color: Colors.white,
                        fontWeight: FontWeight.w900,
                        fontSize: 24,
                      ),
                    ),
                    SizedBox(height: 5),
                    Text(
                      'من فضلك قم بتسجيل الدخول',
                      style: TextStyle(
                        color: Colors.white,
                        fontWeight: FontWeight.w500,
                        fontSize: 25,
                      ),
                    ),
                    SizedBox(height: 20),
                    Padding(
                      padding: const EdgeInsets.symmetric(
                        horizontal: 25.0,
                        vertical: 12,
                      ),
                      child: Container(
                        padding: EdgeInsets.all(8),
                        decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(12),
                          color: Colors.white,
                        ),
                        child: Directionality(
                          textDirection: TextDirection.rtl,
                          child: TextField(
                            textAlign: TextAlign.right,
                            controller: _phoneController,
                            decoration: InputDecoration(
                              prefixIcon: Icon(
                                Icons.person_4_outlined,
                                color: Colors.blueAccent,
                              ),
                              labelText: 'رقم الهاتف',
                              border: InputBorder.none,
                              labelStyle: TextStyle(
                                color: Colors.grey,
                                fontSize: 16,
                              ),
                            ),
                          ),
                        ),
                      ),
                    ),
                    const SizedBox(height: 20),
                    Padding(
                      padding: const EdgeInsets.symmetric(horizontal: 25.0),
                      child: Container(
                        padding: EdgeInsets.all(8),
                        decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(12),
                          color: Colors.white,
                        ),
                        child: Directionality(
                          textDirection: TextDirection.rtl,
                          child: TextField(
                            textAlign: TextAlign.right,
                            controller: _phoneController,
                            decoration: InputDecoration(
                              prefixIcon: Icon(
                                Icons.lock_person_outlined,
                                color: Colors.blueAccent,
                              ),
                              suffixIcon: IconButton(
                                icon: Icon(
                                  Icons.visibility_off_outlined,
                                  color: Colors.blueAccent,
                                ),
                                onPressed: () {
                                  // Toggle password visibility
                                },
                              ),
                              labelText: 'كلمة المرور',
                              border: InputBorder.none,
                              labelStyle: TextStyle(
                                color: Colors.grey,
                                fontSize: 16,
                              ),
                            ),
                          ),
                        ),
                      ),
                    ),
                    SizedBox(height: 30),
                    SizedBox(
                      width: 300,
                      child: CustomButton(
                        text: "تسجيل الدخول",
                        onPressed: () {
                          String pn = _passController.text.trim();
                          if (pn.isNotEmpty) {
                            Navigator.push(
                              context,
                              MaterialPageRoute(builder: (_) => Homescreen()),
                            );
                          } else {}
                        },
                      ),
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
