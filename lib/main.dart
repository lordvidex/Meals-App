import 'package:flutter/material.dart';

import './screens/category_meals_screen.dart';
import './screens/category_meals_details_screen.dart';
import './screens/error_page.dart';
import './screens/tabs_screen.dart';
import './screens/filters_screen.dart';
import './dummy-data.dart';
import './models/meal.dart';

void main() => runApp(MyApp());

class MyApp extends StatefulWidget {
  // This widget is the root of your application.
  @override
  _MyAppState createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {
  //FILTERS********

  List<Meal> filteredMeals = DUMMY_MEALS;
  Map<String, bool> _filters = {
    'vegan': false,
    'vegetarian': false,
    'lactose': false,
    'gluten': false,
  };

  void _setFilters(Map<String, bool> myNewFilters) {
    setState(() {
      _filters = myNewFilters;

      filteredMeals = DUMMY_MEALS.where((meal) {
        if (_filters['vegan'] && !meal.isVegan) {
          return false;
        }
        if (_filters['lactose'] && !meal.isLactoseFree) {
          return false;
        }
        if (_filters['vegetarian'] && !meal.isVegetarian) {
          return false;
        }
        if (_filters['gluten'] && !meal.isGluttenFree) {
          return false;
        }
        return true;
      }).toList();
    });
  }

//**************FILTERS
//FAVORITES**********
  List<Meal> favoriteMeals = [];
  void _toggleFavoriteMeal(String mealId) {
    final favMealIndex = favoriteMeals.indexWhere((meal) {
      return meal.id == mealId;
    });
    setState(() {
      (favMealIndex >= 0)
          ? favoriteMeals.removeAt(favMealIndex)
          : favoriteMeals
              .add(DUMMY_MEALS.firstWhere((meal) => meal.id == mealId));
    });
  }

  bool _isFavorite(String mealId) {
    return favoriteMeals
        .contains(DUMMY_MEALS.firstWhere((meal) => meal.id == mealId));
  }

//********* FAVORITES
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Flutter Demo',
      theme: ThemeData(
        primarySwatch: Colors.pink,
        accentColor: Colors.amber,
        canvasColor: Color.fromRGBO(255, 254, 229, 1),
        fontFamily: 'Raleway',
        textTheme: ThemeData.light().textTheme.copyWith(
              body1: TextStyle(
                color: Color.fromRGBO(20, 51, 51, 1),
              ),
              body2: TextStyle(
                color: Color.fromRGBO(20, 51, 51, 1),
              ),
              title: TextStyle(
                fontFamily: 'RobotoCondensed',
                fontSize: 20,
                fontWeight: FontWeight.bold,
              ),
            ),
      ),

      // home: CategoriesScreen(),
      routes: {
        '/': (ctx) => TabsScreen(favoriteMeals),
        CategoryDetails.routeName: (ctx) => CategoryDetails(filteredMeals),
        MealDetailsScreen.routeName: (ctx) =>
            MealDetailsScreen(_isFavorite, _toggleFavoriteMeal),
        FiltersScreen.routeName: (ctx) =>
            FiltersScreen(filters: _filters, setFilters: _setFilters),
      },
      onUnknownRoute: (settings) {
        return MaterialPageRoute(builder: (context) => ErrorPage());
      },
    );
  }
}
