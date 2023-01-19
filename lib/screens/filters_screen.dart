import 'package:flutter/material.dart';

import '../widgets/main_drawer.dart';

class FiltersScreen extends StatefulWidget {
  @override
  State<StatefulWidget> createState() {
    // TODO: implement createState
    throw UnimplementedError();
  }

  static const routeName = '/filters';

  bool _GlutenFree = false;
  bool _LactoseFree = false;
  bool _Vegan = false;
  bool _Vegetarian = false;

  Widget buildSwitchListTile(String title, String description,
      bool currentValue, Function(bool) updateValue) {
    return SwitchListTile(
      title: Text(title),
      value: currentValue,
      onChanged: updateValue,
      subtitle: Text(description),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Your Filters'),
      ),
      body: Column(
        children: [
          Container(
            padding: EdgeInsets.all(20),
            child: const Text(
              'Adjust your Meal Selection',
              style: TextStyle(
                  fontSize: 20,
                  fontFamily: 'Raleway',
                  fontWeight: FontWeight.bold),
            ),
          ),
          Expanded(
            child: ListView(
              children: [
                buildSwitchListTile(
                    'Gluten free',
                    'Only Include Gluten free Meals',
                    _GlutenFree,
                    (newValue) {_GlutenFree=newValue;}),
                buildSwitchListTile(
                    'Lactose free',
                    'Only Include Lactose free Meals',
                    _LactoseFree,
                        (newValue) {_LactoseFree=newValue;}),
                buildSwitchListTile(
                    'Vegan',
                    'Only Include Vegan Meals',
                    _Vegan,
                        (newValue) {_Vegan=newValue;}),
                buildSwitchListTile(
                    'Vegetarian',
                    'Only Include Vegetarian Meals',
                    _Vegetarian,
                        (newValue) {
                          _Vegetarian=newValue;
                        }),

              ],
            ),
          ),
        ],
      ),
      drawer: const MainDrawer(),
    );
  }
}
