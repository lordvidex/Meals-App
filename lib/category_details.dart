import 'package:flutter/material.dart';

import './dummy-data.dart';

class CategoryDetails extends StatelessWidget {
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
            return Text(categoryItems[index].title);
          }),
    );
  }
}
