// ignore_for_file: library_private_types_in_public_api

import 'package:flutter/material.dart';
import 'package:organicbloom/Views/Screens/Favourite_screen.dart';
import 'package:organicbloom/Views/Screens/Home_screen.dart';
import 'package:organicbloom/Views/Screens/Search_screen.dart';
import 'package:organicbloom/Views/Screens/Profile_screen.dart';

class MainNavigationScreen extends StatefulWidget {
  const MainNavigationScreen({super.key});

  @override
  _MainNavigationScreenState createState() => _MainNavigationScreenState();
}

class _MainNavigationScreenState extends State<MainNavigationScreen> {
  int _currentIndex = 0;

  final List<Widget> _screens = [
    Home_screen(),
    FavoritesScreen(),
    SearchScreen(),
    Profile_screen(),
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: IndexedStack(
        index: _currentIndex,
        children: _screens,
      ),
      bottomNavigationBar: Container(
        decoration: BoxDecoration(
          color: Colors.white,
          boxShadow: [
            BoxShadow(
              color: Colors.black12,
              blurRadius: 8,
              spreadRadius: 1,
            ),
          ],
        ),
        child: ClipRRect(
          borderRadius: BorderRadius.only(
            topLeft: Radius.circular(16),
            topRight: Radius.circular(16),
          ),
          child: BottomNavigationBar(
            currentIndex: _currentIndex,
            onTap: (index) {
              setState(() {
                _currentIndex = index;
              });
            },
            type: BottomNavigationBarType.fixed,
            selectedItemColor: Colors.green.shade700,
            unselectedItemColor: Colors.grey,
            backgroundColor: Colors.white,
            showUnselectedLabels: true,
            selectedFontSize: 14,
            unselectedFontSize: 12,
            elevation: 10,
            items: [
              _navBarItem(Icons.home, "Home", 0),
              _navBarItem(Icons.favorite, "Favourites", 1),
              _navBarItem(Icons.search, "Search", 2),
              _navBarItem(Icons.person, "Profile", 3),
            ],
          ),
        ),
      ),
    );
  }

  BottomNavigationBarItem _navBarItem(IconData icon, String label, int index) {
    return BottomNavigationBarItem(
      icon: AnimatedContainer(
        duration: Duration(milliseconds: 300),
        padding: EdgeInsets.all(_currentIndex == index ? 6 : 0),
        decoration: BoxDecoration(
          color: _currentIndex == index
              ? Colors.green.shade50
              : Colors.transparent,
          shape: BoxShape.circle,
        ),
        child: Icon(
          icon,
          size: _currentIndex == index ? 28 : 24,
        ),
      ),
      label: label,
    );
  }
}
