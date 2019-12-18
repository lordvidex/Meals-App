import 'package:flutter/material.dart';

import './categories_screen.dart';
import './category_meals_favorites_screen.dart';
import '../widgets/main_drawer.dart';
import '../models/meal.dart';

class TabsScreen extends StatefulWidget {
  final List<Meal>favoriteMeals;

  const TabsScreen(this.favoriteMeals);

  @override
  _TabsScreenState createState() => _TabsScreenState();
}

class _TabsScreenState extends State<TabsScreen> {
  var _currentIndex = 0;
  List<Map<String, Object>> _tabs;
  @override
  void initState() {
    _tabs = [
    {
      'page': CategoriesScreen(),
      'title': 'Categories',
    },
    {
      'page': FavoritesScreen(widget.favoriteMeals),
      'title': 'Favorites',
    },
  ];
    super.initState();
  }
  void _tabClicked(int index) {
    setState(() {
      _currentIndex = index;
    });
  }
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      drawer: MainDrawer(),
      appBar: AppBar(
        title: Text(_tabs[_currentIndex]['title']),
      ),
      bottomNavigationBar: BottomNavigationBar(
        
        items: [
          BottomNavigationBarItem(
            backgroundColor: Theme.of(context).primaryColor,
            icon: Icon(Icons.category),
            title: const Text('Categories'),
          ),
          BottomNavigationBarItem(
            backgroundColor: Theme.of(context).primaryColor,
            icon: Icon(Icons.star),
            title: const Text('Favorites'),
          )
        ],
        currentIndex: _currentIndex,
        onTap: _tabClicked,
        type: BottomNavigationBarType.shifting,
        showUnselectedLabels: true,
        selectedItemColor: Theme.of(context).accentColor,
        unselectedItemColor: Colors.white,
      ),
      body: _tabs[_currentIndex]['page'],
    );
  }
}
