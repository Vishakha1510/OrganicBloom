import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:organicbloom/Views/Screens/Detail_screens/Detail_screen.dart';

// ignore: must_be_immutable
class CategoryDetailScreen extends StatefulWidget {
  CategoryDetailScreen({this.id, super.key});

  String? id;

  @override
  State<CategoryDetailScreen> createState() => _CategoryDetailScreenState();
}

class _CategoryDetailScreenState extends State<CategoryDetailScreen> {
  DocumentSnapshot<Map<String, dynamic>>? category;
  QuerySnapshot<Map<String, dynamic>>? list;

  void getItemsData() async {
    category = await FirebaseFirestore.instance
        .collection('categories')
        .doc(widget.id)
        .get();

    list = await FirebaseFirestore.instance
        .collection('categories')
        .doc(widget.id)
        .collection("Items")
        .get();

    setState(() {});
  }

  @override
  void initState() {
    getItemsData();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    // print(category?.data() ?? "");
    return Scaffold(
      appBar: AppBar(
        centerTitle: true,
        title: Text(category?.data()?["name"] ?? "Category"),
      ),
      body: Padding(
        padding: EdgeInsets.all(10.0),
        child: GridView.builder(
          gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
            crossAxisCount: 2,
            crossAxisSpacing: 10,
            mainAxisSpacing: 10,
            childAspectRatio: 3 / 4,
          ),
          itemCount: list?.size ?? 0,
          itemBuilder: (context, index) {
            final fruit = list?.docs[index].data();
            String? id = list?.docs[index].id;
            return GestureDetector(
              onTap: () {
                if (id != null) {
                  Navigator.of(context).push(MaterialPageRoute(
                    builder: (context) => DetailScreen(
                      categoryId: widget.id!,
                      itemId: id,
                    ),
                  ));
                }
              },
              child: Container(
                decoration: BoxDecoration(
                  color: Colors.white,
                  borderRadius: BorderRadius.circular(10),
                ),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    //  Image
                    ClipRRect(
                      borderRadius: BorderRadius.vertical(
                        top: Radius.circular(10),
                      ),
                      child: Image.network(
                        fruit?['image'] ?? "",
                        height: 120,
                        width: 200,
                        fit: BoxFit.cover,
                      ),
                    ),
                    Padding(
                      padding: EdgeInsets.all(8.0),
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          //  Name
                          Row(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: [
                              Expanded(
                                child: Text(
                                  fruit?['name'] ?? "",
                                  style: TextStyle(
                                    fontSize: 18,
                                    fontWeight: FontWeight.bold,
                                    color: Colors.black87,
                                  ),
                                  overflow: TextOverflow.ellipsis,
                                  maxLines: 1,
                                ),
                              ),
                              IconButton(
                                onPressed: () {},
                                icon: Icon(Icons.add, size: 30),
                              ),
                            ],
                          ),
                          SizedBox(height: 5),
                          // Rating
                          Text(
                            "⭐ ${fruit?['rating'] ?? "0"}",
                            style: TextStyle(
                              fontSize: 14,
                              color: Colors.black54,
                            ),
                          ),
                          SizedBox(height: 5),
                          // Price
                          Text(
                            "Price: ${fruit?['price'] ?? "0"} Rs",
                            style: TextStyle(
                              fontSize: 16,
                              fontWeight: FontWeight.bold,
                              color: Colors.green,
                            ),
                          ),
                        ],
                      ),
                    ),
                  ],
                ),
              ),
            );
          },
        ),
      ),
    );
  }
}
