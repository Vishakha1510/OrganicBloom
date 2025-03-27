import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:organicbloom/helpers/providers/user_provider.dart';
import 'package:organicbloom/model/cart_model.dart';
import 'package:provider/provider.dart';

class CartProvider extends ChangeNotifier {
  List<CartItem> items = [];

  // void addToCart(BuildContext context, CartItem item) {
  //   bool isExstingItem = false;
  //   CartItem? existingCartItem;
  //   for (CartItem i in items) {
  //     if (i.id == item.id) {
  //       i.qty = i.qty + 1;
  //       isExstingItem = true;
  //       break;
  //     }
  //   }

  //   if (isExstingItem == false) {
  //     items.add(item);
  //   }

  //   UserProvider userProvider =
  //       Provider.of<UserProvider>(context, listen: false);

  //   if (isExstingItem == false) {
  //     FirebaseFirestore.instance
  //         .collection('users')
  //         .doc(userProvider.user?.id)
  //         .collection("cart")
  //         .add(item.toMap());
  //   } else {}
  //   notifyListeners();
  // }
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

        // 🔹 Update Firestore quantity instead of adding duplicate entry
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

  // void removeFromCart(CartItem item) {
  //   bool needToRemove = false;
  //   for (CartItem i in items) {
  //     if (i.id == item.id) {
  //       i.qty = i.qty - 1;
  //       if (i.qty == 0) {
  //         needToRemove = true;
  //       }

  //       break;
  //     }
  //   }

  //   if (needToRemove) {
  //     items.removeWhere((i) => i.id == item.id);
  //   }

  //   notifyListeners();
  // }
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

  // double getTotalPrice() {
  //   double totoal = 0;

  //   for (CartItem i in items) {
  //     totoal = totoal + (i.qty * i.getPrice());
  //   }

  //   return totoal;
  // }
  double getTotalPrice() {
    double total = 0;

    for (CartItem i in items) {
      total += (i.qty * i.getPrice());
    }

    return total;
  }

  // void addItems(QuerySnapshot<Map<String, dynamic>> firebaseData) {
  //   for (var data in firebaseData.docs) {
  //     CartItem cartItem = CartItem.fromMap(data.data());
  //     items.add(cartItem);
  //   }
  // }
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
}
