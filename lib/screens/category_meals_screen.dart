import 'package:flutter/material.dart';

import '../dummy-data.dart';
import '../widgets/meal_item.dart';

class CategoryDetails extends StatelessWidget {
  static const routeName = '/category-meals';
  // final String categoryId;
  // final String categoryTitle;
  // const CategoryDetails({this.categoryId, this.categoryTitle});

  @override
  Widget build(BuildContext context) {
    final properties =
        ModalRoute.of(context).settings.arguments as Map<String, String>;
    final String categoryId = properties['id'];
    final String categoryTitle = properties['title'];

    final categoryItems = DUMMY_MEALS
        .where((meal) => meal.categories.contains(categoryId))
        .toList();
    return Scaffold(
      appBar: AppBar(
        title: Text(categoryTitle),
      ),
      body: ListView.builder(
          itemCount: categoryItems.length,
          itemBuilder: (ctx, index) {
            return MealItem(
              id: categoryItems[index].id,
              title: categoryItems[index].title,
              affordability: categoryItems[index].affordability,
              complexity: categoryItems[index].complexity,
              duration: categoryItems[index].duration,
              imageUrl: categoryItems[index].imageUrl,
            );
          }),
    );
  }
}
