import 'package:organicbloom/Views/Screens/Category_screens/Fruits_category_screen.dart';
import 'package:organicbloom/Views/Screens/Category_screens/bakery_category_screen.dart';
import 'package:organicbloom/Views/Screens/Category_screens/bakingsupplies_category_screen.dart';
import 'package:organicbloom/Views/Screens/Category_screens/bevegares_category_screen.dart';
import 'package:organicbloom/Views/Screens/Category_screens/condiments_category_screen.dart';
import 'package:organicbloom/Views/Screens/Category_screens/dairy_category_screen.dart';
import 'package:organicbloom/Views/Screens/Category_screens/dryfruits_category_screen.dart';
import 'package:organicbloom/Views/Screens/Category_screens/frozenfood_category_screen.dart';
import 'package:organicbloom/Views/Screens/Category_screens/grains_category_screen.dart';
import 'package:organicbloom/Views/Screens/Category_screens/nutsandseeds_category_screen.dart';
import 'package:organicbloom/Views/Screens/Category_screens/pantryessentials_category_screen.dart';
import 'package:organicbloom/Views/Screens/Category_screens/personalcare_category_screen.dart';
import 'package:organicbloom/Views/Screens/Category_screens/pulses_category_screen.dart';
import 'package:organicbloom/Views/Screens/Category_screens/snacks_category_screen.dart';
import 'package:organicbloom/Views/Screens/Category_screens/spices_category_screen.dart';
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
    "screen": BakeryCategoryScreen(),
  },
  {
    "name": "Frozen",
    "image": 'assets/frozen.png',
    "screen": FrozenfoodCategoryScreen(),
  },
  {
    "name": "Spices",
    "image": 'assets/spices.png',
    "screen": SpicesCategoryScreen(),
  },
  {
    "name": "Condiments",
    "image": 'assets/condiments.png',
    "screen": CondimentsCategoryScreen(),
  },
  {
    "name": "Grains",
    "image": 'assets/grains.png',
    "screen": GrainsCategoryScreen(),
  },
  {
    "name": "Pantry Essentials",
    "image": 'assets/pantry.png',
    "screen": PantryessentialsCategoryScreen(),
  },
  {
    "name": "Baking Supplies",
    "image": 'assets/baking.png',
    "screen": BakingsuppliesCategoryScreen(),
  },
  {
    "name": "Personal Care",
    "image": 'assets/personalcare.png',
    "screen": PersonalcareCategoryScreen(),
  },
  {
    "name": "Nuts & Seeds",
    "image": 'assets/nuts.png',
    "screen": NutsandseedsCategoryScreen(),
  },
  {
    "name": "Dry Fruits",
    "image": 'assets/dryfruits.png',
    "screen": DryfruitsCategoryScreen(),
  },
];
