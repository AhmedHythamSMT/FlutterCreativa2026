import 'package:flutter/material.dart';

// ignore: must_be_immutable
class CustomTextField5 extends StatelessWidget {
  CustomTextField5({
    super.key,
    required TextEditingController controller,
    required this.labelText,
    this.prefixIcon,
    this.suffixIcon,
    required this.iconColor,
    required this.labelColor,
    required this.fontSize,
    this.suffixOnPressed,
  }) : _controller = controller;

  final TextEditingController _controller;
  final String labelText;
  final IconData? prefixIcon;
  final IconData? suffixIcon;
  final Color iconColor;
  final Color labelColor;
  final double fontSize;
  void Function()? suffixOnPressed;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(20),
      child: Container(
        padding: EdgeInsets.all(1),
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(15),
          color: Colors.white70,
          boxShadow: [
            BoxShadow(
              color: Colors.black12,
              spreadRadius: 1,
              blurRadius: 12,
              blurStyle: .solid,
            ),
          ],
        ),
        child: Directionality(
          textDirection: TextDirection.rtl,
          child: TextField(
            textAlign: TextAlign.right,
            controller: _controller,
            decoration: InputDecoration(
              prefixIcon: Icon(prefixIcon, color: iconColor),
              suffixIcon: IconButton(
                icon: Icon(suffixIcon, color: iconColor),
                onPressed: suffixOnPressed,
              ),
              labelText: labelText,
              border: InputBorder.none,
              labelStyle: TextStyle(color: labelColor, fontSize: fontSize),
            ),
          ),
        ),
      ),
    );
  }
}
