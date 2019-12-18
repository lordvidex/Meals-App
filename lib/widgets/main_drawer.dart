import 'package:flutter/material.dart';

import '../screens/filters_screen.dart';

class MainDrawer extends StatelessWidget {
  Widget drawerItems(
      String title, IconData icon, String routeName, BuildContext context) {
    return ListTile(
      leading: Icon(
        icon,
        size: 26,
      ),
      title: Text(
        title,
        style: TextStyle(
          fontSize: 24,
          fontFamily: 'RobotoCondensed',
          fontWeight: FontWeight.bold,
        ),
      ),
      onTap: () {
        Navigator.of(context).pushReplacementNamed(routeName);
      },
    );
  }

  @override
  Widget build(BuildContext context) {
    return Drawer(
      child: Column(
        children: <Widget>[
          Container(
            color: Theme.of(context).accentColor,
            child: Text(
              'Cooking Up!',
              style: TextStyle(
                fontSize: 30,
                color: Colors.red,
                fontFamily: 'RobotoCondensed',
                letterSpacing: 2,
                fontWeight: FontWeight.w900,
              ),
            ),
            width: double.infinity,
            height: 120,
            alignment: Alignment.centerLeft,
            padding: EdgeInsets.all(20),
          ),
          SizedBox(
            height: 20,
          ),
          drawerItems(
            'Meals',
            Icons.restaurant,
            '/',
            context,
          ),
          SizedBox(height: 20,),
          drawerItems(
            'Filters',
            Icons.settings,
            FiltersScreen.routeName,
            context,
          ),
        ],
      ),
    );
  }
}
