import 'package:deli_meals/category_item.dart';
import 'package:flutter/material.dart';

import './dummy-data.dart';

class CategoriesScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Meal App'),
      ),
      body: SafeArea(
              child: GridView(
                padding: EdgeInsets.all(25),
          gridDelegate: SliverGridDelegateWithMaxCrossAxisExtent(
            maxCrossAxisExtent: 200,
            mainAxisSpacing: 15,
            crossAxisSpacing: 20,
            childAspectRatio: 1.5,
          ),
          children: DUMMY_CATEGORIES
              .map(
                (cat) => CategoryItem(
                  color: cat.color,
                  title: cat.title,
                ),
              )
              .toList(),
        ),
      ),
    );
  }
}
