// ignore_for_file: file_names, camel_case_types

import 'package:flutter/material.dart';
import 'package:organicbloom/Views/Screens/Edit_profile_screen.dart';
import 'package:organicbloom/Views/Screens/Intro_screen.dart';
import 'package:organicbloom/Views/Screens/My_Address_screen.dart';
import 'package:organicbloom/Views/Screens/My_Orders_screen.dart';
import 'package:organicbloom/Views/Screens/My_Wishlist_screen.dart';
import 'package:organicbloom/helpers/providers/cart_provider.dart';
import 'package:organicbloom/helpers/providers/user_provider.dart';
import 'package:provider/provider.dart';
import 'package:url_launcher/url_launcher.dart';

class Profile_screen extends StatefulWidget {
  const Profile_screen({super.key});

  @override
  State<Profile_screen> createState() => _Profile_screenState();
}

class _Profile_screenState extends State<Profile_screen> {
  UserProvider? userProvider;

  @override
  Widget build(BuildContext context) {
    userProvider = Provider.of<UserProvider>(context);
    return Scaffold(
      appBar: AppBar(
        centerTitle: true,
        backgroundColor: Color(0xFFA5CC65),
        foregroundColor: Colors.white,
        title: Text(
          "More",
          style: TextStyle(fontSize: 25),
        ),
      ),
      body: SingleChildScrollView(
        scrollDirection: Axis.vertical,
        child: Column(
          children: [
            Divider(),
            Row(
              spacing: 20,
              mainAxisAlignment: MainAxisAlignment.start,
              children: [
                SizedBox(width: 5),
                CircleAvatar(
                  radius: 40,
                  child: Icon(
                    Icons.person,
                    size: 50,
                  ),
                ),
                Text(userProvider?.user?.data()["email"])
              ],
            ),
            SizedBox(height: 20),
            ListTile(
                onTap: () {
                  Navigator.of(context).push(MaterialPageRoute(
                      builder: (context) => EditProfileScreen()));
                },
                leading: Icon(
                  Icons.edit,
                  color: Colors.blue,
                ),
                title: Text("Edit Profile")),
            Divider(),
            ListTile(
                onTap: () {
                  Navigator.of(context).push(MaterialPageRoute(
                      builder: (context) => MyAddressScreen()));
                },
                leading: Icon(Icons.location_on_outlined, color: Colors.black),
                title: Text("My Address")),
            Divider(),
            ListTile(
                onTap: () {
                  Navigator.of(context).push(MaterialPageRoute(
                      builder: (context) => MyOrdersScreen()));
                },
                leading: Icon(
                  Icons.shopping_basket_outlined,
                  color: Colors.black,
                ),
                title: Text("My Orders")),
            Divider(),
            ListTile(
                onTap: () {
                  Navigator.of(context).push(MaterialPageRoute(
                      builder: (context) => MyWishlistScreen()));
                },
                leading: Icon(
                  Icons.bolt_outlined,
                  color: Colors.black,
                ),
                title: Text("My Favourites")),
            Divider(),
            ListTile(
                onTap: () async {
                  final Uri phoneUri = Uri(scheme: "tel", path: "7778963970");

                  if (await canLaunchUrl(phoneUri)) {
                    await launchUrl(phoneUri);
                  } else {
                    debugPrint("Could not launch phone call");
                  }
                },
                leading: Icon(
                  Icons.call_outlined,
                  color: Colors.orange,
                ),
                title: Text("Talk to our Support")),
            Divider(),
            ListTile(
                onTap: () async {
                  Uri emailUri =
                      Uri(scheme: "mailto", path: "vkpatel1503@gmail.com");

                  if (await canLaunchUrl(emailUri)) {
                    await launchUrl(emailUri);
                  } else {
                    debugPrint("Could not launch email");
                  }
                },
                leading: Icon(
                  Icons.mail_outline,
                  color: Colors.black,
                ),
                title: Text("Mail to us")),
            Divider(),
            ListTile(
                onTap: () {
                  CartProvider cartProvider =
                      Provider.of<CartProvider>(context, listen: false);

                  cartProvider.clearItems();
                  Navigator.of(context).pushReplacement(
                      MaterialPageRoute(builder: (context) => Intro_screen()));
                },
                leading: Icon(
                  Icons.logout,
                  color: Colors.red,
                ),
                title: Text("Log out")),
          ],
        ),
      ),
    );
  }
}
