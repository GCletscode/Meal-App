import 'package:flutter/material.dart';
import '/models/meal.dart';
import '/screens/favourite_screen.dart';
import '/screens/categories_screen.dart';
import '../widget/drawer.dart';

class TabsScreen extends StatefulWidget {
  final List<Meal> favouriteMeals;

  TabsScreen(this.favouriteMeals);

  @override
  State<TabsScreen> createState() => _TabsScreenState();
}

class _TabsScreenState extends State<TabsScreen> {
   List<Map<String, Object>>? pages;
  int selectedIndex = 0;
  void selectedPage(int index) {
    setState(() {
      selectedIndex = index;
    });
  }

  @override
  void initState() {
    pages=[
    {'page': const CategoriesScreen(), 'title': 'Meals'},
    {'page': FavouriteScreen(widget.favouriteMeals), 'title': 'Favourite Meals'}
  ];
  super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(pages![selectedIndex]['title'] as String),
      ),
      drawer: MainDrawer(),
      body: pages![selectedIndex]['page'] as Widget,
      bottomNavigationBar: BottomNavigationBar(
        onTap: selectedPage,
        showSelectedLabels: true,
        selectedItemColor: Colors.white,
        unselectedItemColor: Colors.black,
        currentIndex: selectedIndex,
        type: BottomNavigationBarType.shifting,
        items: [
          BottomNavigationBarItem(
            backgroundColor: Theme.of(context).primaryColor,
            icon: const Icon(Icons.category),
            label: "Categories",
          ),
          BottomNavigationBarItem(
            backgroundColor: Theme.of(context).primaryColor,
            icon: const Icon(Icons.star),
            label: "Favourites",
          ),
        ],
      ),
    );
  }
}
