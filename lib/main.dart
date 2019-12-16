
import 'package:flutter/material.dart';

import './screens/category_meals_screen.dart';
import './screens/category_meals_details_screen.dart';
import './screens/error_page.dart';
import './screens/tabs_screen.dart';

void main() => runApp(MyApp());

class MyApp extends StatelessWidget {
  // This widget is the root of your application.
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
        '/':(ctx)=>TabsScreen(),
        CategoryDetails.routeName: (ctx)=>CategoryDetails(),
        MealDetailsScreen.routeName:(ctx)=>MealDetailsScreen(),
      },
      onUnknownRoute: (settings){
        return MaterialPageRoute(builder: (context)=>ErrorPage());
      },
    );
  }
}
