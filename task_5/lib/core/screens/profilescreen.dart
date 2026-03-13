import 'package:flutter/material.dart';
import 'package:task_5/core/features/custom_navbar/custom_navbar.dart';
import 'package:task_5/core/routes/routes.dart';

class Profilescreen extends StatefulWidget {
  final String? name;

  const Profilescreen({super.key, required this.name});

  @override
  State<Profilescreen> createState() => _ProfilescreenState();
}

class _ProfilescreenState extends State<Profilescreen> {
  int _currentIndex = 0;

  void _onTabTapped(int index) {
    setState(() {
      _currentIndex = index;
    });
    // Handle navigation based on index if needed
  }

  @override
  Widget build(BuildContext context) {
    final displayName = (widget.name == null || widget.name!.isEmpty)
        ? 'No name provided'
        : widget.name!;

    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.greenAccent,
        leading: IconButton(onPressed: () {}, icon: Icon(Icons.list_rounded)),
        title: const Text("الملف الشخصي"),
        actions: [IconButton(onPressed: () {}, icon: Icon(Icons.settings))],
      ),
      body: Center(
        child: Column(
          children: [
            const Padding(
              padding: EdgeInsets.symmetric(vertical: 40.0),
              child: CircleAvatar(
                radius: 50,
                backgroundImage: NetworkImage(
                  'https://www.pngall.com/wp-content/uploads/5/Profile-PNG-High-Quality-Image.png',
                ),
              ),
            ),
            const SizedBox(height: 20),
            const Text(
              "SizedBox",
              style: TextStyle(color: Colors.black, fontSize: 20),
            ),
            const SizedBox(height: 20),
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 10.0),
              child: Text(
                displayName,
                style: const TextStyle(color: Colors.black, fontSize: 20),
              ),
            ),
            const SizedBox(height: 20),
            const Text(
              "SizedBox",
              style: TextStyle(color: Colors.black, fontSize: 20),
            ),
            const SizedBox(height: 20),
            const Text(
              "مطور تطبيقات مموبايل",
              style: TextStyle(color: Colors.black, fontSize: 20),
            ),
            const SizedBox(height: 20),
            const Text(
              "SizedBox",
              style: TextStyle(color: Colors.black, fontSize: 20),
            ),
            const SizedBox(height: 20),
            ElevatedButton(
              style: ElevatedButton.styleFrom(
                backgroundColor: Colors.greenAccent,
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(30),
                ),
              ),
              onPressed: () {
                Navigator.pushNamed(context, Routes.editProfile);
              },
              child: Padding(
                padding: const EdgeInsets.symmetric(
                  horizontal: 42.0,
                  vertical: 18,
                ),
                child: const Text(
                  'تعديل الملف الشخصي',
                  style: TextStyle(color: Colors.black),
                ),
              ),
            ),
          ],
        ),
      ),
      bottomNavigationBar: CustomBottomNavBar(
        currentIndex: _currentIndex,
        onTap: _onTabTapped,
      ),
    );
  }
}
