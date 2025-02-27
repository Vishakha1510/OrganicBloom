import 'package:flutter/material.dart';

class FavoritesProvider extends ChangeNotifier {
  final List<Map<String, dynamic>> _favorites = [];

  List<Map<String, dynamic>> get favorites => _favorites;

  void addFavorite(Map<String, dynamic> item) {
    if (!_favorites.any((element) => element['name'] == item['name'])) {
      _favorites.add(item);
      notifyListeners();
    }
  }

  void removeFavorite(String name) {
    _favorites.removeWhere((item) => item['name'] == name);
    notifyListeners();
  }

  bool isFavorite(String name) {
    return _favorites.any((item) => item['name'] == name);
  }
}
