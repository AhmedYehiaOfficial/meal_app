import 'package:flutter/material.dart';
import '../dummy_data.dart';
import '../modules/meal.dart';
import '../widgets/mealitem.dart';

class CategoryMealsScreen extends StatefulWidget {
  static const routeName = 'category_meals';

  @override
  State<CategoryMealsScreen> createState() => _CategoryMealsScreenState();
}

class _CategoryMealsScreenState extends State<CategoryMealsScreen> {
  late String categoryTitle;
  late List<Meal> displayMeals;

  void removeMeal(String mealId) {
    setState(() {
      displayMeals.retainWhere((meal) => meal.id == mealId);
    });
  }
@override
  void didChangeDependencies() {
  final routeArg = ModalRoute.of(context)?.settings.arguments as Map<String, String>;
  final categoryId = routeArg['id'];
  categoryTitle = routeArg['title']!;
  displayMeals = DUMMY_MEALS.where((meal) {
    return meal.categories.contains(categoryId);
  }).toList();
    super.didChangeDependencies();
  }
  @override

  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text(categoryTitle!)),
      body: ListView.builder(
        itemBuilder: (ctx, index) {
          return MealItem(
            id: displayMeals[index].id,
            imageUrl: displayMeals[index].imageUrl,
            title: displayMeals[index].title,
            affordability: displayMeals[index].affordability,
            complexity: displayMeals[index].complexity,
            duration: displayMeals[index].duration,
            removeItem: removeMeal,
          );
        },
        itemCount: displayMeals.length,
      ),
    );
  }
}
