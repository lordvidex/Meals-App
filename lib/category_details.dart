import 'package:flutter/material.dart';

class CategoryDetails extends StatelessWidget {
  final String categoryId;
  final String categoryTitle;
  const CategoryDetails({this.categoryId, this.categoryTitle});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text(categoryTitle),),
      body: Center(
        child: Text(
          'These are the $categoryTitle recipes',
          style: Theme.of(context).textTheme.body1,
        ),
      ),
    );
  }
}
