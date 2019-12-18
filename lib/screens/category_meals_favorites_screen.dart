import 'package:flutter/material.dart';

import '../models/meal.dart';
import '../widgets/meal_item.dart';

class FavoritesScreen extends StatefulWidget {
  final List<Meal> favoriteMeals;
  const FavoritesScreen(this.favoriteMeals);

  @override
  _FavoritesScreenState createState() => _FavoritesScreenState();
}

class _FavoritesScreenState extends State<FavoritesScreen> {
  Widget listViewBuilder;
  @override
  void initState() {
    setState(() => listViewBuilder = ListView.builder(
        itemCount: widget.favoriteMeals.length,
        itemBuilder: (ctx, index) {
          return MealItem(
            id: widget.favoriteMeals[index].id,
            title: widget.favoriteMeals[index].title,
            affordability: widget.favoriteMeals[index].affordability,
            complexity: widget.favoriteMeals[index].complexity,
            duration: widget.favoriteMeals[index].duration,
            imageUrl: widget.favoriteMeals[index].imageUrl,
          );
        }));
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return widget.favoriteMeals.isEmpty
        ? Container(
            child:
                //TODO: complete with empty view screen
                Center(
                    child: Text('No Favorite meal selected..',
                        style: Theme.of(context).textTheme.body1)),
          )
        : listViewBuilder;
  }
}
