import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:organicbloom/Views/Screens/Cart_screen.dart';
import 'package:organicbloom/Views/Screens/Favourite_screen.dart';
import 'package:organicbloom/Views/Screens/Home_screen.dart';
import 'package:organicbloom/Views/Screens/Intro_screen.dart';
import 'package:organicbloom/Views/Screens/Login_screen.dart';
import 'package:organicbloom/Views/Screens/Profile_screen.dart';
import 'package:organicbloom/Views/Screens/Search_screen.dart';
import 'package:organicbloom/Views/Screens/Signup_screen.dart';
import 'package:organicbloom/Views/Screens/mainnavigation.dart';
import 'package:organicbloom/firebase_options.dart';

import 'package:organicbloom/helpers/providers/user_provider.dart';
import 'package:provider/provider.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();

  await Firebase.initializeApp(
    options: DefaultFirebaseOptions.currentPlatform,
  );

  runApp(const OrganicBloom());
}

class OrganicBloom extends StatelessWidget {
  const OrganicBloom({super.key});

  @override
  Widget build(BuildContext context) {
    return MultiProvider(
      providers: [
        // ChangeNotifierProvider(
        //   create: (context) => FavoritesProvider(),
        // ),
        // ChangeNotifierProvider(
        //   create: (context) => CartProvider(),
        // ),
        ChangeNotifierProvider(
          create: (context) => UserProvider(),
        ),
      ],
      builder: (context, _) {
        return MaterialApp(
          debugShowCheckedModeBanner: false,
          routes: {
            '/': (context) => Intro_screen(),
            'nav': (context) => MainNavigationScreen(),
            'login': (context) => Login_screen(),
            'signup': (context) => Signup_screen(),
            'home': (context) => Home_screen(),
            'favourite': (context) => FavoritesScreen(),
            'search': (context) => SearchScreen(),
            'profile': (context) => Profile_screen(),
            'cart': (context) => CartScreen(),
          },
        );
      },
    );
  }
}
