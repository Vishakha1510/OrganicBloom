import 'package:flutter/material.dart';
import 'package:organicbloom/Lists/Frozen_list.dart';
import 'package:organicbloom/Views/Screens/Detail_screens/frozenfood_detail_screen.dart';
import 'package:organicbloom/helpers/providers/cart_provider.dart';
import 'package:provider/provider.dart';

class FrozenfoodCategoryScreen extends StatefulWidget {
  const FrozenfoodCategoryScreen({super.key});

  @override
  State<FrozenfoodCategoryScreen> createState() =>
      _FrozenfoodCategoryScreenState();
}

class _FrozenfoodCategoryScreenState extends State<FrozenfoodCategoryScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        centerTitle: true,
        title: const Text("FROZEN FOOD"),
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
          itemCount: frozenVegFoodItems.length,
          itemBuilder: (context, index) {
            final frozen = frozenVegFoodItems[index];
            return GestureDetector(
              onTap: () {
                Navigator.of(context).push(MaterialPageRoute(
                    builder: (context) =>
                        FrozenVegFoodDetailScreen(foodItem: frozen)));
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
                        frozen['image'],
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
                                frozen['name'],
                                style: const TextStyle(
                                  fontSize: 18,
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
                                  String Id = frozen.containsKey('id')
                                      ? frozen['id'].toString()
                                      : DateTime.now()
                                          .millisecondsSinceEpoch
                                          .toString();

                                  // Convert price safely
                                  double price = double.tryParse(frozen['price']
                                              .replaceAll(
                                                  RegExp(r'[^0-9]'), ''))
                                          ?.toDouble() ??
                                      0.0;

                                  // Add item to cart
                                  cartProvider.addToCart(
                                    Id,
                                    frozen['name'].toString(),
                                    price,
                                    1, // Default quantity to 1 for now
                                    frozen['image'].toString(),
                                  );

                                  // Show confirmation
                                  ScaffoldMessenger.of(context).showSnackBar(
                                    SnackBar(
                                        content: Text(
                                            "${frozen['name']} added to cart!")),
                                  );
                                },
                                icon: const Icon(Icons.add, size: 30),
                              ),
                            ],
                          ),
                          const SizedBox(height: 5),
                          // Rating
                          Text(
                            frozen['rating'],
                            style: const TextStyle(
                              fontSize: 14,
                              color: Colors.black54,
                            ),
                          ),
                          const SizedBox(height: 5),
                          // Price
                          Text(
                            frozen['price'],
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
