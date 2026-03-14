import 'package:flutter/material.dart';
import 'package:task_4/core/features/logchoice/custom_button.dart';
import 'package:task_4/core/features/loginscreen/custom_textfield.dart';
import 'package:task_4/core/screens/loginscreen.dart';

class Forgotpassword extends StatefulWidget {
  const Forgotpassword({super.key});

  @override
  State<Forgotpassword> createState() => _ForgotpasswordState();
}

class _ForgotpasswordState extends State<Forgotpassword> {
  final TextEditingController _passController = TextEditingController();
  final TextEditingController _passConfirmController = TextEditingController();

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
                      'اعادة تعيين كلمة المرور',
                      style: TextStyle(
                        color: Colors.white,
                        fontWeight: FontWeight.w900,
                        fontSize: 24,
                      ),
                    ),
                    SizedBox(height: 25),
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
                    const SizedBox(height: 20),
                    CustomTextField(
                      controller: _passConfirmController,
                      labelText: 'تأكيد كلمة المرور',
                      prefixIcon: Icons.lock_person_outlined,
                      suffixIcon: Icons.visibility_outlined,
                      suffixOnPressed: () => () {},
                      iconColor: Colors.blueAccent,
                      labelColor: Colors.grey,
                      fontSize: 16,
                    ),
                    SizedBox(height: 30),
                    SizedBox(
                      width: 300,
                      child: CustomButton(
                        text: "تأكيد",
                        onPressed: () {
                          String pn = _passController.text.trim();
                          if (pn.isNotEmpty) {
                            Navigator.push(
                              context,
                              MaterialPageRoute(builder: (_) => Loginscreen()),
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
