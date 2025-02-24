import 'package:flutter/material.dart';
import 'package:organicbloom/Views/Screens/Category_screens/Fruits_category_screen.dart';
import 'package:organicbloom/Views/Screens/Category_screens/bevegares_category_screen.dart';
import 'package:organicbloom/Views/Screens/Category_screens/dairy_category_screen.dart';
import 'package:organicbloom/Views/Screens/Category_screens/pulses_category_screen.dart';
import 'package:organicbloom/Views/Screens/Category_screens/snacks_category_screen.dart';
import 'package:organicbloom/Views/Screens/Category_screens/vegetable_category_screen.dart';
import 'package:organicbloom/Views/Screens/Home_screen.dart';

class Menu_screen extends StatefulWidget {
  const Menu_screen({super.key});

  @override
  State<Menu_screen> createState() => _Menu_screenState();
}

class _Menu_screenState extends State<Menu_screen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        centerTitle: true,
        title: Text(
          "Menu",
          style: TextStyle(fontSize: 25, color: Color(0xFF1E1E1E)),
        ),
      ),
      body: GridView.count(
        padding: const EdgeInsets.all(20),
        crossAxisSpacing: 30,
        mainAxisSpacing: 40,
        crossAxisCount: 2,
        children: <Widget>[
          GestureDetector(
            onTap: () {
              Navigator.of(context).push(MaterialPageRoute(
                  builder: (context) => FruitsCategoryScreen()));
            },
            child: Container(
              height: 270,
              width: 200,
              decoration: BoxDecoration(
                  color: Colors.white38,
                  borderRadius: BorderRadius.circular(10.0)),
              child: Column(
                spacing: 15,
                children: [
                  Container(
                      height: 120,
                      width: 200,
                      child: Image(
                        image: AssetImage('assets/fruitbasket1.png'),
                        fit: BoxFit.fitWidth,
                      )),
                  Text(
                    "Fruits",
                    style: TextStyle(fontSize: 18, color: Color(0xFF1E1E1E)),
                  )
                ],
              ),
            ),
          ),
          GestureDetector(
            onTap: () {
              Navigator.of(context).push(MaterialPageRoute(
                  builder: (context) => Vegetablescategoryscreen()));
            },
            child: Container(
              height: 270,
              width: 200,
              decoration: BoxDecoration(
                  color: Colors.white38,
                  borderRadius: BorderRadius.circular(10.0)),
              child: Column(
                spacing: 15,
                children: [
                  Container(
                      height: 120,
                      width: 200,
                      child: Image(
                        image: AssetImage('assets/vegbasket1.png'),
                        fit: BoxFit.fitWidth,
                      )),
                  Text(
                    "Vegetables",
                    style: TextStyle(fontSize: 18, color: Color(0xFF1E1E1E)),
                  )
                ],
              ),
            ),
          ),
          GestureDetector(
            onTap: () {
              Navigator.of(context).push(MaterialPageRoute(
                  builder: (context) => BeveragesCategoryScreen()));
            },
            child: Container(
              height: 270,
              width: 200,
              decoration: BoxDecoration(
                  color: Colors.white38,
                  borderRadius: BorderRadius.circular(10.0)),
              child: Column(
                spacing: 15,
                children: [
                  Container(
                      height: 120,
                      width: 200,
                      child: Image(
                        image: AssetImage('assets/beverage2.png'),
                        fit: BoxFit.fitWidth,
                      )),
                  Text(
                    "Beverages",
                    style: TextStyle(fontSize: 18, color: Color(0xFF1E1E1E)),
                  )
                ],
              ),
            ),
          ),
          GestureDetector(
            onTap: () {
              Navigator.of(context).push(MaterialPageRoute(
                  builder: (context) => PulsesCategoryScreen()));
            },
            child: Container(
              height: 270,
              width: 200,
              decoration: BoxDecoration(
                  color: Colors.white38,
                  borderRadius: BorderRadius.circular(10.0)),
              child: Column(
                spacing: 15,
                children: [
                  Container(
                      height: 120,
                      width: 200,
                      child: Image(
                        image: AssetImage('assets/pulses.png'),
                        fit: BoxFit.fitWidth,
                      )),
                  Text(
                    "Grains and Pulses",
                    style: TextStyle(fontSize: 18, color: Color(0xFF1E1E1E)),
                  )
                ],
              ),
            ),
          ),
          GestureDetector(
            onTap: () {
              Navigator.of(context).push(MaterialPageRoute(
                  builder: (context) => SnacksCategoryScreen()));
            },
            child: Container(
              height: 270,
              width: 200,
              decoration: BoxDecoration(
                  color: Colors.white38,
                  borderRadius: BorderRadius.circular(10.0)),
              child: Column(
                spacing: 15,
                children: [
                  Container(
                      height: 120,
                      width: 200,
                      child: Image(
                        image: AssetImage('assets/snack2.png'),
                        fit: BoxFit.fitWidth,
                      )),
                  Text(
                    "Snacks",
                    style: TextStyle(fontSize: 18, color: Color(0xFF1E1E1E)),
                  )
                ],
              ),
            ),
          ),
          GestureDetector(
            onTap: () {
              Navigator.of(context).push(MaterialPageRoute(
                  builder: (context) => DairyCategoryScreen()));
            },
            child: Container(
              height: 270,
              width: 200,
              decoration: BoxDecoration(
                  color: Colors.white38,
                  borderRadius: BorderRadius.circular(10.0)),
              child: Column(
                spacing: 15,
                children: [
                  Container(
                      height: 120,
                      width: 200,
                      child: Image(
                        image: AssetImage('assets/dairy2.png'),
                        fit: BoxFit.fitWidth,
                      )),
                  Text(
                    "Dairy",
                    style: TextStyle(fontSize: 18, color: Color(0xFF1E1E1E)),
                  )
                ],
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
      backgroundColor: Colors.grey[100],
    );
  }
}
