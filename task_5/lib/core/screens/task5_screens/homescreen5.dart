import 'package:flutter/material.dart';
import 'package:task_5/core/features/home5/custom_gridview.dart';
import 'package:task_5/core/features/home5/custom_horizontal.dart';
import 'package:task_5/core/features/home5/custom_navbar5.dart';
import 'package:task_5/core/features/home5/custom_textfield5.dart';
import 'package:task_5/core/features/home5/header_title.dart';
import 'package:task_5/core/screens/task5_screens/orders_screen.dart';

class Homescreen5 extends StatefulWidget {
  const Homescreen5({super.key});

  @override
  State<Homescreen5> createState() => _Homescreen5State();
}

class _Homescreen5State extends State<Homescreen5> {
  int _currentIndex = 0;
  final TextEditingController _searchController = TextEditingController();

  final List<Widget> _screens = [
    const HomeBody(),
    const OrdersScreen(),
    const Center(child: Text("البحث")),
    const Center(child: Text("الملف الشخصي")),
  ];

  void _onTabTapped(int index) {
    setState(() {
      _currentIndex = index;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.greenAccent,
        elevation: 0,
        leading: IconButton(
          onPressed: () {},
          icon: const Icon(Icons.menu_outlined),
        ),
        title: Align(
          alignment: Alignment.centerRight,
          child: Text(
            _currentIndex == 0 ? "الرئيسية" : "طلباتي",
            style: const TextStyle(fontSize: 22, fontWeight: FontWeight.w500),
          ),
        ),
      ),
      body: _screens[_currentIndex],
      bottomNavigationBar: CustomBottomNavBar5(
        currentIndex: _currentIndex,
        onTap: _onTabTapped,
      ),
    );
  }
}

class HomeBody extends StatelessWidget {
  const HomeBody({super.key});

  @override
  Widget build(BuildContext context) {
    final double screenWidth = MediaQuery.of(context).size.width;
    return SingleChildScrollView(
      physics: const AlwaysScrollableScrollPhysics(),
      child: Column(
        children: [
          const SizedBox(height: 15),
          Padding(
            padding: EdgeInsets.symmetric(horizontal: screenWidth * 0.02),
            child: CustomTextField5(
              labelText: 'حقل البحث',
              suffixIcon: Icons.search_rounded,
              controller: TextEditingController(),
              iconColor: Colors.grey,
              labelColor: Colors.grey,
              fontSize: 16,
            ),
          ),
          const SizedBox(height: 25),
          HeaderTitle(title: "الفئات"),
          const SizedBox(height: 10),
          customHorizontalScroll(context),
          const SizedBox(height: 20),
          HeaderTitle(title: "منتجات مميزة"),
          Padding(
            padding: EdgeInsets.symmetric(horizontal: screenWidth * 0.02),
            child: customImageGrid(),
          ),
          const SizedBox(height: 20),
        ],
      ),
    );
  }
}
