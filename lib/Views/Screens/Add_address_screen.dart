// ignore_for_file: file_names, use_build_context_synchronously, avoid_print

import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:organicbloom/helpers/providers/user_provider.dart';
import 'package:provider/provider.dart';

class AddAddressScreen extends StatefulWidget {
  const AddAddressScreen({super.key});

  @override
  State<AddAddressScreen> createState() => _AddAddressScreenState();
}

class _AddAddressScreenState extends State<AddAddressScreen> {
  TextEditingController flat = TextEditingController();
  TextEditingController area = TextEditingController();
  TextEditingController landmark = TextEditingController();
  TextEditingController pincode = TextEditingController();
  TextEditingController city = TextEditingController();
  TextEditingController state = TextEditingController();

  UserProvider? userProvider;

  @override
  Widget build(BuildContext context) {
    userProvider = Provider.of<UserProvider>(context);
    return Scaffold(
        appBar: AppBar(
          foregroundColor: Colors.white,
          backgroundColor: Color(0xFFA5CC65),
          centerTitle: true,
          title: Text("ADD NEW ADDRESS"),
        ),
        body: _buildbody());
  }

  Widget _buildbody() {
    return Padding(
      padding: EdgeInsets.all(12.0),
      child: SingleChildScrollView(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text("Flat, House no., Building, Company"),
            SizedBox(height: 5),
            TextField(
                controller: flat,
                decoration: InputDecoration(border: OutlineInputBorder())),
            SizedBox(height: 10),
            Text("Area, Street, Sector, Village"),
            SizedBox(height: 5),
            TextField(
                controller: area,
                decoration: InputDecoration(border: OutlineInputBorder())),
            SizedBox(height: 10),
            Text("Landmark"),
            SizedBox(height: 5),
            TextField(
                controller: landmark,
                decoration: InputDecoration(border: OutlineInputBorder())),
            SizedBox(height: 10),
            Row(
              children: [
                Expanded(
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text("Pincode"),
                      SizedBox(height: 5),
                      TextField(
                          controller: pincode,
                          decoration:
                              InputDecoration(border: OutlineInputBorder())),
                    ],
                  ),
                ),
                SizedBox(width: 10),
                Expanded(
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text("Town/City"),
                      SizedBox(height: 5),
                      TextField(
                          controller: city,
                          decoration:
                              InputDecoration(border: OutlineInputBorder())),
                    ],
                  ),
                ),
              ],
            ),
            SizedBox(height: 10),
            Text("State"),
            SizedBox(height: 5),
            TextField(
                controller: state,
                decoration: InputDecoration(border: OutlineInputBorder())),
            SizedBox(height: 20),
            SizedBox(
              width: double.infinity,
              child: ElevatedButton(
                onPressed: () {
                  addaddress();
                },
                style: ElevatedButton.styleFrom(
                  backgroundColor: Color(0xFFA5CC65),
                  foregroundColor: Colors.white,
                  padding: EdgeInsets.symmetric(vertical: 12),
                ),
                child: Text("Add Address"),
              ),
            ),
          ],
        ),
      ),
    );
  }

  void addaddress() async {
    if (flat.text.isEmpty ||
        area.text.isEmpty ||
        landmark.text.isEmpty ||
        pincode.text.isEmpty ||
        city.text.isEmpty ||
        state.text.isEmpty) {
      ScaffoldMessenger.of(context).showSnackBar(
          SnackBar(content: Center(child: Text("Fields cannot be empty!!"))));
    } else {
      try {
        await FirebaseFirestore.instance
            .collection('users')
            .doc(userProvider?.user?.id)
            .collection("addresses")
            .add({
          "flat": flat.text,
          "area": area.text,
          "landmark": landmark.text,
          "pincode": pincode.text,
          "city": city.text,
          "state": state.text
        });
      } catch (error) {
        print(error);
      }

      ScaffoldMessenger.of(context).showSnackBar(SnackBar(
          backgroundColor: Color((0xFFA5CC65)),
          content: Center(
              child: Text(
            "New address added!!!",
            style: TextStyle(fontWeight: FontWeight.bold),
          ))));

      Navigator.of(context).pop();
    }
  }
}
