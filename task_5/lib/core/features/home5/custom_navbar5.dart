import 'package:flutter/material.dart';

class CustomBottomNavBar5 extends StatelessWidget {
  final int currentIndex;
  final Function(int) onTap;

  const CustomBottomNavBar5({
    super.key,
    required this.currentIndex,
    required this.onTap,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 80,
      decoration: const BoxDecoration(
        color: Colors.white,
        boxShadow: [
          BoxShadow(color: Colors.black12, blurRadius: 4, spreadRadius: 1),
        ],
      ),
      child: Directionality(
        textDirection: TextDirection.rtl,
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceAround,
          children: [
            _buildIconItem(Icons.home_outlined, Icons.home, "الرئيسية", 0),
            _buildIconItem(
              Icons.shopping_cart_outlined,
              Icons.shopping_cart,
              "السلة",
              1,
            ),
            _buildIconItem(Icons.search_outlined, Icons.search, "بحث", 2),
            _buildIconItem(Icons.person_outline, Icons.person, "حسابي", 3),
          ],
        ),
      ),
    );
  }

  Widget _buildIconItem(
    IconData outlinedIcon,
    IconData filledIcon,
    String label,
    int index,
  ) {
    final isSelected = index == currentIndex;

    return GestureDetector(
      onTap: () => onTap(index),
      behavior: HitTestBehavior.opaque,
      child: Column(
        mainAxisSize: MainAxisSize.min,
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Icon(
            isSelected ? filledIcon : outlinedIcon,
            size: 26,
            color: isSelected ? Colors.blueAccent : Colors.grey,
          ),
          if (isSelected)
            Padding(
              padding: const EdgeInsets.only(top: 4.0),
              child: Text(
                label,
                style: const TextStyle(
                  color: Colors.blueAccent,
                  fontSize: 12,
                  fontWeight: FontWeight.bold,
                ),
              ),
            ),
        ],
      ),
    );
  }
}
