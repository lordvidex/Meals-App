import 'package:flutter/material.dart';

import '../widgets/meal_item.dart';
import '../models/meal.dart';

class CategoryDetails extends StatefulWidget {
  static const routeName = '/category-meals';
  final List<Meal> filteredMeals;

  const CategoryDetails(this.filteredMeals);

  @override
  _CategoryDetailsState createState() => _CategoryDetailsState();
}

class _CategoryDetailsState extends State<CategoryDetails> {
  String categoryTitle;
  String categoryId;
  List<Meal> categoryItems;
  bool hasLoadedCategoryItems = false;
 
  //To get a new list of widgets without showing popped
  //items from the details page
  @override
  void didChangeDependencies() {
    if(!hasLoadedCategoryItems){
    final properties =
        ModalRoute.of(context).settings.arguments as Map<String, String>;
      categoryId = properties['id'];
    categoryTitle = properties['title'];

    categoryItems = widget.filteredMeals
        .where((meal) => meal.categories.contains(categoryId))
        .toList();
        hasLoadedCategoryItems = true;
    }
    super.didChangeDependencies();
  }

  @override
  Widget build(BuildContext context) {
    
    return Scaffold(
      appBar: AppBar(
        title: Text(categoryTitle),
      ),
      body:
      //TODO: Return an emptyView screen 
      ListView.builder(
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
