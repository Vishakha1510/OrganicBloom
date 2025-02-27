import 'package:flutter/material.dart';
import 'package:organicbloom/Views/Screens/Cart_screen.dart';
import 'package:organicbloom/Views/Screens/Favourite_screen.dart';
import 'package:organicbloom/Views/Screens/Home_screen.dart';
import 'package:organicbloom/Views/Screens/Intro_screen.dart';
import 'package:organicbloom/Views/Screens/Login_screen.dart';
import 'package:organicbloom/Views/Screens/Menu_screen.dart';
import 'package:organicbloom/Views/Screens/Profile_screen.dart';
import 'package:organicbloom/Views/Screens/Search_screen.dart';
import 'package:organicbloom/Views/Screens/Signup_screen.dart';
import 'package:organicbloom/helpers/providers/favourite_provider.dart';
import 'package:provider/provider.dart';

void main() {
  runApp(const OrganicBloom());
}

class OrganicBloom extends StatelessWidget {
  const OrganicBloom({super.key});

  @override
  Widget build(BuildContext context) {
    return MultiProvider(
      providers: [
        ChangeNotifierProvider(
          create: (context) => FavoritesProvider(),
        )
      ],
      builder: (context, _) {
        return MaterialApp(
          debugShowCheckedModeBanner: false,
          routes: {
            '/': (context) => Intro_screen(),
            'login': (context) => Login_screen(),
            'signup': (context) => Signup_screen(),
            'home': (context) => Home_screen(),
            'favourite': (context) => FavoritesScreen(),
            'search': (context) => Search_screen(),
            'profile': (context) => Profile_screen(),
            'menu': (context) => Menu_screen(),
            'cart': (context) => Cart_screen(),
          },
        );
      },
    );
  }
}
