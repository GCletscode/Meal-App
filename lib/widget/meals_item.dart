import 'package:flutter/material.dart';
import 'package:meal/models/meal.dart';

class MealItem extends StatelessWidget {
  final String mealId;
  final String mealtitle;
  final String imageUrl;
  final int duration;
  final Complexity complex;
  final Affordability affordable;
  final List ingredient;
  final List steps;

  const MealItem({
    required this.mealId,
    required this.affordable,
    required this.complex,
    required this.duration,
    required this.imageUrl,
    required this.mealtitle,
    required this.ingredient,
    required this.steps,
  });

  String get selectcomplexity {
    switch (complex) {
      case Complexity.Challenging:
        return 'Challenging';
      case Complexity.Hard:
        return 'Hard';
      case Complexity.Simple:
        return 'Simple';
    }
  }

  String get selectaffordability {
    switch (affordable) {
      case Affordability.Affordable:
        return 'Affordable';
      case Affordability.Luxurious:
        return 'Luxurious';
      case Affordability.Pricey:
        return 'Pricey';
    }
  }

  void selectedmeal(context) {
    Navigator.of(context).pushNamed('/MealDetailScreen', arguments: {
      'id': mealId,
      'url': imageUrl,
      'title': mealtitle,
      'mealingredient': ingredient,
      'mealsteps': steps
    });
  }

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: () {
        selectedmeal(context);
      },
      borderRadius: BorderRadius.circular(15),
      child: Card(
        shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(15)),
        margin: const EdgeInsets.all(10),
        elevation: 5,
        child: Column(
          children: [
            Stack(
              children: [
                ClipRRect(
                  borderRadius: const BorderRadius.only(
                    topLeft: Radius.circular(15),
                    topRight: Radius.circular(15),
                  ),
                  child: Image.network(
                    imageUrl,
                    height: 250,
                    width: double.infinity,
                    fit: BoxFit.cover,
                  ),
                ),
                Positioned(
                  bottom: 20,
                  left: 70,
                  child: Container(
                    decoration: const BoxDecoration(
                        borderRadius: BorderRadius.only(
                            topLeft: Radius.circular(12),
                            bottomLeft: Radius.circular(12)),
                        color: Colors.black45),
                    padding:
                        const EdgeInsets.symmetric(vertical: 10, horizontal: 5),
                    width: 280,
                    child: Text(
                      mealtitle,
                      style: const TextStyle(
                        fontSize: 26,
                        color: Colors.white,
                      ),
                    ),
                  ),
                )
              ],
            ),
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 10),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceAround,
                children: [
                  Row(
                    children: [
                      const Icon(Icons.schedule),
                      const SizedBox(width: 5),
                      Text('$duration min')
                    ],
                  ),
                  Row(
                    children: [
                      const Icon(Icons.work),
                      const SizedBox(width: 5),
                      Text(selectcomplexity)
                    ],
                  ),
                  Row(
                    children: [
                      const Icon(Icons.monetization_on_outlined),
                      const SizedBox(width: 5),
                      Text(selectaffordability)
                    ],
                  )
                ],
              ),
            )
          ],
        ),
      ),
    );
  }
}
