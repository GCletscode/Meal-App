import 'package:flutter/material.dart';
import 'package:meal/widget/ingredientbox.dart';
import 'package:meal/widget/steps_box.dart';

class MealDetailScreen extends StatelessWidget {
  Function toggleFavourite;
  Function isFavourite;
  MealDetailScreen(this.toggleFavourite,this.isFavourite);

  

  @override
  Widget build(BuildContext context) {
    final arg =
        ModalRoute.of(context)!.settings.arguments as Map<String, Object>;
    final mealurl = arg['url'];
    final mealtitle = arg['title'];
    final List mealingredient = arg['mealingredient'] as List;
    final List mealsteps = arg['mealsteps'] as List;
    final String mealId = arg['id'] as String;

    return Scaffold(
      appBar: AppBar(
        title: Text(mealtitle as String),
      ),
      body: SingleChildScrollView(
        child: Column(
          children: [
            Padding(
              padding: const EdgeInsets.all(8.0),
              child: Container(
                decoration:
                    BoxDecoration(borderRadius: BorderRadius.circular(15)),
                width: double.infinity,
                height: 250,
                child: ClipRRect(
                  borderRadius: BorderRadius.circular(15),
                  child: Image.network(
                    mealurl as String,
                    fit: BoxFit.cover,
                  ),
                ),
              ),
            ),
            const Center(
              child: Text('Ingredients',
                  style: TextStyle(fontSize: 22, fontWeight: FontWeight.bold)),
            ),
            const SizedBox(height: 10),
            Container(
              width: 300,
              height: 237,
              decoration: BoxDecoration(
                  border: Border.all(
                      width: 2,
                      color: const Color.fromARGB(255, 189, 189, 189)),
                  borderRadius: BorderRadius.circular(15)),
              padding: const EdgeInsets.all(8),
              child: ListView.builder(
                itemBuilder: (context, index) {
                  return IngredientBox(mealingredient[index]);
                },
                itemCount: mealingredient.length,
              ),
            ),
            const SizedBox(height: 10),
            const Center(
              child: Text('Steps',
                  style: TextStyle(fontSize: 22, fontWeight: FontWeight.bold)),
            ),
            const SizedBox(height: 10),
            SingleChildScrollView(
              child: Container(
                  width: 300,
                  height: 350,
                  decoration: BoxDecoration(
                      border: Border.all(
                          width: 2,
                          color: const Color.fromARGB(255, 189, 189, 189)),
                      borderRadius: BorderRadius.circular(15)),
                  padding: const EdgeInsets.all(8),
                  child: ListView.builder(
                    itemBuilder: (context, index) {
                      return StepBox(mealsteps[index], index + 1);
                    },
                    itemCount: mealsteps.length,
                  )),
            ),
          ],
        ),
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          toggleFavourite(mealId);
        },
        backgroundColor: Theme.of(context).primaryColor,
        child: Icon(
          isFavourite(mealId)?Icons.star:Icons.star_border_outlined
        ),
      ),
    );
  }
}
