import 'package:deli_meals/dummy-data.dart';
import 'package:flutter/material.dart';

class MealDetailsScreen extends StatelessWidget {
  static const routeName = '/meal-detail';
  @override
  Widget build(BuildContext context) {
    final mealId = ModalRoute.of(context).settings.arguments as String;
    return Scaffold(
        appBar: AppBar(
          title: Text(
              DUMMY_MEALS.where((meal) => meal.id == mealId).toList()[0].title),
        ),
        body: Center(
          child: Text(mealId),
        ));
  }
}
