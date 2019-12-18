import 'package:flutter/material.dart';

import '../widgets/main_drawer.dart';

class FiltersScreen extends StatefulWidget {
  static const routeName = '/filters';
  final Map<String, bool> filters;
  final Function setFilters;
  const FiltersScreen({this.filters, this.setFilters});

  @override
  _FiltersScreenState createState() => _FiltersScreenState();
}

class _FiltersScreenState extends State<FiltersScreen> {
  bool _isVegan;
  bool _isVegetarian;
  bool _isGlutenFree;
  bool _isLactoseFree;

  @override
  void initState() {
    _isVegan = widget.filters['vegan'];
    _isVegetarian = widget.filters['vegetarian'];
    _isGlutenFree = widget.filters['gluten'];
    _isLactoseFree = widget.filters['lactose'];
    super.initState();
  }

  Widget _buildSwitchListTile({
    @required String title,
    @required String description,
    @required bool value,
    @required Function updateFunction,
  }) {
    return SwitchListTile(
      onChanged: updateFunction,
      value: value,
      title: Text(title),
      subtitle: Text(description),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Filters'),
        actions: <Widget>[
          IconButton(
              icon: Icon(Icons.save),
              onPressed: () {
                final filters = {
                  'vegan': _isVegan,
                  'vegetarian': _isVegetarian,
                  'lactose': _isLactoseFree,
                  'gluten': _isGlutenFree,
                };
                widget.setFilters(filters);
              }),
        ],
      ),
      drawer: MainDrawer(),
      body: Column(
        children: <Widget>[
          Container(
            padding: EdgeInsets.all(30),
            child: Text(
              'Adjust your meal selection',
              style: Theme.of(context).textTheme.title,
            ),
          ),
          Expanded(
            child: ListView(
              children: <Widget>[
                _buildSwitchListTile(
                  title: 'Gluten-Free',
                  description: 'Only include gluten free meals',
                  value: _isGlutenFree,
                  updateFunction: (val) {
                    setState(() {
                      _isGlutenFree = val;
                    });
                  },
                ),
                _buildSwitchListTile(
                  updateFunction: (val) {
                    setState(() {
                      _isLactoseFree = val;
                    });
                  },
                  value: _isLactoseFree,
                  title: "Lactose-Free",
                  description: 'Only include lactose free meals',
                ),
                _buildSwitchListTile(
                  value: _isVegan,
                  description: "Only include Vegan foods",
                  title: 'Vegan meals',
                  updateFunction: (val) {
                    setState(() {
                      _isVegan = val;
                    });
                  },
                ),
                _buildSwitchListTile(
                  value: _isVegetarian,
                  description: "Only include Vegetarian foods",
                  title: 'Vegetarian foods',
                  updateFunction: (val) {
                    setState(() {
                      _isVegetarian = val;
                    });
                  },
                )
              ],
            ),
          ),
        ],
      ),
    );
  }
}
