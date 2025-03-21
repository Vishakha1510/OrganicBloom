// ignore_for_file: file_names, deprecated_member_use

import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';

class DetailScreen extends StatefulWidget {
  final String categoryId;
  final String itemId;

  const DetailScreen(
      {required this.categoryId, required this.itemId, super.key});

  @override
  State<DetailScreen> createState() => _DetailScreenState();
}

class _DetailScreenState extends State<DetailScreen> {
  DocumentSnapshot<Map<String, dynamic>>? itemDetails;

  void getItemDetails() async {
    itemDetails = await FirebaseFirestore.instance
        .collection('categories')
        .doc(widget.categoryId)
        .collection('Items')
        .doc(widget.itemId)
        .get();

    setState(() {});
  }

  @override
  void initState() {
    super.initState();
    getItemDetails();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar:
          AppBar(title: Text(itemDetails?.data()?["name"] ?? "Item Detail")),
      body: itemDetails == null
          ? Center(child: CircularProgressIndicator())
          : Padding(
              padding: EdgeInsets.all(16.0),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Center(
                    child: Image.network(
                      itemDetails?.data()?["image"] ?? "",
                      height: 200,
                      fit: BoxFit.cover,
                    ),
                  ),
                  SizedBox(height: 20),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Text(
                        itemDetails?.data()?["name"] ?? "",
                        style: TextStyle(
                            fontSize: 24,
                            fontWeight: FontWeight.bold,
                            color: Colors.green),
                      ),
                      Text(
                        "⭐${itemDetails?.data()?["rating"] ?? "0"}",
                        style: TextStyle(
                            fontSize: 24,
                            fontWeight: FontWeight.bold,
                            color: Colors.green),
                      )
                    ],
                  ),
                  SizedBox(height: 15),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Text(
                        "Price: ₹${itemDetails?.data()?["price"] ?? "0"}",
                        style: TextStyle(
                          fontSize: 24,
                          fontWeight: FontWeight.bold,
                          color: Colors.green,
                        ),
                      ),
                      IconButton(
                          onPressed: () {},
                          icon: Icon(
                            Icons.favorite_border,
                            size: 35,
                          ))
                    ],
                  ),
                  SizedBox(height: 10),
                  Text(
                    "Description",
                    style: TextStyle(
                      fontSize: 24,
                      fontWeight: FontWeight.bold,
                      color: Colors.green,
                    ),
                  ),
                  SizedBox(height: 10),
                  Text(
                    itemDetails?.data()?["description"] ??
                        "No description available",
                    style: TextStyle(fontSize: 16),
                  ),
                  SizedBox(height: 20),
                  (itemDetails?.data()?["benefits"] == null)
                      ? Column(
                          spacing: 10,
                          children: [
                            Row(
                              mainAxisAlignment: MainAxisAlignment.spaceAround,
                              children: [
                                Text(
                                  "Calories",
                                  style: TextStyle(
                                    fontSize: 18,
                                    fontWeight: FontWeight.bold,
                                    color: Colors.green,
                                  ),
                                ),
                                Text(
                                  "Carbs",
                                  style: TextStyle(
                                    fontSize: 18,
                                    fontWeight: FontWeight.bold,
                                    color: Colors.green,
                                  ),
                                ),
                                Text(
                                  "Protein",
                                  style: TextStyle(
                                    fontSize: 18,
                                    fontWeight: FontWeight.bold,
                                    color: Colors.green,
                                  ),
                                ),
                                Text(
                                  "Fat",
                                  style: TextStyle(
                                    fontSize: 18,
                                    fontWeight: FontWeight.bold,
                                    color: Colors.green,
                                  ),
                                ),
                              ],
                            ),
                            Row(
                              mainAxisAlignment: MainAxisAlignment.spaceAround,
                              children: [
                                Text(
                                  itemDetails?.data()?["calories"] ?? "",
                                  style: TextStyle(fontSize: 16),
                                ),
                                Text(
                                  itemDetails?.data()?["carbs"] ?? "",
                                  style: TextStyle(fontSize: 16),
                                ),
                                Text(
                                  itemDetails?.data()?["protein"] ?? "",
                                  style: TextStyle(fontSize: 16),
                                ),
                                Text(
                                  itemDetails?.data()?["fat"] ?? "",
                                  style: TextStyle(fontSize: 16),
                                ),
                              ],
                            ),
                          ],
                        )
                      : Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            SizedBox(height: 10),
                            Text(
                              "Benefits",
                              style: TextStyle(
                                fontSize: 18,
                                fontWeight: FontWeight.bold,
                                color: Colors.green,
                              ),
                            ),
                            Text(
                              itemDetails?.data()?["benefits"] ?? "",
                              style: TextStyle(fontSize: 16),
                            ),
                          ],
                        ),
                  SizedBox(height: 20),
                  Text(
                    "Qauntity",
                    style: TextStyle(
                      fontSize: 24,
                      fontWeight: FontWeight.bold,
                      color: Colors.green,
                    ),
                  ),
                  SizedBox(height: 25),
                  SizedBox(
                    width: double.infinity,
                    height: 50,
                    child: ElevatedButton.icon(
                      onPressed: () {},
                      icon: Icon(Icons.shopping_cart,
                          color: Colors.white, size: 22),
                      label: Text(
                        "Add to Cart",
                        style: TextStyle(
                          fontSize: 16,
                          fontWeight: FontWeight.bold,
                          color: Colors.white,
                        ),
                      ),
                      style: ElevatedButton.styleFrom(
                        backgroundColor: Color((0xFFA5CC65)),
                        shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(12),
                        ),
                        elevation: 6,
                        shadowColor: Colors.black.withOpacity(0.3),
                        padding: EdgeInsets.symmetric(vertical: 12),
                      ),
                    ),
                  )
                ],
              ),
            ),
    );
  }
}
