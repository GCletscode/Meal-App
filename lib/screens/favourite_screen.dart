import 'package:flutter/material.dart';
import 'package:meal/models/meal.dart';
import '../widget/meals_item.dart';

class FavouriteScreen extends StatefulWidget {
  final List<Meal> favouriteMeals;
  FavouriteScreen(this.favouriteMeals);

  @override
  State<FavouriteScreen> createState() => _FavouriteState();
}

class _FavouriteState extends State<FavouriteScreen> {
  @override
  Widget build(BuildContext context) {
    if (widget.favouriteMeals.isEmpty) {
      return const Center(
        child: Text('No Favourite Meal Selected!'),
      );
    } else {
      return ListView.builder(
        itemBuilder: (context, index) {
          return MealItem(
            mealId: widget.favouriteMeals[index].id,
            affordable: widget.favouriteMeals[index].affordability,
            complex: widget.favouriteMeals[index].complexity,
            duration: widget.favouriteMeals[index].duration,
            imageUrl: widget.favouriteMeals[index].imageUrl,
            mealtitle: widget.favouriteMeals[index].title,
            ingredient: widget.favouriteMeals[index].ingredients,
            steps: widget.favouriteMeals[index].steps,
          );
        },
        itemCount: widget.favouriteMeals.length,
      );
    }
  }
}
