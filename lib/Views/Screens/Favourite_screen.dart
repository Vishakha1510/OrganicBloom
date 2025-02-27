import 'package:flutter/material.dart';
import 'package:organicbloom/helpers/providers/favourite_provider.dart';
import 'package:provider/provider.dart';

class FavoritesScreen extends StatefulWidget {
  @override
  _FavoritesScreenState createState() => _FavoritesScreenState();
}

class _FavoritesScreenState extends State<FavoritesScreen> {
  int _selectedIndex = 1;

  void _onItemTapped(int index) {
    setState(() {
      _selectedIndex = index;
    });

    switch (index) {
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
  }

  @override
  Widget build(BuildContext context) {
    var favoritesProvider = Provider.of<FavoritesProvider>(context);
    var favoriteItems = favoritesProvider.favorites;

    return Scaffold(
      appBar: AppBar(
        centerTitle: true,
        title: Text("Favourite",
            style: TextStyle(fontSize: 25, color: Color(0xFF1E1E1E))),
      ),
      body: favoriteItems.isEmpty
          ? Center(child: Text("No favorites yet!"))
          : ListView.builder(
              itemCount: favoriteItems.length,
              itemBuilder: (context, index) {
                var item = favoriteItems[index];
                return Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: Card(
                    elevation: 2,
                    shadowColor: Colors.green,
                    child: SizedBox(
                      height: 100,
                      child: Center(
                        child: ListTile(
                          leading: Image.asset(
                            item['image'],
                            width: 100,
                            height: 200,
                            fit: BoxFit.cover,
                          ),
                          title: Text(item['name']),
                          subtitle: Text("Price: ${item['price']}"),
                          trailing: IconButton(
                            icon: Icon(Icons.delete, color: Colors.red),
                            onPressed: () {
                              favoritesProvider.removeFavorite(item['name']);
                            },
                          ),
                        ),
                      ),
                    ),
                  ),
                );
              },
            ),
      bottomNavigationBar: NavigationBar(
        selectedIndex: _selectedIndex,
        onDestinationSelected: _onItemTapped,
        destinations: const [
          NavigationDestination(icon: Icon(Icons.home), label: 'Home'),
          NavigationDestination(icon: Icon(Icons.favorite), label: 'Favourite'),
          NavigationDestination(icon: Icon(Icons.search), label: 'Search'),
          NavigationDestination(icon: Icon(Icons.person), label: 'Profile'),
          NavigationDestination(icon: Icon(Icons.menu), label: 'Menu'),
        ],
      ),
    );
  }
}
