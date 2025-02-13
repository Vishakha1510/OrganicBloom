import 'package:flutter/material.dart';
import 'package:organicbloom/Lists/Fruits_list.dart';
import 'package:organicbloom/Views/Screens/Detail_screens/fruit_detail_screen.dart';
import 'package:organicbloom/Views/Screens/Fruits_category_screen.dart';
import 'package:organicbloom/Views/Screens/bevegares_category_screen.dart';
import 'package:organicbloom/Views/Screens/dairy_category_screen.dart';
import 'package:organicbloom/Views/Screens/pulses_category_screen.dart';
import 'package:organicbloom/Views/Screens/snacks_category_screen.dart';
import 'package:organicbloom/Views/Screens/vegetable_category_screen.dart';

int selectbottomitemindex = 0;

class Home_screen extends StatefulWidget {
  const Home_screen({super.key});

  @override
  State<Home_screen> createState() => _Home_screenState();
}

class _Home_screenState extends State<Home_screen> {
  bool _isBasketVisible = false;
  List<String> _cartItems = [];

  void _addToCart(String productName) {
    setState(() {
      _cartItems.add(productName);
      _isBasketVisible = true;
    });

    Future.delayed(Duration(seconds: 3), () {
      if (mounted && _cartItems.isNotEmpty) {
        setState(() {
          _isBasketVisible = false;
        });
      }
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: TextButton(
          onPressed: () {},
          child: Text(
            "364, Street... v",
            style: TextStyle(fontSize: 18, color: Color(0xFF1E1E1E)),
          ),
        ),
        actions: [
          IconButton(
              onPressed: () {
                Navigator.of(context).pushNamed('cart');
              },
              icon: Icon(
                Icons.shopping_bag_rounded,
                color: Color(0xFF1E1E1E),
              ))
        ],
      ),
      body: Stack(
        children: [
          SingleChildScrollView(
            scrollDirection: Axis.vertical,
            child: Column(
              children: [
                SingleChildScrollView(
                  scrollDirection: Axis.horizontal,
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      SizedBox(width: 20),
                      Container(
                          height: 200,
                          width: 350,
                          decoration: BoxDecoration(
                              color: Colors.lightGreen[100],
                              borderRadius: BorderRadius.circular(10)),
                          child: Row(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: [
                              SizedBox(width: 10),
                              Column(
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: [
                                  SizedBox(height: 40),
                                  Text(
                                    "Upto 30% offer",
                                    style: TextStyle(
                                        fontSize: 20,
                                        fontWeight: FontWeight.bold),
                                  ),
                                  Text(
                                    "Enjoy our big offer",
                                    style: TextStyle(
                                        fontSize: 16,
                                        color: Color(0xFFA5CC65),
                                        fontWeight: FontWeight.bold),
                                  ),
                                  GestureDetector(
                                    onTap: () {
                                      Navigator.of(context).push(
                                          MaterialPageRoute(
                                              builder: (context) =>
                                                  Vegetablescategoryscreen()));
                                    },
                                    child: Container(
                                      height: 40,
                                      width: 100,
                                      decoration: BoxDecoration(
                                          color: Colors.green,
                                          borderRadius:
                                              BorderRadius.circular(10)),
                                      child: Center(
                                          child: Text(
                                        "Shop Now",
                                        style: TextStyle(
                                            fontSize: 16,
                                            color: Colors.white,
                                            fontWeight: FontWeight.bold),
                                      )),
                                    ),
                                  )
                                ],
                              ),
                              Container(
                                  height: 120,
                                  width: 200,
                                  child: Image(
                                    image: AssetImage('assets/vegbasket1.png'),
                                    fit: BoxFit.contain,
                                  ))
                            ],
                          )),
                      SizedBox(width: 20),
                      Container(
                          height: 200,
                          width: 350,
                          decoration: BoxDecoration(
                              color: Colors.lightGreen[100],
                              borderRadius: BorderRadius.circular(10)),
                          child: Row(
                            children: [
                              SizedBox(width: 10),
                              Column(
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: [
                                  SizedBox(height: 40),
                                  Text(
                                    "Upto 50% off",
                                    style: TextStyle(
                                        fontSize: 20,
                                        fontWeight: FontWeight.bold),
                                  ),
                                  Text(
                                    "Enjoy our big offer",
                                    style: TextStyle(
                                        fontSize: 16,
                                        color: Color(0xFFA5CC65),
                                        fontWeight: FontWeight.bold),
                                  ),
                                  GestureDetector(
                                    onTap: () {
                                      Navigator.of(context).push(
                                          MaterialPageRoute(
                                              builder: (context) =>
                                                  BeveragesCategoryScreen()));
                                    },
                                    child: Container(
                                      height: 40,
                                      width: 100,
                                      decoration: BoxDecoration(
                                          color: Colors.green,
                                          borderRadius:
                                              BorderRadius.circular(10)),
                                      child: Center(
                                          child: Text(
                                        "Shop Now",
                                        style: TextStyle(
                                            fontSize: 16,
                                            color: Colors.white,
                                            fontWeight: FontWeight.bold),
                                      )),
                                    ),
                                  )
                                ],
                              ),
                              Container(
                                  height: 120,
                                  width: 200,
                                  child: Image(
                                    image: AssetImage('assets/beverage1.png'),
                                    fit: BoxFit.contain,
                                  ))
                            ],
                          )),
                      SizedBox(width: 20),
                      Container(
                          height: 200,
                          width: 350,
                          decoration: BoxDecoration(
                              color: Colors.lightGreen[100],
                              borderRadius: BorderRadius.circular(10)),
                          child: Row(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: [
                              SizedBox(width: 10),
                              Column(
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: [
                                  SizedBox(height: 40),
                                  Text(
                                    "Upto 30% offer",
                                    style: TextStyle(
                                        fontSize: 20,
                                        fontWeight: FontWeight.bold),
                                  ),
                                  Text(
                                    "Enjoy our big offer",
                                    style: TextStyle(
                                        fontSize: 16,
                                        color: Color(0xFFA5CC65),
                                        fontWeight: FontWeight.bold),
                                  ),
                                  GestureDetector(
                                    onTap: () {
                                      Navigator.of(context).push(
                                          MaterialPageRoute(
                                              builder: (context) =>
                                                  FruitsCategoryScreen()));
                                    },
                                    child: Container(
                                      height: 40,
                                      width: 100,
                                      decoration: BoxDecoration(
                                          color: Colors.green,
                                          borderRadius:
                                              BorderRadius.circular(10)),
                                      child: Center(
                                          child: Text(
                                        "Shop Now",
                                        style: TextStyle(
                                            fontSize: 16,
                                            color: Colors.white,
                                            fontWeight: FontWeight.bold),
                                      )),
                                    ),
                                  )
                                ],
                              ),
                              Container(
                                  height: 120,
                                  width: 200,
                                  child: Image(
                                    image:
                                        AssetImage('assets/fruitbasket1.png'),
                                    fit: BoxFit.contain,
                                  ))
                            ],
                          )),
                      SizedBox(width: 20),
                    ],
                  ),
                ),
                SizedBox(height: 10),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceAround,
                  children: [
                    Text(
                      "Categories",
                      style: TextStyle(
                          fontSize: 15,
                          color: Color(0xFF1E1E1E),
                          fontWeight: FontWeight.bold),
                    ),
                    SizedBox(width: 200),
                    TextButton(
                      onPressed: () {},
                      child: Text(
                        "See all",
                        style: TextStyle(
                            fontSize: 15,
                            color: Color(0xFFA5CC65),
                            fontWeight: FontWeight.bold),
                      ),
                    )
                  ],
                ),
                SizedBox(height: 5),
                SingleChildScrollView(
                  scrollDirection: Axis.horizontal,
                  child: Row(
                    children: [
                      Column(children: [
                        IconButton(
                          onPressed: () {
                            Navigator.of(context).push(MaterialPageRoute(
                                builder: (context) => FruitsCategoryScreen()));
                          },
                          icon: ClipOval(
                            child: CircleAvatar(
                              backgroundColor: Color(0xFF595959),
                              radius: 35,
                              backgroundImage:
                                  AssetImage('assets/fruitbasket2.png'),
                            ),
                          ),
                        ),
                        Text(
                          "Fruits",
                          style: TextStyle(
                              fontSize: 15,
                              color: Color(0xFF1E1E1E),
                              fontWeight: FontWeight.bold),
                        )
                      ]),
                      Column(children: [
                        IconButton(
                          onPressed: () {
                            Navigator.of(context).push(MaterialPageRoute(
                                builder: (context) => DairyCategoryScreen()));
                          },
                          icon: ClipOval(
                            child: CircleAvatar(
                              backgroundColor: Color(0xFF595959),
                              radius: 35,
                              backgroundImage: AssetImage('assets/dairy1.png'),
                            ),
                          ),
                        ),
                        Text(
                          "Dairy",
                          style: TextStyle(
                              fontSize: 15,
                              color: Color(0xFF1E1E1E),
                              fontWeight: FontWeight.bold),
                        )
                      ]),
                      Column(children: [
                        IconButton(
                          onPressed: () {
                            Navigator.of(context).push(MaterialPageRoute(
                                builder: (context) =>
                                    Vegetablescategoryscreen()));
                          },
                          icon: ClipOval(
                            child: CircleAvatar(
                              backgroundColor: Color(0xFF595959),
                              radius: 35,
                              backgroundImage:
                                  AssetImage('assets/vegbasket2.png'),
                            ),
                          ),
                        ),
                        Text(
                          "Vegetables",
                          style: TextStyle(
                              fontSize: 15,
                              color: Color(0xFF1E1E1E),
                              fontWeight: FontWeight.bold),
                        )
                      ]),
                      Column(children: [
                        IconButton(
                          onPressed: () {
                            Navigator.of(context).push(MaterialPageRoute(
                                builder: (context) =>
                                    BeveragesCategoryScreen()));
                          },
                          icon: ClipOval(
                            child: CircleAvatar(
                              backgroundColor: Color(0xFF595959),
                              radius: 35,
                              backgroundImage:
                                  AssetImage('assets/beverage1.png'),
                            ),
                          ),
                        ),
                        Text(
                          "Beverages",
                          style: TextStyle(
                              fontSize: 15,
                              color: Color(0xFF1E1E1E),
                              fontWeight: FontWeight.bold),
                        )
                      ]),
                      Column(children: [
                        IconButton(
                          onPressed: () {
                            Navigator.of(context).push(MaterialPageRoute(
                                builder: (context) => SnacksCategoryScreen()));
                          },
                          icon: ClipOval(
                            child: CircleAvatar(
                              backgroundColor: Color(0xFF595959),
                              radius: 35,
                              backgroundImage: AssetImage('assets/snack1.png'),
                            ),
                          ),
                        ),
                        Text(
                          "Snacks",
                          style: TextStyle(
                              fontSize: 15,
                              color: Color(0xFF1E1E1E),
                              fontWeight: FontWeight.bold),
                        )
                      ]),
                      Column(children: [
                        IconButton(
                          onPressed: () {
                            Navigator.of(context).push(MaterialPageRoute(
                                builder: (context) => PulsesCategoryScreen()));
                          },
                          icon: ClipOval(
                            child: CircleAvatar(
                              backgroundColor: Color(0xFF595959),
                              radius: 35,
                              backgroundImage: AssetImage('assets/pulses.png'),
                            ),
                          ),
                        ),
                        Text(
                          "Pulses",
                          style: TextStyle(
                              fontSize: 15,
                              color: Color(0xFF1E1E1E),
                              fontWeight: FontWeight.bold),
                        )
                      ]),
                    ],
                  ),
                ),
                SizedBox(height: 10),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceAround,
                  children: [
                    Text(
                      "Fruits",
                      style: TextStyle(
                          fontSize: 15,
                          color: Color(0xFF1E1E1E),
                          fontWeight: FontWeight.bold),
                    ),
                    SizedBox(width: 200),
                    TextButton(
                      onPressed: () {},
                      child: Text(
                        "See all",
                        style: TextStyle(
                            fontSize: 15,
                            color: Color(0xFFA5CC65),
                            fontWeight: FontWeight.bold),
                      ),
                    )
                  ],
                ),
                SizedBox(height: 10),
                SingleChildScrollView(
                  scrollDirection: Axis.horizontal,
                  child: Row(
                    children: List.generate(
                      3,
                      (index) {
                        final fruit = allfruits[index];
                        return GestureDetector(
                          onTap: () {
                            Navigator.of(context).push(
                              MaterialPageRoute(
                                builder: (context) =>
                                    FruitDetailScreen(fruit: fruit),
                              ),
                            );
                          },
                          child: Container(
                            margin: EdgeInsets.only(right: 10),
                            height: 240,
                            width: 180,
                            decoration: BoxDecoration(
                              color: Colors.white38,
                              borderRadius: BorderRadius.circular(10),
                            ),
                            child: Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                Container(
                                  height: 120,
                                  width: 180,
                                  child: Image.asset(
                                    fruit['image'],
                                    fit: BoxFit.cover,
                                  ),
                                ),
                                Padding(
                                  padding: const EdgeInsets.symmetric(
                                      horizontal: 8.0),
                                  child: Row(
                                    mainAxisAlignment:
                                        MainAxisAlignment.spaceBetween,
                                    children: [
                                      Text(
                                        fruit['name'],
                                        style: TextStyle(
                                            fontSize: 20,
                                            color: Color(0xFF1E1E1E),
                                            fontWeight: FontWeight.bold),
                                      ),
                                      IconButton(
                                        onPressed: () {
                                          _addToCart(fruit['name']);
                                        },
                                        icon: Icon(
                                          Icons.add,
                                          color: Color(0xFF1E1E1E),
                                        ),
                                      )
                                    ],
                                  ),
                                ),
                                Padding(
                                  padding: const EdgeInsets.symmetric(
                                      horizontal: 8.0),
                                  child: Text(
                                    fruit['rating'],
                                    style: TextStyle(
                                        fontSize: 17,
                                        color: Color(0xFF1E1E1E),
                                        fontWeight: FontWeight.bold),
                                  ),
                                ),
                                Padding(
                                  padding: const EdgeInsets.symmetric(
                                      horizontal: 8.0),
                                  child: Text(
                                    fruit['price'],
                                    style: TextStyle(
                                        fontSize: 17,
                                        color: Color(0xFF1E1E1E),
                                        fontWeight: FontWeight.bold),
                                  ),
                                ),
                              ],
                            ),
                          ),
                        );
                      },
                    ),
                  ),
                ),
              ],
            ),
          ),

          // Basket popup
          if (_isBasketVisible)
            Align(
              alignment: Alignment.bottomCenter,
              child: AnimatedContainer(
                duration: Duration(milliseconds: 300),
                curve: Curves.easeInOut,
                margin: EdgeInsets.all(16),
                padding: EdgeInsets.symmetric(horizontal: 16, vertical: 8),
                decoration: BoxDecoration(
                  color: Color(0xFFA5CC65),
                  borderRadius: BorderRadius.circular(16),
                ),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Expanded(
                      child: SingleChildScrollView(
                        scrollDirection: Axis.horizontal,
                        child: Row(
                          children: allfruits
                              .where((product) =>
                                  _cartItems.contains(product['name']))
                              .map((product) {
                            return Padding(
                              padding:
                                  const EdgeInsets.symmetric(horizontal: 8.0),
                              child: ClipOval(
                                child: Image.asset(
                                  product['image'],
                                  width: 40,
                                  height: 40,
                                  fit: BoxFit.cover,
                                ),
                              ),
                            );
                          }).toList(),
                        ),
                      ),
                    ),
                    ElevatedButton(
                      onPressed: () {
                        Navigator.of(context).pushNamed('cart');
                      },
                      style: ElevatedButton.styleFrom(
                        backgroundColor: Colors.white,
                        foregroundColor: Color(0xFFA5CC65),
                      ),
                      child: Text("View Basket"),
                    ),
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
          });
          switch (selectbottomitemindex) {
            case 0:
              Navigator.pushNamed(context, '/');
              break;
            case 1:
              Navigator.pushNamed(context, 'favourite');
              break;
            case 2:
              Navigator.pushNamed(context, 'search');
              break;
            case 3:
              Navigator.pushNamed(context, 'profile');
              break;
            case 4:
              Navigator.pushNamed(context, 'menu');
              break;
          }
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
