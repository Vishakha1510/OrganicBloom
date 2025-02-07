import 'package:flutter/material.dart';
import 'package:organicbloom/Views/Screens/Home_screen.dart';

class Favourite_screen extends StatefulWidget {
  const Favourite_screen({super.key});

  @override
  State<Favourite_screen> createState() => _Favourite_screenState();
}

class _Favourite_screenState extends State<Favourite_screen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        centerTitle: true,
        title: Text(
          "Favourite",
          style: TextStyle(fontSize: 25, color: Color(0xFF1E1E1E)),
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
