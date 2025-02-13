import 'package:flutter/material.dart';
import 'package:organicbloom/Views/Screens/Chat_withus_screen.dart';
import 'package:organicbloom/Views/Screens/Edit_profile_screen.dart';
import 'package:organicbloom/Views/Screens/Home_screen.dart';
import 'package:organicbloom/Views/Screens/Intro_screen.dart';
import 'package:organicbloom/Views/Screens/Mail_to_us_screen.dart';
import 'package:organicbloom/Views/Screens/My_Address_screen.dart';
import 'package:organicbloom/Views/Screens/My_Orders_screen.dart';
import 'package:organicbloom/Views/Screens/My_Wishlist_screen.dart';
import 'package:organicbloom/Views/Screens/Talk_to_our_support_screen.dart';

class Profile_screen extends StatefulWidget {
  const Profile_screen({super.key});

  @override
  State<Profile_screen> createState() => _Profile_screenState();
}

class _Profile_screenState extends State<Profile_screen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        centerTitle: true,
        title: Text(
          "More",
          style: TextStyle(fontSize: 25, color: Color(0xFF1E1E1E)),
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
                  backgroundImage: NetworkImage(
                      "https://images.freeimages.com/images/large-previews/8f6/rainbow-of-god-1190463.jpg?fmt=webp&w=500"),
                ),
                Column(
                  children: [Text("Username"), Text(" Contact no.")],
                )
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
                title: Text("My Wishlist")),
            Divider(),
            ListTile(
                onTap: () {
                  Navigator.of(context).push(MaterialPageRoute(
                      builder: (context) => ChatWithusScreen()));
                },
                leading: Icon(
                  Icons.messenger_outline,
                  color: Color(0xFFA5CC65),
                ),
                title: Text("Chat with us")),
            Divider(),
            ListTile(
                onTap: () {
                  Navigator.of(context).push(MaterialPageRoute(
                      builder: (context) => TalkToOurSupportScreen()));
                },
                leading: Icon(
                  Icons.call_outlined,
                  color: Colors.orange,
                ),
                title: Text("Talk to our Support")),
            Divider(),
            ListTile(
                onTap: () {
                  Navigator.of(context).push(MaterialPageRoute(
                      builder: (context) => MailToUsScreen()));
                },
                leading: Icon(
                  Icons.mail_outline,
                  color: Colors.black,
                ),
                title: Text("Mail to us")),
            Divider(),
            ListTile(
                onTap: () {
                  Navigator.of(context).push(
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
      bottomNavigationBar: NavigationBar(
        selectedIndex: selectbottomitemindex,
        onDestinationSelected: (val) {
          setState(() {
            selectbottomitemindex = val;
            switch (selectbottomitemindex) {
              case 0:
                Navigator.of(context).pushNamed('/');
                break;
              case 1:
                Navigator.of(context).pushNamed('favourite');
                break;
              case 2:
                Navigator.of(context).pushNamed('search');
                break;
              case 3:
                Navigator.of(context).pushNamed('profile');
                break;
              case 4:
                Navigator.of(context).pushNamed('menu');
                break;
            }
          });
        },
        destinations: const [
          NavigationDestination(
            icon: Icon(Icons.home),
            label: 'Home',
          ),
          NavigationDestination(
            icon: Icon(Icons.favorite_outline),
            label: 'Favourite',
          ),
          NavigationDestination(
            icon: Icon(Icons.search),
            label: 'Search',
          ),
          NavigationDestination(
            icon: Icon(Icons.person_pin),
            label: 'Profile',
          ),
          NavigationDestination(
            icon: Icon(Icons.menu),
            label: 'Menu',
          ),
        ],
      ),
    );
  }
}
