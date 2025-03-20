import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';

class UserProvider extends ChangeNotifier {
  QueryDocumentSnapshot<Map<String, dynamic>>? _user;

  QueryDocumentSnapshot<Map<String, dynamic>>? get user => _user;

  setUser(QueryDocumentSnapshot<Map<String, dynamic>> user) {
    _user = user;
    notifyListeners();
  }

  Future<void> updateUser(
      String userId, Map<String, dynamic> updatedData) async {
    CollectionReference<Map<String, dynamic>> userCollection =
        FirebaseFirestore.instance.collection('users');

    QuerySnapshot<Map<String, dynamic>> querySnapshot = await userCollection
        .where('email', isEqualTo: updatedData["email"])
        .where('password', isEqualTo: updatedData["password"])
        .get();

    if (querySnapshot.docs.isNotEmpty) {
      _user = querySnapshot.docs.first;
      notifyListeners();
    }
  }
}
