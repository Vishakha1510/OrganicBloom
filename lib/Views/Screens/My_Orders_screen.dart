// ignore_for_file: file_names

import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import 'package:organicbloom/helpers/providers/cart_provider.dart';
import 'package:provider/provider.dart';

class MyOrdersScreen extends StatefulWidget {
  const MyOrdersScreen({super.key});

  @override
  State<MyOrdersScreen> createState() => _MyOrdersScreenState();
}

class _MyOrdersScreenState extends State<MyOrdersScreen> {
  CartProvider? cartProvider;

  List<Map<String, dynamic>> orderList = [];

  bool isLoading = false;

  @override
  void initState() {
    isLoading = true;
    Future.delayed(Duration(seconds: 1)).then((value) async {
      orderList = await cartProvider?.getOrderList(context) ?? [];
      isLoading = false;
      if (mounted) setState(() {});
    });

    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    cartProvider = Provider.of<CartProvider>(context);
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Color(0xFFA5CC65),
        foregroundColor: Colors.white,
        centerTitle: true,
        title: Text(
          "MY  ORDERS",
          style: TextStyle(fontWeight: FontWeight.bold, fontSize: 25),
        ),
      ),
      body: isLoading
          ? Center(child: CircularProgressIndicator())
          : ListView.builder(
              itemBuilder: (context, index) => buildOrderTile(orderList[index]),
              itemCount: orderList.length,
            ),
    );
  }

  Widget buildOrderTile(Map<String, dynamic> order) {
    DateTime dateTime = DateTime.parse(order["created_at"]);
    DateFormat dateFormat = DateFormat("dd/MM/yyyy hh:mm a");

    return Card(
      color: Colors.white,
      child: Container(
        padding: EdgeInsets.all(10),
        child: Column(
          children: [
            Row(
              children: [
                Expanded(
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text("Order id: #${order["order_id"].toString()}"),
                      SizedBox(
                        height: 8,
                      ),
                      Text("Placed at: ${dateFormat.format(dateTime)}"),
                    ],
                  ),
                ),
                Text("Total ${order["total"].toString()}"),
              ],
            ),
            SizedBox(
              height: 100,
              child: ListView.builder(
                scrollDirection: Axis.horizontal,
                itemBuilder: (context, index) => Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: Image.network(
                    (order["items"] as List)[index]["itemData"]["image"],
                    height: 50,
                    width: 50,
                  ),
                ),
                itemCount: (order["items"] as List).length,
              ),
            )
          ],
        ),
      ),
    );
  }
}
