// ignore_for_file: file_names, library_private_types_in_public_api

import 'package:flutter/material.dart';
import 'package:organicbloom/helpers/providers/favourite_provider.dart';
import 'package:provider/provider.dart';

class FavoritesScreen extends StatefulWidget {
  const FavoritesScreen({super.key});

  @override
  _FavoritesScreenState createState() => _FavoritesScreenState();
}

class _FavoritesScreenState extends State<FavoritesScreen> {
  @override
  void initState() {
    super.initState();
    Provider.of<FavouriteProvider>(context, listen: false)
        .fetchFavorites(context);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        foregroundColor: Colors.white,
        backgroundColor: const Color(0xFFA5CC65),
        centerTitle: true,
        title: Text("Favorites", style: TextStyle(fontSize: 25)),
        elevation: 4,
      ),
      body: Consumer<FavouriteProvider>(
        builder: (context, favProvider, child) {
          if (favProvider.favouriteItems.isEmpty) {
            return Center(
              child: Text(
                "No favorites added yet!",
                style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
              ),
            );
          }

          return Column(
            children: [
              Expanded(
                flex: 10,
                child: ListView.builder(
                  padding: EdgeInsets.symmetric(vertical: 10, horizontal: 16),
                  itemCount: favProvider.favouriteItems.length,
                  itemBuilder: (context, index) {
                    final item = favProvider.favouriteItems[index];

                    return AnimatedContainer(
                      duration: Duration(milliseconds: 300),
                      margin: EdgeInsets.only(bottom: 12),
                      decoration: BoxDecoration(
                        color: Colors.white,
                        borderRadius: BorderRadius.circular(12),
                        boxShadow: [
                          BoxShadow(
                            color: Colors.grey.withOpacity(0.2),
                            blurRadius: 5,
                            spreadRadius: 2,
                            offset: Offset(0, 3),
                          ),
                        ],
                      ),
                      child: ListTile(
                        contentPadding:
                            EdgeInsets.symmetric(horizontal: 16, vertical: 12),
                        leading: ClipRRect(
                          borderRadius: BorderRadius.circular(10),
                          child: Image.network(
                            item.itemData["image"],
                            height: 60,
                            width: 60,
                            fit: BoxFit.cover,
                          ),
                        ),
                        title: Text(
                          item.itemData["name"],
                          style: TextStyle(
                              fontSize: 18, fontWeight: FontWeight.bold),
                        ),
                        subtitle: Text(
                          "₹${item.getPrice()}",
                          style: TextStyle(
                            fontSize: 16,
                            fontWeight: FontWeight.w600,
                            color: Colors.green,
                          ),
                        ),
                        trailing: IconButton(
                          icon: Icon(Icons.favorite, color: Colors.red),
                          onPressed: () {
                            favProvider.removeFromFavorites(context, item);
                          },
                        ),
                      ),
                    );
                  },
                ),
              ),
              Expanded(
                  flex: 0,
                  child: OutlinedButton.icon(
                    onPressed: () {
                      favProvider.clearFavorites(context);
                    },
                    label: Text("Remove All"),
                    icon: Icon(Icons.delete),
                  ))
            ],
          );
        },
      ),
    );
  }
}
