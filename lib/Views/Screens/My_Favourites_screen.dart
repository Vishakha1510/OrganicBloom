// ignore_for_file: file_names

import 'package:flutter/material.dart';
import 'package:organicbloom/Views/Screens/Favourite_screen.dart';
import 'package:organicbloom/helpers/providers/favourite_provider.dart';
import 'package:provider/provider.dart';

class MyWishlistScreen extends StatefulWidget {
  const MyWishlistScreen({super.key});

  @override
  State<MyWishlistScreen> createState() => _MyWishlistScreenState();
}

class _MyWishlistScreenState extends State<MyWishlistScreen> {
  @override
  void initState() {
    super.initState();
    Provider.of<FavouriteProvider>(context, listen: false)
        .fetchFavorites(context);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: FavoritesScreen(),
    );
  }
}
