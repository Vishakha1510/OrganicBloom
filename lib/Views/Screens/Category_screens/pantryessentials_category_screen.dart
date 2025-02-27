import 'package:flutter/material.dart';
import 'package:organicbloom/Lists/Pantry_list.dart';
import 'package:organicbloom/Views/Screens/Detail_screens/pantryessentials_detail_screen.dart';
import 'package:organicbloom/helpers/providers/cart_provider.dart';
import 'package:provider/provider.dart';

class PantryessentialsCategoryScreen extends StatefulWidget {
  const PantryessentialsCategoryScreen({super.key});

  @override
  State<PantryessentialsCategoryScreen> createState() =>
      _PantryessentialsCategoryScreenState();
}

class _PantryessentialsCategoryScreenState
    extends State<PantryessentialsCategoryScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        centerTitle: true,
        title: const Text("PANTRY ESSENTIALS"),
      ),
      body: Padding(
        padding: const EdgeInsets.all(10.0),
        child: GridView.builder(
          gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
            crossAxisCount: 2,
            crossAxisSpacing: 10,
            mainAxisSpacing: 10,
            childAspectRatio: 3 / 4,
          ),
          itemCount: 12,
          itemBuilder: (context, index) {
            final pantry = pantryEssentials[index];
            return GestureDetector(
              onTap: () {
                Navigator.of(context).push(MaterialPageRoute(
                    builder: (context) =>
                        PantryEssentialDetailScreen(essential: pantry)));
              },
              child: Container(
                decoration: BoxDecoration(
                  color: Colors.white,
                  borderRadius: BorderRadius.circular(10),
                ),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    // Fruit Image
                    ClipRRect(
                      borderRadius: const BorderRadius.vertical(
                        top: Radius.circular(10),
                      ),
                      child: Image.asset(
                        pantry['image'],
                        height: 120,
                        width: 200,
                        fit: BoxFit.cover,
                      ),
                    ),
                    Padding(
                      padding: const EdgeInsets.all(8.0),
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          // Fruit Name
                          Row(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: [
                              Text(
                                pantry['name'],
                                style: const TextStyle(
                                  fontSize: 12,
                                  fontWeight: FontWeight.bold,
                                  color: Colors.black87,
                                ),
                              ),
                              IconButton(
                                onPressed: () {
                                  var cartProvider = Provider.of<CartProvider>(
                                      context,
                                      listen: false);

                                  // Ensure fruit has an 'id', generate one if missing
                                  String Id = pantry.containsKey('id')
                                      ? pantry['id'].toString()
                                      : DateTime.now()
                                          .millisecondsSinceEpoch
                                          .toString();

                                  // Convert price safely
                                  double price = double.tryParse(pantry['price']
                                              .replaceAll(
                                                  RegExp(r'[^0-9]'), ''))
                                          ?.toDouble() ??
                                      0.0;

                                  // Add item to cart
                                  cartProvider.addToCart(
                                    Id,
                                    pantry['name'].toString(),
                                    price,
                                    1, // Default quantity to 1 for now
                                    pantry['image'].toString(),
                                  );

                                  // Show confirmation
                                  ScaffoldMessenger.of(context).showSnackBar(
                                    SnackBar(
                                        content: Text(
                                            "${pantry['name']} added to cart!")),
                                  );
                                },
                                icon: const Icon(Icons.add, size: 30),
                              ),
                            ],
                          ),
                          const SizedBox(height: 5),
                          // Rating
                          Text(
                            pantry['rating'],
                            style: const TextStyle(
                              fontSize: 14,
                              color: Colors.black54,
                            ),
                          ),
                          const SizedBox(height: 5),
                          // Price
                          Text(
                            pantry['price'],
                            style: const TextStyle(
                              fontSize: 16,
                              fontWeight: FontWeight.bold,
                              color: Colors.green,
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
        ),
      ),
    );
  }
}
