import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:organicbloom/helpers/providers/user_provider.dart';
import 'package:organicbloom/model/cart_model.dart';
import 'package:provider/provider.dart';

class FavouriteProvider extends ChangeNotifier {
  List<CartItem> favouriteItems = [];

  //  Add to Favorites
  Future<void> addToFavorites(BuildContext context, CartItem item) async {
    UserProvider userProvider =
        Provider.of<UserProvider>(context, listen: false);
    String userId = userProvider.user?.id ?? '';

    if (userId.isEmpty) return;

    bool isExistingItem =
        favouriteItems.any((favItem) => favItem.id == item.id);

    if (!isExistingItem) {
      favouriteItems.add(item);

      await FirebaseFirestore.instance
          .collection('users')
          .doc(userId)
          .collection("favorites")
          .doc(item.id)
          .set(item.toMap());
    }

    notifyListeners();
  }

  //  Remove from Favorites
  Future<void> removeFromFavorites(BuildContext context, CartItem item) async {
    UserProvider userProvider =
        Provider.of<UserProvider>(context, listen: false);
    String userId = userProvider.user?.id ?? '';

    if (userId.isEmpty) return;

    favouriteItems.removeWhere((favItem) => favItem.id == item.id);

    await FirebaseFirestore.instance
        .collection('users')
        .doc(userId)
        .collection("favorites")
        .doc(item.id)
        .delete();

    notifyListeners();
  }

  //  Load Favorites from Firestore
  Future<void> fetchFavorites(BuildContext context) async {
    UserProvider userProvider =
        Provider.of<UserProvider>(context, listen: false);
    String userId = userProvider.user?.id ?? '';

    if (userId.isEmpty) return;

    QuerySnapshot<Map<String, dynamic>> snapshot = await FirebaseFirestore
        .instance
        .collection('users')
        .doc(userId)
        .collection("favorites")
        .get();

    favouriteItems =
        snapshot.docs.map((doc) => CartItem.fromMap(doc.data())).toList();

    notifyListeners();
  }

  //  Check if an item is in favorites
  bool isFavorite(String itemId) {
    return favouriteItems.any((favItem) => favItem.id == itemId);
  }

  //  Clear All Favorites
  Future<void> clearFavorites(BuildContext context) async {
    UserProvider userProvider =
        Provider.of<UserProvider>(context, listen: false);
    String userId = userProvider.user?.id ?? '';

    if (userId.isEmpty) return;

    favouriteItems.clear();

    await FirebaseFirestore.instance
        .collection('users')
        .doc(userId)
        .collection("favorites")
        .get()
        .then((snapshot) {
      for (var doc in snapshot.docs) {
        doc.reference.delete();
      }
    });

    notifyListeners();
  }
}
