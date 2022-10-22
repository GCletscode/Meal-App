import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

import '/dummy_data.dart';
import '/models/meal.dart';
import '/screens/filter_Screen.dart';
import '/screens/meal_detail_screen.dart';
import '/screens/tabsScreen.dart';
import 'screens/CategoryMeal_screen.dart';

void main() {
  WidgetsFlutterBinding.ensureInitialized();
  SystemChrome.setPreferredOrientations([DeviceOrientation.portraitUp]);
  runApp(MyApp());
}

class MyApp extends StatefulWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  State<MyApp> createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {
  Map<String, bool> currentFilters = {
    'gluten': false,
    'lactose': false,
    'vegan': false,
    'vegetarian': false
  };

  List<Meal> availableMeal = DUMMY_MEALS;
  List<Meal> favouriteMeals = [];

  void Filter(Map<String, bool> setFilter) {
    setState(() {
      currentFilters = setFilter;
      availableMeal = DUMMY_MEALS.where((meal) {
        if (currentFilters['gluten']! && !meal.isGlutenFree) {
          return false;
        }
        if (currentFilters['lactose']! && !meal.isLactoseFree) {
          return false;
        }
        if (currentFilters['vegan']! && !meal.isVegan) {
          return false;
        }
        if (currentFilters['vegetarian']! && !meal.isVegetarian) {
          return false;
        }
        return true;
      }).toList();
    });
  }

  bool isFavourite(String mealId) {
    return favouriteMeals.any((meal) => meal.id == mealId);
  }

  void toggleFavourite(String mealId) {
    int getIndex = favouriteMeals.indexWhere((meal) => meal.id == mealId);
    if (getIndex >= 0) {
      setState(() {
        favouriteMeals.removeAt(getIndex);
      });
    } else {
      setState(() {
        favouriteMeals.add(DUMMY_MEALS.firstWhere((meal) => meal.id == mealId));
      });
    }
  }

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: "Meal",
      theme: ThemeData(
        primaryColor: const Color.fromARGB(255, 124, 179, 66),
        textTheme: ThemeData.light().textTheme.copyWith(
            titleLarge: const TextStyle(
                fontFamily: 'DynaPuff-SemiBold',
                fontWeight: FontWeight.bold,
                fontSize: 16)),
        appBarTheme: const AppBarTheme(
            color: Color.fromARGB(255, 124, 179, 66),
            titleTextStyle: TextStyle(
                fontFamily: 'LibreBaskerville-Bold',
                fontSize: 20,
                fontWeight: FontWeight.bold)),
      ),
      initialRoute: '/',
      routes: {
        '/': (context) => TabsScreen(favouriteMeals),
        '/CategoryMeal_screen': (context) => CategoryMealScreen(availableMeal),
        '/MealDetailScreen': (context) =>
            MealDetailScreen(toggleFavourite, isFavourite),
        '/FilterScreen': (context) => FilterScreen(currentFilters, Filter)
      },
    );
  }
}
