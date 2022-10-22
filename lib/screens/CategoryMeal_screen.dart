import 'package:flutter/material.dart';
import '/models/meal.dart';

import '/widget/meals_item.dart';



class CategoryMealScreen extends StatefulWidget {
  final List<Meal> filterMeals;
  
  CategoryMealScreen(this.filterMeals);

  @override
  State<CategoryMealScreen> createState() => _CategoryMealScreenState();
}

class _CategoryMealScreenState extends State<CategoryMealScreen> {
  List<Meal>? categorymeals;
  String? categorytitle;
  var loadInItData = true;

  @override
  void didChangeDependencies() {
    if (loadInItData) {
      final routeArg =
          ModalRoute.of(context)!.settings.arguments as Map<String, Object>;
      final categoryID = routeArg['id'];
      categorytitle = routeArg['title'] as String;
      categorymeals = widget.filterMeals
          .where((meal) => meal.categories.contains(categoryID))
          .toList();
      loadInItData = false;
    }

    super.didChangeDependencies();
  }


  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: Text(categorytitle as String),
        ),
        body: ListView.builder(
          itemBuilder: (context, index) {
            return MealItem(
              mealId: categorymeals![index].id,
              affordable: categorymeals![index].affordability,
              complex: categorymeals![index].complexity,
              duration: categorymeals![index].duration,
              imageUrl: categorymeals![index].imageUrl,
              mealtitle: categorymeals![index].title,
              ingredient: categorymeals![index].ingredients,
              steps: categorymeals![index].steps,
              
            );
          },
          itemCount: categorymeals!.length,
        ));
  }
}
