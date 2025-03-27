// ignore_for_file: file_names, library_private_types_in_public_api

import 'package:flutter/material.dart';

class FavoritesScreen extends StatefulWidget {
  const FavoritesScreen({super.key});

  @override
  _FavoritesScreenState createState() => _FavoritesScreenState();
}

class _FavoritesScreenState extends State<FavoritesScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        foregroundColor: Colors.white,
        backgroundColor: Color(0xFFA5CC65),
        centerTitle: true,
        title: Text("Favourites", style: TextStyle(fontSize: 25)),
      ),
    );
  }
}
