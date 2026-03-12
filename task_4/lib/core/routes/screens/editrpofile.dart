import 'package:flutter/material.dart';

class Editrpofile extends StatelessWidget {
  const Editrpofile({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        leading: IconButton(
          onPressed: () => Navigator.pop(context),
          icon: Icon(Icons.arrow_back),
        ),
      ),
    );
  }
}
