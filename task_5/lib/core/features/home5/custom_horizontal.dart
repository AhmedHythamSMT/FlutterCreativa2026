import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';

Widget customHorizontalScroll(BuildContext context) {
  final List<Map<String, dynamic>> items = [
    {'title': 'إلكترونيات', 'icon': Icons.laptop_chromebook_rounded},
    {'title': 'ملابس', 'icon': FontAwesomeIcons.shirt},
    {'title': 'منزل', 'icon': Icons.home},
    {'title': 'كتب', 'icon': Icons.menu_book_outlined},
    {'title': 'رياضة', 'icon': Icons.sports_football},
  ];

  return SizedBox(
    height: MediaQuery.of(context).size.height * 0.15,
    child: ListView.builder(
      scrollDirection: Axis.horizontal,
      itemCount: items.length,
      reverse: true,
      itemBuilder: (context, index) {
        final iconData = items[index]['icon'];
        return Padding(
          padding: const EdgeInsets.only(left: 10, right: 20),
          child: Column(
            children: [
              GestureDetector(
                // ignore: avoid_print
                onTap: () => print("${items[index]['title']} pressed"),
                child: Container(
                  width: 70,
                  height: 60,
                  decoration: BoxDecoration(
                    color: Colors.grey.withValues(alpha: .5),
                    borderRadius: BorderRadius.circular(15),
                  ),
                  child: Center(
                    child: iconData is IconData
                        ? Icon(iconData, color: Colors.black87, size: 35)
                        : FaIcon(iconData, color: Colors.black87, size: 35),
                  ),
                ),
              ),
              const SizedBox(height: 8),
              Text(
                items[index]['title'],
                style: const TextStyle(
                  fontSize: 14,
                  fontWeight: FontWeight.bold,
                  color: Colors.black87,
                ),
              ),
            ],
          ),
        );
      },
    ),
  );
}
