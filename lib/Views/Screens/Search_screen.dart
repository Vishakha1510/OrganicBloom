// ignore_for_file: file_names, avoid_print

import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';

class SearchScreen extends StatefulWidget {
  const SearchScreen({super.key});

  @override
  State<SearchScreen> createState() => _SearchScreenState();
}

class _SearchScreenState extends State<SearchScreen> {
  TextEditingController searchController = TextEditingController();

  bool isLoading = true;
  final String docId = "7zbZ5GSG9wZfbwsXnpPq";

  List _allresults = [];
  List _resultList = [];

  @override
  void initState() {
    searchController.addListener(onSearchChanged);
    super.initState();
  }

  onSearchChanged() {
    // print(searchController.text);
    searchResultList();
  }

  searchResultList() {
    var showResults = [];
    if (searchController.text != "") {
      for (var clientSnapShot in _allresults) {
        var name = clientSnapShot['name'].toString().toLowerCase();
        if (name.contains(searchController.text.toLowerCase())) {
          showResults.add(clientSnapShot);
        }
      }
    } else {
      showResults = List.from(_allresults);
    }
    setState(() {
      _resultList = showResults;
    });
  }

  getClientStream() async {
    try {
      var data = await FirebaseFirestore.instance
          .collection("categories")
          .doc(docId)
          .collection("Items")
          .orderBy("name")
          .get();
      setState(() {
        _allresults = data.docs;
        isLoading = false;
      });
      searchResultList();
    } catch (e) {
      print("Error fetching data: $e");
      setState(() {
        isLoading = false;
      });
    }
  }

  @override
  void dispose() {
    searchController.removeListener(onSearchChanged);
    searchController.dispose();
    super.dispose();
  }

  @override
  void didChangeDependencies() {
    getClientStream();
    super.didChangeDependencies();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(appBar: _appBar(), body: _buildbody());
  }

  AppBar _appBar() {
    return AppBar(
      foregroundColor: Colors.white,
      backgroundColor: const Color(0xFFA5CC65),
      centerTitle: true,
      title: Text(
        "Search",
        style: TextStyle(fontSize: 25),
      ),
      actions: [
        IconButton(
          onPressed: () {
            Navigator.of(context).pushNamed('cart');
          },
          icon: Icon(Icons.shopping_bag_rounded),
        )
      ],
    );
  }

  Widget _buildbody() {
    return Column(
      spacing: 10,
      children: [
        SizedBox(height: 5),
        Padding(
          padding: EdgeInsets.all(20.0),
          child: TextField(
            controller: searchController,
            decoration: InputDecoration(
              border: OutlineInputBorder(),
              prefixIcon: Icon(Icons.search),
              suffixIcon: IconButton(
                  onPressed: () {
                    searchController.clear();
                  },
                  icon: Icon(Icons.clear)),
              labelText: "Search Fruits",
              labelStyle: TextStyle(color: Color(0xFFA5CC65)),
            ),
          ),
        ),
        isLoading
            ? Center(child: CircularProgressIndicator())
            : _allresults.isEmpty
                ? Center(child: Text("No items found."))
                : Expanded(
                    child: GridView.builder(
                    gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                      crossAxisCount: 2,
                      crossAxisSpacing: 10,
                      mainAxisSpacing: 10,
                      childAspectRatio: 3 / 4,
                    ),
                    itemCount: _resultList.length,
                    itemBuilder: (context, i) {
                      return GestureDetector(
                        onTap: () {},
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
                                  _resultList[i]['image'],
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
                                      mainAxisAlignment:
                                          MainAxisAlignment.spaceBetween,
                                      children: [
                                        Expanded(
                                          child: Text(
                                            _resultList[i]['name'],
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
                                      "⭐ ${_resultList[i]['rating']}",
                                      style: TextStyle(
                                        fontSize: 14,
                                        color: Colors.black54,
                                      ),
                                    ),
                                    SizedBox(height: 5),
                                    // Price
                                    Text(
                                      "Price: ${_resultList[i]['price']} Rs",
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
                  )),
      ],
    );
  }
}
