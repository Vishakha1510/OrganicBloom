import 'package:flutter/material.dart';
import 'package:organicbloom/Views/Screens/Home_screen.dart';

class Search_screen extends StatefulWidget {
  const Search_screen({super.key});

  @override
  State<Search_screen> createState() => _Search_screenState();
}

class _Search_screenState extends State<Search_screen> {

  
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        centerTitle: true,
        title: Text(
                    "Search",
                    style: TextStyle(fontSize: 25,color: Color(0xFF1E1E1E)),
                    ),
               actions: [
                        IconButton(
                        onPressed:(){
                          Navigator.of(context).pushNamed('cart');
                        } ,
                        icon:Icon(Icons.shopping_bag_rounded,color: Color(0xFF1E1E1E),))
                ],     
      ),
      body: Column(
        children: [
          SizedBox(height: 20),
          Padding(
            padding: const EdgeInsets.all(20.0),
            child: TextField(
              decoration: InputDecoration(
                border: OutlineInputBorder(),
                prefixIcon: Icon(Icons.search),
                labelText: "Search",labelStyle: TextStyle(color: Color(0xFFA5CC65))
              ),
            ),
          ),
        ],
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