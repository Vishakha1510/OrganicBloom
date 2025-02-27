import 'package:flutter/material.dart';
import 'package:organicbloom/Lists/Nutsandseed_list.dart';
import 'package:organicbloom/Views/Screens/Detail_screens/nutsandseeds_detail_screen.dart';
import 'package:organicbloom/helpers/providers/cart_provider.dart';
import 'package:provider/provider.dart';

class NutsandseedsCategoryScreen extends StatefulWidget {
  const NutsandseedsCategoryScreen({super.key});

  @override
  State<NutsandseedsCategoryScreen> createState() =>
      _NutsandseedsCategoryScreenState();
}

class _NutsandseedsCategoryScreenState
    extends State<NutsandseedsCategoryScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        centerTitle: true,
        title: const Text("NUTS AND SEEDS"),
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
          itemCount: nutsAndSeeds.length,
          itemBuilder: (context, index) {
            final nutseed = nutsAndSeeds[index];
            return GestureDetector(
              onTap: () {
                Navigator.of(context).push(MaterialPageRoute(
                    builder: (context) =>
                        NutsAndSeedsDetailScreen(nutOrSeedItem: nutseed)));
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
                        nutseed['image'],
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
                                nutseed['name'],
                                style: const TextStyle(
                                  fontSize: 14,
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
                                  String Id = nutseed.containsKey('id')
                                      ? nutseed['id'].toString()
                                      : DateTime.now()
                                          .millisecondsSinceEpoch
                                          .toString();

                                  // Convert price safely
                                  double price = double.tryParse(
                                              nutseed['price'].replaceAll(
                                                  RegExp(r'[^0-9]'), ''))
                                          ?.toDouble() ??
                                      0.0;

                                  // Add item to cart
                                  cartProvider.addToCart(
                                    Id,
                                    nutseed['name'].toString(),
                                    price,
                                    1, // Default quantity to 1 for now
                                    nutseed['image'].toString(),
                                  );

                                  // Show confirmation
                                  ScaffoldMessenger.of(context).showSnackBar(
                                    SnackBar(
                                        content: Text(
                                            "${nutseed['name']} added to cart!")),
                                  );
                                },
                                icon: const Icon(Icons.add, size: 30),
                              ),
                            ],
                          ),
                          const SizedBox(height: 5),
                          // Rating
                          Text(
                            nutseed['rating'],
                            style: const TextStyle(
                              fontSize: 14,
                              color: Colors.black54,
                            ),
                          ),
                          const SizedBox(height: 5),
                          // Price
                          Text(
                            nutseed['price'],
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
