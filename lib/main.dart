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

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      routes: {
        '/':(context) => Home_screen(),
        'favourite':(context) => Favourite_screen(),
        'search':(context) => Search_screen(),
        'profile':(context) => Profile_screen(),
        'menu':(context) => Menu_screen(),
        'cart':(context) => Cart_screen()
      },
    );
  }
}

