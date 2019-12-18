import 'package:flutter/material.dart';

import '../models/meal.dart';
import '../widgets/meal_item.dart';

class FavoritesScreen extends StatelessWidget {
  final List<Meal> favoriteMeals;
  const FavoritesScreen(this.favoriteMeals);
  @override
  Widget build(BuildContext context) {
    return favoriteMeals.isEmpty
        ? Container(
            child:
                //TODO: complete with empty view screen
                Center(child: Text('No Favorite meal selected..',style:Theme.of(context).textTheme.body1)),
          )
        : ListView.builder(
            itemCount: favoriteMeals.length,
            itemBuilder: (ctx, index) {
              return MealItem(
                id: favoriteMeals[index].id,
                title: favoriteMeals[index].title,
                affordability: favoriteMeals[index].affordability,
                complexity: favoriteMeals[index].complexity,
                duration: favoriteMeals[index].duration,
                imageUrl: favoriteMeals[index].imageUrl,
              );
            });
  }
}
