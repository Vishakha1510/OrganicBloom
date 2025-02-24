import 'package:organicbloom/Views/Screens/Category_screens/Fruits_category_screen.dart';
import 'package:organicbloom/Views/Screens/Category_screens/bevegares_category_screen.dart';
import 'package:organicbloom/Views/Screens/Category_screens/dairy_category_screen.dart';
import 'package:organicbloom/Views/Screens/Category_screens/pulses_category_screen.dart';
import 'package:organicbloom/Views/Screens/Category_screens/snacks_category_screen.dart';
import 'package:organicbloom/Views/Screens/Category_screens/vegetable_category_screen.dart';

List<Map<String, dynamic>> categories = [
  {
    "name": "Fruits",
    "image": 'assets/fruitbasket2.png',
    "screen": FruitsCategoryScreen(),
  },
  {
    "name": "Dairy",
    "image": 'assets/dairy1.png',
    "screen": DairyCategoryScreen(),
  },
  {
    "name": "Vegetables",
    "image": 'assets/vegbasket2.png',
    "screen": Vegetablescategoryscreen(),
  },
  {
    "name": "Beverages",
    "image": 'assets/beverage1.png',
    "screen": BeveragesCategoryScreen(),
  },
  {
    "name": "Snacks",
    "image": 'assets/snack1.png',
    "screen": SnacksCategoryScreen(),
  },
  {
    "name": "Pulses",
    "image": 'assets/pulses.png',
    "screen": PulsesCategoryScreen(),
  },
  {
    "name": "Bakery",
    "image": 'assets/bakery.png',
    "screen": "",
  },
  {
    "name": "Meat",
    "image": 'assets/meat.png',
    "screen": "",
  },
  {
    "name": "Seafood",
    "image": 'assets/seafood.png',
    "screen": "",
  },
  {
    "name": "Frozen",
    "image": 'assets/frozen.png',
    "screen": "",
  },
  {
    "name": "Spices",
    "image": 'assets/spices.png',
    "screen": "",
  },
  {
    "name": "Condiments",
    "image": 'assets/condiments.png',
    "screen": "",
  },
  {
    "name": "Grains",
    "image": 'assets/grains.png',
    "screen": "",
  },
  {
    "name": "Pantry Essentials",
    "image": 'assets/pantry.png',
    "screen": "",
  },
  {
    "name": "Baking Supplies",
    "image": 'assets/baking.png',
    "screen": "",
  },
  {
    "name": "Personal Care",
    "image": 'assets/personalcare.png',
    "screen": "",
  },
  {
    "name": "Nuts & Seeds",
    "image": 'assets/nuts.png',
    "screen": "",
  },
  {
    "name": "Dry Fruits",
    "image": 'assets/dryfruits.png',
    "screen": "",
  },
];
