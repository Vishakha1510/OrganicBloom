import 'package:flutter/material.dart';
import 'package:organicbloom/Lists/Beverages_list.dart';
import 'package:organicbloom/Views/Screens/Detail_screens/beverages_detail_screen.dart';
import 'package:organicbloom/helpers/providers/cart_provider.dart';
import 'package:provider/provider.dart';

class BeveragesCategoryScreen extends StatefulWidget {
  const BeveragesCategoryScreen({super.key});

  @override
  State<BeveragesCategoryScreen> createState() =>
      _BeveragesCategoryScreenState();
}

class _BeveragesCategoryScreenState extends State<BeveragesCategoryScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        centerTitle: true,
        title: const Text("BEVERAGES"),
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
          itemCount: 10,
          itemBuilder: (context, index) {
            final beverage = beverages[index];
            return GestureDetector(
              onTap: () {
                Navigator.of(context).push(MaterialPageRoute(
                    builder: (context) => BeveragesDetailScreen(
                          beverage: beverage,
                        )));
              },
              child: Container(
                decoration: BoxDecoration(
                  color: Colors.white,
                  borderRadius: BorderRadius.circular(10),
                ),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    //  Image
                    ClipRRect(
                      borderRadius: const BorderRadius.vertical(
                        top: Radius.circular(10),
                      ),
                      child: Image.asset(
                        beverage['image'],
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
                          // Name
                          Row(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: [
                              Text(
                                beverage['name'],
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
                                  String Id = beverage.containsKey('id')
                                      ? beverage['id'].toString()
                                      : DateTime.now()
                                          .millisecondsSinceEpoch
                                          .toString();

                                  // Convert price safely
                                  double price = double.tryParse(
                                              beverage['price'].replaceAll(
                                                  RegExp(r'[^0-9]'), ''))
                                          ?.toDouble() ??
                                      0.0;

                                  // Add item to cart
                                  cartProvider.addToCart(
                                    Id,
                                    beverage['name'].toString(),
                                    price,
                                    1, // Default quantity to 1 for now
                                    beverage['image'].toString(),
                                  );

                                  // Show confirmation
                                  ScaffoldMessenger.of(context).showSnackBar(
                                    SnackBar(
                                        content: Text(
                                            "${beverage['name']} added to cart!")),
                                  );
                                },
                                icon: const Icon(Icons.add, size: 30),
                              ),
                            ],
                          ),
                          const SizedBox(height: 5),
                          // Rating
                          Text(
                            beverage['rating'],
                            style: const TextStyle(
                              fontSize: 14,
                              color: Colors.black54,
                            ),
                          ),
                          const SizedBox(height: 5),
                          // Price
                          Text(
                            beverage['price'],
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
