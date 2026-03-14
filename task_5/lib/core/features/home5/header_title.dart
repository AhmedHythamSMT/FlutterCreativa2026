import 'package:flutter/material.dart';

class HeaderTitle extends StatelessWidget {
  const HeaderTitle({super.key, required this.title});
  final String title;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 15.0),
      child: Directionality(
        textDirection: .rtl,
        child: Align(
          alignment: .centerRight,
          child: Text(
            title,
            style: const TextStyle(fontSize: 22, fontWeight: .w500),
          ),
        ),
      ),
    );
  }
}
