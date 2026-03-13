import 'package:flutter/material.dart';

// ignore: must_be_immutable
class CustomTextField extends StatelessWidget {
  CustomTextField({
    super.key,
    required TextEditingController controller,
    required this.labelText,
    required this.prefixIcon,
    this.suffixIcon,
    required this.iconColor,
    required this.labelColor,
    required this.fontSize,
    this.suffixOnPressed,
  }) : _controller = controller;

  final TextEditingController _controller;
  final String labelText;
  final IconData prefixIcon;
  final IconData? suffixIcon;
  final Color iconColor;
  final Color labelColor;
  final double fontSize;
  void Function()? suffixOnPressed;

  @override
  Widget build(BuildContext context) {
    return Padding(
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
