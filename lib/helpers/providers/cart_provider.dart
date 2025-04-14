import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:organicbloom/helpers/providers/user_provider.dart';
import 'package:organicbloom/model/cart_model.dart';
import 'package:provider/provider.dart';

class CartProvider extends ChangeNotifier {
  List<CartItem> items = [];

  void addToCart(BuildContext context, CartItem item) async {
    UserProvider userProvider =
        Provider.of<UserProvider>(context, listen: false);
    String userId = userProvider.user?.id ?? '';

    if (userId.isEmpty) return;

    bool isExistingItem = false;

    for (CartItem i in items) {
      if (i.id == item.id) {
        i.qty += 1;
        isExistingItem = true;

        QuerySnapshot<Map<String, dynamic>> snapshot = await FirebaseFirestore
            .instance
            .collection('users')
            .doc(userId)
            .collection("cart")
            .where("id", isEqualTo: item.id)
            .get();

        if (snapshot.docs.isNotEmpty) {
          await snapshot.docs.first.reference.update({"qty": i.qty});
        }
        break;
      }
    }

    if (!isExistingItem) {
      items.add(item);
      await FirebaseFirestore.instance
          .collection('users')
          .doc(userId)
          .collection("cart")
          .add(item.toMap());
    }

    notifyListeners();
  }

  void removeFromCart(BuildContext context, CartItem item) async {
    UserProvider userProvider =
        Provider.of<UserProvider>(context, listen: false);
    String userId = userProvider.user?.id ?? '';

    if (userId.isEmpty) return;

    bool needToRemove = false;

    for (CartItem i in items) {
      if (i.id == item.id) {
        i.qty -= 1;
        if (i.qty == 0) {
          needToRemove = true;
        }
        break;
      }
    }

    if (needToRemove) {
      items.removeWhere((i) => i.id == item.id);

      QuerySnapshot<Map<String, dynamic>> snapshot = await FirebaseFirestore
          .instance
          .collection('users')
          .doc(userId)
          .collection("cart")
          .where("id", isEqualTo: item.id)
          .get();

      if (snapshot.docs.isNotEmpty) {
        await snapshot.docs.first.reference.delete();
      }
    } else {
      QuerySnapshot<Map<String, dynamic>> snapshot = await FirebaseFirestore
          .instance
          .collection('users')
          .doc(userId)
          .collection("cart")
          .where("id", isEqualTo: item.id)
          .get();

      if (snapshot.docs.isNotEmpty) {
        await snapshot.docs.first.reference.update({"qty": item.qty});
      }
    }

    notifyListeners();
  }

  double getTotalPrice() {
    double total = 0;

    for (CartItem i in items) {
      total += (i.qty * i.getPrice());
    }

    return total;
  }

  void addItems(QuerySnapshot<Map<String, dynamic>> firebaseData) {
    for (var data in firebaseData.docs) {
      CartItem cartItem = CartItem.fromMap(data.data());

      if (!items.any((item) => item.id == cartItem.id)) {
        items.add(cartItem);
      }
    }
  }

  void clearItems() {
    items.clear();
    notifyListeners();
  }

  Future<void> placeOrder(BuildContext context) async {
    // order add
    await addOrder(context);

    clearItems();

    await deleteAllCartItems(context);
  }

  Future<void> addOrder(BuildContext context) async {
    UserProvider userProvider =
        Provider.of<UserProvider>(context, listen: false);
    String userId = userProvider.user?.id ?? '';

    if (userId.isEmpty) return;

    if (items.isEmpty) return;

    Map<String, dynamic> orderData = {
      "items": items.map((item) => item.toMap()).toList(),
      "total": getTotalPrice(),
      "created_at": DateTime.now().toString(),
      "order_id": DateTime.now().microsecondsSinceEpoch
    };

    await FirebaseFirestore.instance
        .collection('users')
        .doc(userId)
        .collection("order")
        .add(orderData);

    notifyListeners();
  }

  Future<void> deleteAllCartItems(BuildContext context) async {
    UserProvider userProvider =
        Provider.of<UserProvider>(context, listen: false);
    String userId = userProvider.user?.id ?? '';

    if (userId.isEmpty) return;

    QuerySnapshot<Map<String, dynamic>> snapshot = await FirebaseFirestore
        .instance
        .collection('users')
        .doc(userId)
        .collection("cart")
        .get();

    if (snapshot.docs.isNotEmpty) {
      for (var cartItems in snapshot.docs) {
        await cartItems.reference.delete();
      }
    }
  }

  Future<List<Map<String, dynamic>>> getOrderList(BuildContext context) async {
    UserProvider userProvider =
        Provider.of<UserProvider>(context, listen: false);
    String userId = userProvider.user?.id ?? '';

    if (userId.isEmpty) return [];

    QuerySnapshot<Map<String, dynamic>> orderList = await FirebaseFirestore
        .instance
        .collection('users')
        .doc(userId)
        .collection("order")
        .get();

    List<Map<String, dynamic>> data =
        orderList.docs.map((element) => element.data()).toList();
    return data;
  }
}
