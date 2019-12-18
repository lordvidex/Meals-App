import 'package:flutter/material.dart';

import '../dummy-data.dart';

class MealDetailsScreen extends StatelessWidget {
  static const routeName = '/meal-detail';
  final Function _isFavorite;
  final Function _toggleFavoriteMeal;
  MealDetailsScreen(this._isFavorite, this._toggleFavoriteMeal);

  Widget buildSectionTitle(BuildContext context, String title) {
    return Container(
      margin: EdgeInsets.symmetric(vertical: 10),
      child: Text(
        title,
        style: Theme.of(context).textTheme.title,
      ),
    );
  }

  Widget buildSectionContainer({Widget child}) {
    return Container(
      height: 150,
      width: 300,
      padding: EdgeInsets.all(10),
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(10),
        border: Border.all(color: Colors.grey),
      ),
      child: child,
    );
  }

  Widget builderFloatingActionButton(String mealId) {
    return FloatingActionButton(
      onPressed: () => _toggleFavoriteMeal(mealId),
      child: _isFavorite(mealId)
          ? Icon(
              Icons.star,
            )
          : Icon(Icons.star_border),
    );
  }
  @override
  Widget build(BuildContext context) {
    final mealId = ModalRoute.of(context).settings.arguments as String;
    final selectedMeal = DUMMY_MEALS.firstWhere((meal) => meal.id == mealId);
    return Scaffold(
      appBar: AppBar(
        title: Text(
          selectedMeal.title,
        ),
      ),
      body: SafeArea(
        child: SingleChildScrollView(
          child: Column(
            children: <Widget>[
              Container(
                width: double.infinity,
                height: 300,
                child: Image.network(
                  selectedMeal.imageUrl,
                  fit: BoxFit.cover,
                ),
              ),
              buildSectionTitle(context, 'Ingredients'),
              buildSectionContainer(
                child: ListView.builder(
                  itemCount: selectedMeal.ingredients.length,
                  itemBuilder: (ctx, index) => Card(
                    child: Padding(
                      padding: const EdgeInsets.symmetric(
                        vertical: 5,
                        horizontal: 10,
                      ),
                      child: Text(selectedMeal.ingredients[index]),
                    ),
                    color: Theme.of(context).accentColor,
                  ),
                ),
              ),
              buildSectionTitle(context, 'Steps'),
              buildSectionContainer(
                child: ListView.builder(
                    itemBuilder: (ctx, index) {
                      return Column(
                        children: <Widget>[
                          ListTile(
                            leading: CircleAvatar(
                              child: Text(
                                '#${index + 1}',
                              ),
                            ),
                            title: Text(selectedMeal.steps[index]),
                          ),
                          Divider(),
                        ],
                      );
                    },
                    itemCount: selectedMeal.steps.length),
              ),
            ],
          ),
        ),
      ),
      floatingActionButton: builderFloatingActionButton(mealId),
    );
  }
}
