// ignore_for_file: file_names, deprecated_member_use

import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:organicbloom/helpers/providers/cart_provider.dart';
import 'package:organicbloom/helpers/providers/favourite_provider.dart';
import 'package:provider/provider.dart';

import '../../../model/cart_model.dart';

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
    final cartProvider = Provider.of<CartProvider>(context);

    return Scaffold(
      appBar:
          AppBar(title: Text(itemDetails?.data()?["name"] ?? "Item Detail")),
      body: itemDetails == null
          ? const Center(child: CircularProgressIndicator())
          : Padding(
              padding: const EdgeInsets.all(16.0),
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
                  const SizedBox(height: 20),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Text(
                        itemDetails?.data()?["name"] ?? "",
                        style: const TextStyle(
                            fontSize: 24,
                            fontWeight: FontWeight.bold,
                            color: Colors.green),
                      ),
                      Text(
                        "⭐${itemDetails?.data()?["rating"] ?? "0"}",
                        style: const TextStyle(
                            fontSize: 24,
                            fontWeight: FontWeight.bold,
                            color: Colors.green),
                      )
                    ],
                  ),
                  const SizedBox(height: 15),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Text(
                        "Price: ₹${itemDetails?.data()?["price"] ?? "0"}",
                        style: const TextStyle(
                          fontSize: 24,
                          fontWeight: FontWeight.bold,
                          color: Colors.green,
                        ),
                      ),
                      IconButton(
                        onPressed: () {
                          FavouriteProvider favProvider =
                              Provider.of<FavouriteProvider>(context,
                                  listen: false);

                          CartItem item = CartItem(
                            id: widget.itemId,
                            itemData: itemDetails!.data()!,
                            categoryId: widget.categoryId,
                          );

                          if (favProvider.isFavorite(item.id)) {
                            favProvider.removeFromFavorites(context, item);
                          } else {
                            favProvider.addToFavorites(context, item);
                          }
                        },
                        icon: Consumer<FavouriteProvider>(
                          builder: (context, favProvider, child) {
                            return Icon(
                              favProvider.isFavorite(widget.itemId)
                                  ? Icons.favorite
                                  : Icons.favorite_border,
                              size: 35,
                              color: favProvider.isFavorite(widget.itemId)
                                  ? Colors.red
                                  : Colors.grey,
                            );
                          },
                        ),
                      ),
                    ],
                  ),
                  const SizedBox(height: 10),
                  const Text(
                    "Description",
                    style: TextStyle(
                      fontSize: 24,
                      fontWeight: FontWeight.bold,
                      color: Colors.green,
                    ),
                  ),
                  const SizedBox(height: 10),
                  Text(
                    itemDetails?.data()?["description"] ??
                        "No description available",
                    style: const TextStyle(fontSize: 16),
                  ),
                  const SizedBox(height: 20),

                  // Nutritional Information or Benefits
                  itemDetails?.data()?["benefits"] == null
                      ? Column(
                          children: [
                            Row(
                              mainAxisAlignment: MainAxisAlignment.spaceAround,
                              children: const [
                                Text("Calories",
                                    style: TextStyle(
                                        fontSize: 18,
                                        fontWeight: FontWeight.bold,
                                        color: Colors.green)),
                                Text("Carbs",
                                    style: TextStyle(
                                        fontSize: 18,
                                        fontWeight: FontWeight.bold,
                                        color: Colors.green)),
                                Text("Protein",
                                    style: TextStyle(
                                        fontSize: 18,
                                        fontWeight: FontWeight.bold,
                                        color: Colors.green)),
                                Text("Fat",
                                    style: TextStyle(
                                        fontSize: 18,
                                        fontWeight: FontWeight.bold,
                                        color: Colors.green)),
                              ],
                            ),
                            Row(
                              mainAxisAlignment: MainAxisAlignment.spaceAround,
                              children: [
                                Text(itemDetails?.data()?["calories"] ?? "",
                                    style: const TextStyle(fontSize: 16)),
                                Text(itemDetails?.data()?["carbs"] ?? "",
                                    style: const TextStyle(fontSize: 16)),
                                Text(itemDetails?.data()?["protein"] ?? "",
                                    style: const TextStyle(fontSize: 16)),
                                Text(itemDetails?.data()?["fat"] ?? "",
                                    style: const TextStyle(fontSize: 16)),
                              ],
                            ),
                          ],
                        )
                      : Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            const SizedBox(height: 10),
                            const Text(
                              "Benefits",
                              style: TextStyle(
                                  fontSize: 18,
                                  fontWeight: FontWeight.bold,
                                  color: Colors.green),
                            ),
                            Text(itemDetails?.data()?["benefits"] ?? "",
                                style: const TextStyle(fontSize: 16)),
                          ],
                        ),

                  SizedBox(height: 20),

                  // Quantity Selector
                  Row(
                    children: [
                      const Text(
                        "Quantity",
                        style: TextStyle(
                            fontSize: 24,
                            fontWeight: FontWeight.bold,
                            color: Colors.green),
                      ),
                      Spacer(),
                      IconButton(
                        onPressed: () {
                          var existingItem = cartProvider.items.firstWhere(
                            (item) => item.id == widget.itemId,
                            orElse: () => CartItem(
                              id: widget.itemId,
                              categoryId: widget.categoryId,
                              itemData: itemDetails!.data()!,
                              qty: 0,
                            ),
                          );

                          if (existingItem.qty > 1) {
                            cartProvider.removeFromCart(context, existingItem);
                          } else if (existingItem.qty == 1) {
                            cartProvider.removeFromCart(context, existingItem);
                          }
                        },
                        icon: Icon(Icons.remove_circle,
                            size: 30, color: Colors.red),
                      ),
                      Consumer<CartProvider>(
                        builder: (context, cart, child) {
                          var existingItem = cart.items.firstWhere(
                            (item) => item.id == widget.itemId,
                            orElse: () => CartItem(
                                id: widget.itemId,
                                categoryId: widget.categoryId,
                                itemData: itemDetails!.data()!,
                                qty: 0),
                          );

                          return Text("${existingItem.qty}",
                              style: TextStyle(
                                fontSize: 20,
                                fontWeight: FontWeight.bold,
                              ));
                        },
                      ),
                      IconButton(
                        onPressed: () {
                          var existingItem = cartProvider.items.firstWhere(
                            (item) => item.id == widget.itemId,
                            orElse: () => CartItem(
                              id: widget.itemId,
                              categoryId: widget.categoryId,
                              itemData: itemDetails!.data()!,
                              qty: 0,
                            ),
                          );

                          cartProvider.addToCart(
                            context,
                            CartItem(
                              id: widget.itemId,
                              categoryId: widget.categoryId,
                              itemData: itemDetails!.data()!,
                              qty: existingItem.qty + 1,
                            ),
                          );
                        },
                        icon: const Icon(Icons.add_circle,
                            size: 30, color: Colors.green),
                      ),
                    ],
                  ),

                  const SizedBox(height: 25),

                  // Add to Cart Button
                  SizedBox(
                    width: double.infinity,
                    height: 50,
                    child: ElevatedButton.icon(
                      onPressed: () {
                        var existingItem = cartProvider.items.firstWhere(
                          (item) => item.id == widget.itemId,
                          orElse: () => CartItem(
                            id: widget.itemId,
                            categoryId: widget.categoryId,
                            itemData: itemDetails!.data()!,
                            qty: 0,
                          ),
                        );

                        if (existingItem.qty == 0) {
                          cartProvider.addToCart(
                            context,
                            CartItem(
                              id: widget.itemId,
                              categoryId: widget.categoryId,
                              itemData: itemDetails!.data()!,
                              qty: 1,
                            ),
                          );
                        }

                        Navigator.pushNamed(context, 'cart');
                      },
                      icon: const Icon(Icons.shopping_cart,
                          color: Colors.white, size: 22),
                      label: const Text(
                        "Add to Cart",
                        style: TextStyle(
                            fontSize: 16,
                            fontWeight: FontWeight.bold,
                            color: Colors.white),
                      ),
                      style: ElevatedButton.styleFrom(
                        backgroundColor: const Color(0xFFA5CC65),
                        shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(12),
                        ),
                        elevation: 6,
                        shadowColor: Colors.black.withOpacity(0.3),
                        padding: const EdgeInsets.symmetric(vertical: 12),
                      ),
                    ),
                  ),
                ],
              ),
            ),
    );
  }
}
