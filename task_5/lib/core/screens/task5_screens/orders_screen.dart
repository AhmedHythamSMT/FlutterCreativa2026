import 'package:flutter/material.dart';

class OrdersScreen extends StatefulWidget {
  const OrdersScreen({super.key});

  @override
  State<OrdersScreen> createState() => _OrdersScreenState();
}

class _OrdersScreenState extends State<OrdersScreen> {
  final List<Map<String, String>> allOrders = [
    {
      "id": "طلب رقم #12345",
      "status": "قيد التنفيذ",
      "image": "https://images.unsplash.com/photo-1542291026-7eec264c27ff",
    },
    {
      "id": "طلب رقم #12346",
      "status": "قيد التنفيذ",
      "image": "https://images.unsplash.com/photo-1523275335684-37898b6baf30",
    },
    {
      "id": "طلب رقم #12347",
      "status": "مُلغاة",
      "image": "https://images.unsplash.com/photo-1491553895911-0055eca6402d",
    },
    {
      "id": "طلب رقم #12348",
      "status": "مكتملة",
      "image": "https://images.unsplash.com/photo-1556911220-e15b29be8c8f",
    },
  ];

  @override
  Widget build(BuildContext context) {
    return Directionality(
      textDirection: TextDirection.rtl,
      child: DefaultTabController(
        length: 3,
        child: Column(
          children: [
            const TabBar(
              labelColor: Colors.black,
              unselectedLabelColor: Colors.grey,
              indicatorColor: Colors.greenAccent,
              tabs: [
                Tab(text: "قيد التنفيذ"),
                Tab(text: "مكتملة"),
                Tab(text: "مُلغاة"),
              ],
            ),
            Expanded(
              child: TabBarView(
                children: [
                  _buildOrderList(["قيد التنفيذ"]),
                  _buildOrderList(["مكتملة"]),
                  _buildOrderList(["مُلغاة"]),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }

  Widget _buildOrderList(List<String> statusFilters) {
    final filteredOrders = allOrders
        .where((o) => statusFilters.contains(o['status']))
        .toList();

    return ListView.builder(
      itemCount: filteredOrders.length,
      padding: const EdgeInsets.all(15),
      itemBuilder: (context, index) {
        final order = filteredOrders[index];

        return Container(
          margin: const EdgeInsets.only(bottom: 15),
          decoration: BoxDecoration(
            border: Border.all(color: Colors.greenAccent, width: 1.5),
            borderRadius: BorderRadius.circular(15),
          ),
          child: Theme(
            data: Theme.of(context).copyWith(dividerColor: Colors.transparent),
            child: ExpansionTile(
              title: Text(
                order['id']!,
                style: const TextStyle(
                  fontWeight: FontWeight.bold,
                  fontSize: 16,
                ),
              ),
              leading: const Icon(
                Icons.receipt_long,
                color: Colors.greenAccent,
              ),
              // Flutter's default trailing icon animates rotation automatically
              children: [
                Padding(
                  padding: const EdgeInsets.all(15.0),
                  child: Row(
                    children: [
                      ClipRRect(
                        borderRadius: BorderRadius.circular(10),
                        child: Image.network(
                          order['image']!,
                          width: 80,
                          height: 80,
                          fit: BoxFit.cover,
                        ),
                      ),
                      const SizedBox(width: 15),
                      Expanded(
                        // Makes it responsive for long text
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Text(
                              order['id']!,
                              style: const TextStyle(
                                fontWeight: FontWeight.bold,
                              ),
                            ),
                            const SizedBox(height: 10),
                            Container(
                              padding: const EdgeInsets.symmetric(
                                horizontal: 12,
                                vertical: 4,
                              ),
                              decoration: BoxDecoration(
                                color: Colors.greenAccent,
                                borderRadius: BorderRadius.circular(20),
                              ),
                              child: Text(
                                order['status']!,
                                style: const TextStyle(
                                  color: Colors.black,
                                  fontSize: 12,
                                ),
                              ),
                            ),
                          ],
                        ),
                      ),
                    ],
                  ),
                ),
              ],
            ),
          ),
        );
      },
    );
  }
}
