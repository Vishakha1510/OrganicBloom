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
                return Card(
                  elevation: 2,
                  shadowColor: Colors.green,
                  child: ListTile(
                    leading: Image.asset(
                      item['image'],
                      width: 50,
                      height: 50,
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

// import 'package:flutter/material.dart';
// import 'package:organicbloom/helpers/providers/favourite_provider.dart';
// import 'package:provider/provider.dart';

// class FavoritesScreen extends StatefulWidget {
//   @override
//   _FavoritesScreenState createState() => _FavoritesScreenState();
// }

// class _FavoritesScreenState extends State<FavoritesScreen> {
//   int _selectedIndex = 1; // Default selected index for "Favourite" tab

//   void _onItemTapped(int index) {
//     setState(() {
//       _selectedIndex = index;
//     });

//     switch (index) {
//       case 0:
//         Navigator.of(context).pushNamed('/');
//         break;
//       case 1:
//         Navigator.of(context).pushNamed('favourite');
//         break;
//       case 2:
//         Navigator.of(context).pushNamed('search');
//         break;
//       case 3:
//         Navigator.of(context).pushNamed('profile');
//         break;
//       case 4:
//         Navigator.of(context).pushNamed('menu');
//         break;
//     }
//   }

//   @override
//   Widget build(BuildContext context) {
//     var favoritesProvider = Provider.of<FavoritesProvider>(context);
//     var favoriteItems = favoritesProvider.favorites;

//     return Scaffold(
//       appBar: AppBar(
//         centerTitle: true,
//         title: Text(
//           "Favourite",
//           style: TextStyle(fontSize: 25, color: Color(0xFF1E1E1E)),
//         ),
//       ),
//       body: favoriteItems.isEmpty
//           ? Center(child: Text("No favorites yet!"))
//           : ListView.builder(
//               itemCount: favoriteItems.length,
//               itemBuilder: (context, index) {
//                 return Card(
//                   elevation: 2,
//                   shadowColor: Colors.green,
//                   child: ListTile(
//                     title: Text(favoriteItems[index]),
//                     trailing: Text(favoriteItems[index]['price']),
//                   ),
//                 );
//               },
//             ),
//       bottomNavigationBar: NavigationBar(
//         selectedIndex: _selectedIndex,
//         onDestinationSelected: _onItemTapped,
//         destinations: const [
//           NavigationDestination(icon: Icon(Icons.home), label: 'Home'),
//           NavigationDestination(icon: Icon(Icons.favorite), label: 'Favourite'),
//           NavigationDestination(icon: Icon(Icons.search), label: 'Search'),
//           NavigationDestination(icon: Icon(Icons.person), label: 'Profile'),
//           NavigationDestination(icon: Icon(Icons.menu), label: 'Menu'),
//         ],
//       ),
//     );
//   }
// }

// // import 'package:flutter/material.dart';
// // import 'package:organicbloom/Views/Screens/Home_screen.dart';

// // class Favourite_screen extends StatefulWidget {
// //   const Favourite_screen({super.key});

// //   @override
// //   State<Favourite_screen> createState() => _Favourite_screenState();
// // }

// // class _Favourite_screenState extends State<Favourite_screen> {
// //   @override
// //   Widget build(BuildContext context) {
// //     return Scaffold(
// //       appBar: AppBar(
// //         centerTitle: true,
// //         title: Text(
// //           "Favourite",
// //           style: TextStyle(fontSize: 25, color: Color(0xFF1E1E1E)),
// //         ),
// //       ),
// //       bottomNavigationBar: NavigationBar(
// //         selectedIndex: selectbottomitemindex,
// //         onDestinationSelected: (val) {
// //           setState(() {
// //             selectbottomitemindex = val;
// //             switch (selectbottomitemindex) {
// //               case 0:
// //                 Navigator.of(context).pushNamed('/');
// //                 break;
// //               case 1:
// //                 Navigator.of(context).pushNamed('favourite');
// //                 break;
// //               case 2:
// //                 Navigator.of(context).pushNamed('search');
// //                 break;
// //               case 3:
// //                 Navigator.of(context).pushNamed('profile');
// //                 break;
// //               case 4:
// //                 Navigator.of(context).pushNamed('menu');
// //                 break;
// //             }
// //           });
// //         },
// //         destinations: const [
// //           NavigationDestination(
// //             icon: Icon(Icons.home),
// //             label: 'Home',
// //           ),
// //           NavigationDestination(
// //             icon: Icon(Icons.favorite_outline),
// //             label: 'Favourite',
// //           ),
// //           NavigationDestination(
// //             icon: Icon(Icons.search),
// //             label: 'Search',
// //           ),
// //           NavigationDestination(
// //             icon: Icon(Icons.person_pin),
// //             label: 'Profile',
// //           ),
// //           NavigationDestination(
// //             icon: Icon(Icons.menu),
// //             label: 'Menu',
// //           ),
// //         ],
// //       ),
// //     );
// //   }
// // }
