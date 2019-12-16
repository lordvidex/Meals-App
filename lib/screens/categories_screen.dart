import 'package:flutter/material.dart';

import '../dummy-data.dart';
import '../widgets/category_item.dart';

class CategoriesScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return SafeArea(
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
                id: cat.id,
              ),
            )
            .toList(),
      ),
    );
  }
}
