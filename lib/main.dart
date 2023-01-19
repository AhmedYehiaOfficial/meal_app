import 'package:flutter/material.dart';
import 'package:meal/screens/filters_screen.dart';
import 'package:meal/screens/meal_details_screen.dart';
import 'package:meal/screens/tabs_screen.dart';
import '../screens/categories_screen.dart';
import '../screens/category_meals_screen.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatefulWidget {

  @override
  // ignore: no_logic_in_create_state
  State<StatefulWidget> createState() => throw UnimplementedError();
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Flutter Demo',
      theme: ThemeData(
          primarySwatch: Colors.pink,
          canvasColor: const Color.fromRGBO(255, 232, 246, 1.0),
          textTheme: ThemeData.light().textTheme.copyWith(
                titleMedium:const TextStyle(
                    fontSize: 20,
                    fontFamily: 'Raleway',
                    fontWeight: FontWeight.bold),
              )),
      // home: CategoriesScreen(),
      routes: {
        '/': (context) => TabsScreen(),
        CategoryMealsScreen.routeName: (context) => CategoryMealsScreen(),
        MealDetailsScreen.routeName: (context) => MealDetailsScreen(),
        FiltersScreen.routeName:(context)=>FiltersScreen(),
      },
    );
  }

}

class MyHomePage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Meal App'),
      ),
      body: null,
    );
  }
}
