// ignore_for_file: file_names, camel_case_types

import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:organicbloom/Views/Screens/Cart_screen.dart';
import 'package:organicbloom/Views/Screens/Category_screens/all_category_screen.dart';
import 'package:organicbloom/Views/Screens/Category_screens/category_detail.dart';
import 'package:organicbloom/Views/Screens/Detail_screens/Detail_screen.dart';

class Home_screen extends StatefulWidget {
  const Home_screen({super.key});

  @override
  State<Home_screen> createState() => _Home_screenState();
}

class _Home_screenState extends State<Home_screen> {
  String? firstDocId;
  String? lastDocId;

  var collection = FirebaseFirestore.instance.collection('categories');
  getdata() async {
    var alldoc = await collection.get();

    if (alldoc.docs.isNotEmpty) {
      setState(() {
        firstDocId = alldoc.docs.first.id;
        lastDocId = alldoc.docs.last.id;
      });
    }
  }

  @override
  void initState() {
    super.initState();
    getdata();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: _buildAppBar(),
      body: Stack(
        children: [
          SingleChildScrollView(
            scrollDirection: Axis.vertical,
            child: Column(
              children: [
                SizedBox(height: 10),
                _buildBanners(),
                SizedBox(height: 10),
                _buildSeeAllCategories(),
                _buildCategoriesListView(),
                SizedBox(height: 20),
                _buildFirstIdScroll(),
                SizedBox(height: 20),
                _buildLastIdScroll()
              ],
            ),
          ),
        ],
      ),
    );
  }

  AppBar _buildAppBar() {
    return AppBar(
      backgroundColor: Color(0xFFA5CC65),
      foregroundColor: Colors.white,
      title: Text(
        "ORGANICBLOOM",
        style: TextStyle(fontSize: 25),
      ),
      actions: [
        IconButton(
            onPressed: () {
              Navigator.of(context).push(MaterialPageRoute(
                builder: (context) => CartScreen(),
              ));
            },
            icon: Icon(
              Icons.shopping_bag_rounded,
            ))
      ],
    );
  }

  Widget _buildBanners() {
    return StreamBuilder<QuerySnapshot<Map<String, dynamic>>>(
      stream: FirebaseFirestore.instance.collection('categories').snapshots(),
      builder: (context, snapshot) {
        if (!snapshot.hasData || snapshot.data!.docs.isEmpty) {
          return Center(child: CircularProgressIndicator());
        }

        return SizedBox(
          height: 200,
          child: ListView.builder(
            scrollDirection: Axis.horizontal,
            itemCount: 3,
            itemBuilder: (context, index) {
              var category = snapshot.data!.docs[index].data();
              String id = snapshot.data!.docs[index].id;

              return Padding(
                padding: const EdgeInsets.symmetric(horizontal: 10),
                child: GestureDetector(
                  onTap: () {
                    Navigator.of(context).push(
                      MaterialPageRoute(
                          builder: (context) => CategoryDetailScreen(id: id)),
                    );
                  },
                  child: Container(
                    height: 200,
                    width: 350,
                    decoration: BoxDecoration(
                      color: Colors.lightGreen[100],
                      borderRadius: BorderRadius.circular(10),
                    ),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                      children: [
                        Padding(
                          padding: const EdgeInsets.all(10),
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: [
                              Text(
                                index == 0
                                    ? "Upto 30% Offer"
                                    : index == 1
                                        ? "Upto 50% Off"
                                        : "Special Discount!",
                                style: TextStyle(
                                    fontSize: 20, fontWeight: FontWeight.bold),
                              ),
                              Text(
                                "Enjoy our big offer",
                                style: TextStyle(
                                    fontSize: 16,
                                    color: Color(0xFFA5CC65),
                                    fontWeight: FontWeight.bold),
                              ),
                              SizedBox(height: 10),
                              Container(
                                height: 40,
                                width: 100,
                                decoration: BoxDecoration(
                                  color: Colors.green,
                                  borderRadius: BorderRadius.circular(10),
                                ),
                                child: Center(
                                  child: Text(
                                    "Shop Now",
                                    style: TextStyle(
                                        fontSize: 16,
                                        color: Colors.white,
                                        fontWeight: FontWeight.bold),
                                  ),
                                ),
                              )
                            ],
                          ),
                        ),
                        SizedBox(
                          height: 120,
                          width: 150,
                          child: Image.network(
                            category['image'],
                            fit: BoxFit.contain,
                          ),
                        )
                      ],
                    ),
                  ),
                ),
              );
            },
          ),
        );
      },
    );
  }

  Widget _buildSeeAllCategories() {
    return Row(
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
          onPressed: () {
            Navigator.of(context).push(
                MaterialPageRoute(builder: (context) => AllCategoryScreen()));
          },
          child: Text(
            "See all",
            style: TextStyle(
                fontSize: 15,
                color: Color(0xFFA5CC65),
                fontWeight: FontWeight.bold),
          ),
        )
      ],
    );
  }

  Widget _buildCategoriesListView() {
    return StreamBuilder<QuerySnapshot<Map<String, dynamic>>>(
        stream: FirebaseFirestore.instance.collection('categories').snapshots(),
        builder: (context, snapshot) {
          return SizedBox(
            height: 120,
            child: ListView.builder(
              scrollDirection: Axis.horizontal,
              itemCount: (snapshot.data?.size ?? 0).clamp(0, 10),
              itemBuilder: (context, index) {
                var category = snapshot.data?.docs[index].data();
                String? id = snapshot.data?.docs[index].id;
                return Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 8.0),
                  child: Column(
                    children: [
                      IconButton(
                        onPressed: () {
                          Navigator.of(context).push(
                            MaterialPageRoute(
                                builder: (context) =>
                                    CategoryDetailScreen(id: id)),
                          );
                        },
                        icon: ClipOval(
                          child: CircleAvatar(
                            backgroundColor: Color(0xFF595959),
                            radius: 35,
                            backgroundImage: NetworkImage(category!['image']),
                          ),
                        ),
                      ),
                      Text(
                        category['name'],
                        style: TextStyle(
                          fontSize: 15,
                          color: Color(0xFF1E1E1E),
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                    ],
                  ),
                );
              },
            ),
          );
        });
  }

  Widget _buildFirstIdScroll() {
    if (firstDocId == null) {
      return Center(child: CircularProgressIndicator());
    }

    return StreamBuilder(
      stream: collection.doc(firstDocId).collection('Items').snapshots(),
      builder: (context, snapshot) {
        if (snapshot.connectionState == ConnectionState.waiting) {
          return Center(child: CircularProgressIndicator());
        }
        if (!snapshot.hasData || snapshot.data!.docs.isEmpty) {
          return Center(child: Text("No Items found!!!"));
        }

        var items = snapshot.data!.docs;

        return SizedBox(
          height: 240,
          child: ListView.builder(
            scrollDirection: Axis.horizontal,
            itemCount: items.length,
            itemBuilder: (context, index) {
              var itemData = items[index].data();

              return GestureDetector(
                onTap: () {
                  Navigator.of(context).push(MaterialPageRoute(
                    builder: (context) => DetailScreen(
                        categoryId: firstDocId!, itemId: items[index].id),
                  ));
                },
                child: Container(
                  margin: EdgeInsets.only(right: 10),
                  width: 180,
                  decoration: BoxDecoration(
                    color: Colors.white70,
                    borderRadius: BorderRadius.circular(10),
                  ),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Container(
                        height: 120,
                        width: 180,
                        decoration: BoxDecoration(
                          borderRadius:
                              BorderRadius.vertical(top: Radius.circular(10)),
                          image: DecorationImage(
                            image: NetworkImage(itemData['image']),
                            fit: BoxFit.cover,
                          ),
                        ),
                      ),
                      Padding(
                        padding: EdgeInsets.symmetric(
                            horizontal: 8.0, vertical: 4.0),
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            Expanded(
                              child: Text(
                                itemData['name'],
                                style: TextStyle(
                                  fontSize: 18,
                                  color: Color(0xFF1E1E1E),
                                  fontWeight: FontWeight.bold,
                                ),
                                overflow: TextOverflow.ellipsis,
                              ),
                            ),
                            IconButton(
                              onPressed: () {},
                              icon: Icon(Icons.add, color: Color(0xFF1E1E1E)),
                            )
                          ],
                        ),
                      ),
                      Padding(
                        padding: EdgeInsets.symmetric(horizontal: 8.0),
                        child: Text(
                          "⭐ ${itemData['rating']}",
                          style: TextStyle(
                            fontSize: 17,
                            color: Color(0xFF1E1E1E),
                            fontWeight: FontWeight.bold,
                          ),
                        ),
                      ),
                      Padding(
                        padding: EdgeInsets.symmetric(
                            horizontal: 8.0, vertical: 2.0),
                        child: Text(
                          "${itemData['price']} Rs",
                          style: TextStyle(
                            fontSize: 17,
                            color: Colors.green,
                            fontWeight: FontWeight.bold,
                          ),
                        ),
                      ),
                    ],
                  ),
                ),
              );
            },
          ),
        );
      },
    );
  }

  Widget _buildLastIdScroll() {
    if (lastDocId == null) {
      return Center(child: CircularProgressIndicator());
    }

    return StreamBuilder(
      stream: collection.doc(lastDocId).collection('Items').snapshots(),
      builder: (context, snapshot) {
        if (snapshot.connectionState == ConnectionState.waiting) {
          return Center(child: CircularProgressIndicator());
        }
        if (!snapshot.hasData || snapshot.data!.docs.isEmpty) {
          return Center(child: Text("No Items found!!!"));
        }

        var items = snapshot.data!.docs;

        return SizedBox(
          height: 240,
          child: ListView.builder(
            scrollDirection: Axis.horizontal,
            itemCount: items.length,
            itemBuilder: (context, index) {
              var itemData = items[index].data();

              return GestureDetector(
                onTap: () {
                  Navigator.push(
                      context,
                      MaterialPageRoute(
                        builder: (context) => DetailScreen(
                            categoryId: lastDocId!, itemId: items[index].id),
                      ));
                },
                child: Container(
                  margin: EdgeInsets.only(right: 10),
                  width: 180,
                  decoration: BoxDecoration(
                    color: Colors.white70,
                    borderRadius: BorderRadius.circular(10),
                  ),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Container(
                        height: 120,
                        width: 180,
                        decoration: BoxDecoration(
                          borderRadius:
                              BorderRadius.vertical(top: Radius.circular(10)),
                          image: DecorationImage(
                            image: NetworkImage(itemData['image']),
                            fit: BoxFit.cover,
                          ),
                        ),
                      ),
                      Padding(
                        padding: EdgeInsets.symmetric(
                            horizontal: 8.0, vertical: 4.0),
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            Expanded(
                              child: Text(
                                itemData['name'],
                                style: TextStyle(
                                  fontSize: 18,
                                  color: Color(0xFF1E1E1E),
                                  fontWeight: FontWeight.bold,
                                ),
                                overflow: TextOverflow.ellipsis,
                              ),
                            ),
                            IconButton(
                              onPressed: () {},
                              icon: Icon(Icons.add, color: Color(0xFF1E1E1E)),
                            )
                          ],
                        ),
                      ),
                      Padding(
                        padding: EdgeInsets.symmetric(horizontal: 8.0),
                        child: Text(
                          "⭐ ${itemData['rating']}",
                          style: TextStyle(
                            fontSize: 17,
                            color: Color(0xFF1E1E1E),
                            fontWeight: FontWeight.bold,
                          ),
                        ),
                      ),
                      Padding(
                        padding: EdgeInsets.symmetric(
                            horizontal: 8.0, vertical: 2.0),
                        child: Text(
                          "${itemData['price']} Rs",
                          style: TextStyle(
                            fontSize: 17,
                            color: Colors.green,
                            fontWeight: FontWeight.bold,
                          ),
                        ),
                      ),
                    ],
                  ),
                ),
              );
            },
          ),
        );
      },
    );
  }
}
