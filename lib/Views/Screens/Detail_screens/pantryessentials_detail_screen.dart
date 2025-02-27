import 'package:flutter/material.dart';
import 'package:organicbloom/helpers/providers/cart_provider.dart';
import 'package:organicbloom/helpers/providers/favourite_provider.dart';
import 'package:provider/provider.dart';

class PantryEssentialDetailScreen extends StatefulWidget {
  final Map<String, dynamic> essential;

  const PantryEssentialDetailScreen({super.key, required this.essential});

  @override
  State<PantryEssentialDetailScreen> createState() =>
      _PantryEssentialDetailScreenState();
}

class _PantryEssentialDetailScreenState
    extends State<PantryEssentialDetailScreen> {
  int quantity = 1;

  @override
  Widget build(BuildContext context) {
    var favoritesProvider = Provider.of<FavoritesProvider>(context);
    bool isFav = favoritesProvider.isFavorite(widget.essential['name']);
    return Scaffold(
      appBar: AppBar(),
      body: SafeArea(
        child: SingleChildScrollView(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              // Essential Image
              Container(
                height: 300,
                width: double.infinity,
                decoration: BoxDecoration(
                  color: Colors.grey[200],
                  borderRadius: BorderRadius.only(
                    bottomLeft: Radius.circular(30),
                    bottomRight: Radius.circular(30),
                  ),
                ),
                child: ClipRRect(
                  borderRadius: BorderRadius.only(
                    bottomLeft: Radius.circular(30),
                    bottomRight: Radius.circular(30),
                  ),
                  child: Image.asset(
                    widget.essential['image'],
                    fit: BoxFit.cover,
                  ),
                ),
              ),
              SizedBox(height: 20),

              // Name and Rating
              Padding(
                padding: const EdgeInsets.symmetric(horizontal: 16.0),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Text(
                      widget.essential['name'],
                      style: TextStyle(
                        fontSize: 26,
                        fontWeight: FontWeight.bold,
                        color: Colors.green[800],
                      ),
                    ),
                    Container(
                      padding:
                          EdgeInsets.symmetric(horizontal: 12, vertical: 6),
                      decoration: BoxDecoration(
                        color: Colors.green[50],
                        borderRadius: BorderRadius.circular(20),
                      ),
                      child: Text(
                        widget.essential['rating'],
                        style: TextStyle(
                          fontSize: 16,
                          color: Colors.green[800],
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                    ),
                  ],
                ),
              ),
              SizedBox(height: 10),

              // Price
              Padding(
                padding: const EdgeInsets.symmetric(horizontal: 16.0),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Text(
                      widget.essential['price'],
                      style: TextStyle(
                        fontSize: 24,
                        fontWeight: FontWeight.bold,
                        color: Colors.green[800],
                      ),
                    ),
                    IconButton(
                      icon: Icon(
                        isFav ? Icons.favorite : Icons.favorite_border,
                        color: isFav ? Colors.red : Colors.grey,
                        size: 35,
                      ),
                      onPressed: () {
                        var favoriteProvider = Provider.of<FavoritesProvider>(
                            context,
                            listen: false);
                        if (isFav) {
                          favoriteProvider
                              .removeFavorite(widget.essential['name']);
                        } else {
                          favoriteProvider.addFavorite({
                            'name': widget.essential['name'],
                            'image': widget.essential['image'],
                            'price': widget.essential['price'],
                          });
                        }
                      },
                    )
                  ],
                ),
              ),
              SizedBox(height: 20),

              // Description
              Padding(
                padding: const EdgeInsets.symmetric(horizontal: 16.0),
                child: Text(
                  "Description",
                  style: TextStyle(
                    fontSize: 20,
                    fontWeight: FontWeight.bold,
                    color: Colors.green[800],
                  ),
                ),
              ),
              SizedBox(height: 10),
              Padding(
                padding: const EdgeInsets.symmetric(horizontal: 16.0),
                child: Text(
                  widget.essential['description'],
                  style: TextStyle(
                    fontSize: 16,
                    color: Colors.grey[700],
                  ),
                ),
              ),
              SizedBox(height: 20),

              // Nutritional Information
              Padding(
                padding: const EdgeInsets.symmetric(horizontal: 16.0),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceAround,
                  children: [
                    for (var nutrient in widget.essential['nutrition'].entries)
                      Column(
                        children: [
                          Text(
                            nutrient.key,
                            style: TextStyle(
                              fontSize: 16,
                              fontWeight: FontWeight.bold,
                              color: Colors.green[800],
                            ),
                          ),
                          SizedBox(height: 5),
                          Text(
                            nutrient.value,
                            style: TextStyle(
                              fontSize: 14,
                              color: Colors.grey[700],
                            ),
                          ),
                        ],
                      ),
                  ],
                ),
              ),

              SizedBox(height: 20),

              // Quantity Selector
              Padding(
                padding: const EdgeInsets.symmetric(horizontal: 16.0),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Text(
                      "Quantity",
                      style: TextStyle(
                        fontSize: 20,
                        fontWeight: FontWeight.bold,
                        color: Colors.green[800],
                      ),
                    ),
                    Row(
                      children: [
                        IconButton(
                          onPressed: () {
                            if (quantity > 1) {
                              setState(() {
                                quantity--;
                              });
                            }
                          },
                          icon: Icon(Icons.remove, color: Colors.green[800]),
                        ),
                        Text(
                          quantity.toString(),
                          style: TextStyle(
                            fontSize: 18,
                            fontWeight: FontWeight.bold,
                            color: Colors.green[800],
                          ),
                        ),
                        IconButton(
                          onPressed: () {
                            setState(() {
                              quantity++;
                            });
                          },
                          icon: Icon(Icons.add, color: Colors.green[800]),
                        ),
                      ],
                    ),
                  ],
                ),
              ),

              SizedBox(height: 20),

              // Add to Cart Button
              Padding(
                padding: const EdgeInsets.symmetric(horizontal: 16.0),
                child: GestureDetector(
                  onTap: () {
                    var cartProvider =
                        Provider.of<CartProvider>(context, listen: false);

                    // Convert price
                    double price = double.tryParse(widget.essential['price']
                                .replaceAll(RegExp(r'[^0-9]'), ''))
                            ?.toDouble() ??
                        0.0;

                    cartProvider.addToCart(
                      widget.essential['id'].toString(),
                      widget.essential['name'].toString(),
                      price,
                      quantity,
                      widget.essential['image'].toString(),
                    );

                    ScaffoldMessenger.of(context).showSnackBar(
                      SnackBar(
                          content: Text(
                              "${widget.essential['name']} added to cart!")),
                    );
                  },
                  child: Container(
                    width: double.infinity,
                    height: 50,
                    decoration: BoxDecoration(
                      color: Colors.green[800],
                      borderRadius: BorderRadius.circular(10),
                    ),
                    child: Center(
                      child: Text(
                        "Add to Cart",
                        style: TextStyle(
                          fontSize: 18,
                          color: Colors.white,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                    ),
                  ),
                ),
              ),
              SizedBox(height: 20),
            ],
          ),
        ),
      ),
    );
  }
}
