import 'package:flutter/material.dart';
import 'package:intl/intl.dart';

class OrdersDetailScreen extends StatefulWidget {
  final Map<String, dynamic> orderData;

  const OrdersDetailScreen({super.key, required this.orderData});

  @override
  State<OrdersDetailScreen> createState() => _OrdersDetailScreenState();
}

class _OrdersDetailScreenState extends State<OrdersDetailScreen> {
  late DateTime dateTime;
  late DateFormat dateFormat;

  @override
  void initState() {
    super.initState();
    dateTime = DateTime.parse(widget.orderData["created_at"]);
    dateFormat = DateFormat("dd/MM/yyyy hh:mm a");
  }

  @override
  Widget build(BuildContext context) {
    final order = widget.orderData;
    final items = order["items"] as List;

    return Scaffold(
      appBar: AppBar(
        backgroundColor: Color(0xFFA5CC65),
        foregroundColor: Colors.white,
        title: Text(
          "Order Details",
          style: TextStyle(fontWeight: FontWeight.bold, fontSize: 25),
        ),
        centerTitle: true,
      ),
      body: Padding(
        padding: const EdgeInsets.all(12.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            // Order Info
            Card(
              color: Colors.white,
              elevation: 3,
              child: Padding(
                padding: EdgeInsets.all(12.0),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text("Order ID: #${order["order_id"]}",
                        style: TextStyle(
                            fontSize: 18, fontWeight: FontWeight.bold)),
                    SizedBox(height: 6),
                    Text("Placed at: ${dateFormat.format(dateTime)}"),
                    SizedBox(height: 6),
                    Text("Total Amount: ₹${order["total"]}",
                        style: TextStyle(
                            fontSize: 16, fontWeight: FontWeight.w500)),
                  ],
                ),
              ),
            ),
            SizedBox(height: 12),

            // Items List
            Text("Items in this Order:",
                style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold)),
            SizedBox(height: 10),
            Expanded(
              child: ListView.builder(
                itemCount: items.length,
                itemBuilder: (context, index) {
                  final item = items[index];
                  final itemData = item["itemData"];
                  final int quantity = item["qty"];
                  final double pricePerUnit =
                      double.tryParse(itemData["price"].toString()) ?? 0;
                  final double totalPrice = quantity * pricePerUnit;

                  return Card(
                    color: Colors.white,
                    elevation: 3,
                    margin: EdgeInsets.symmetric(vertical: 6),
                    child: Padding(
                      padding: EdgeInsets.all(10.0),
                      child: Row(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          // Product Image
                          ClipRRect(
                            borderRadius: BorderRadius.circular(8),
                            child: Image.network(
                              itemData["image"],
                              height: 100,
                              width: 100,
                              fit: BoxFit.cover,
                            ),
                          ),
                          SizedBox(width: 10),

                          // Product Details
                          Expanded(
                            child: Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                Text(
                                  itemData["name"],
                                  style: TextStyle(
                                      fontSize: 16,
                                      fontWeight: FontWeight.bold),
                                ),
                                SizedBox(height: 4),
                                Text("Quantity: $quantity"),
                                Text("Price per unit: ₹$pricePerUnit"),
                                Text(
                                  "Total: ₹${totalPrice.toStringAsFixed(2)}",
                                  style: TextStyle(
                                      fontWeight: FontWeight.w600,
                                      color: Colors.green),
                                ),
                                SizedBox(height: 4),
                                Text(
                                  "Description: ${itemData["description"]}",
                                  style: TextStyle(
                                      fontSize: 13, color: Colors.grey[700]),
                                  maxLines: 2,
                                  overflow: TextOverflow.ellipsis,
                                ),
                              ],
                            ),
                          ),
                        ],
                      ),
                    ),
                  );
                },
              ),
            ),
          ],
        ),
      ),
    );
  }
}
