import 'package:flutter/material.dart';
import 'package:meal/dummy_data.dart';

class MealDetailsScreen extends StatelessWidget {
  static const routeName = 'meal_details';

  Widget buildSectionTitle(String text) {
    return Container(
      margin: const EdgeInsets.symmetric(vertical: 10),
      child: Text(
        text,
        style: const TextStyle(
            fontSize: 20, fontFamily: 'Raleway', fontWeight: FontWeight.bold),
      ),
    );
  }

  Widget buildContainer(Widget child) {
    return Container(
        decoration: BoxDecoration(
          color: Colors.white70,
          border: Border.all(color: Colors.pinkAccent),
          borderRadius: BorderRadius.circular(10),
        ),
        padding: const EdgeInsets.all(10),
        margin: const EdgeInsets.all(10),
        height: 200,
        width: 300,
        child: child);
  }

  @override
  Widget build(BuildContext context) {
    final mealId = ModalRoute.of(context)?.settings.arguments as String;
    final selectedMeal = DUMMY_MEALS.firstWhere((meal) => meal.id == mealId);
    return Scaffold(
        appBar: AppBar(
          title: Text(selectedMeal.title),
        ),
        body: SingleChildScrollView(
          child: Column(
            children: [
              Container(
                width: double.infinity,
                height: 250,
                child: Image.network(
                  selectedMeal.imageUrl,
                  fit: BoxFit.cover,
                ),
              ),
              buildSectionTitle('Ingredients'),
              buildContainer(ListView.builder(
                itemBuilder: (ctx, index) => Card(
                  child: Padding(
                    padding:
                        const EdgeInsets.symmetric(vertical: 5, horizontal: 10),
                    child: Text(
                      selectedMeal.ingredients[index],
                      style: const TextStyle(
                          color: Color.fromRGBO(112, 0, 69, 1.0)),
                    ),
                  ),
                ),
                itemCount: selectedMeal.ingredients.length,
              )),
              buildSectionTitle('Steps'),
              buildContainer(ListView.builder(
                itemBuilder: (ctx, index) => Column(
                  children: [
                    ListTile(
                      leading: CircleAvatar(
                        child: Text('# ${index + 1}'),
                      ),
                      title: Text(selectedMeal.steps[index]),
                    ),
                   const Divider(color: Colors.pinkAccent),
                  ],
                ),
                itemCount: selectedMeal.steps.length,
              ))
            ],
          ),
        ),
    floatingActionButton:FloatingActionButton(
      onPressed: (){
        Navigator.of(context).pop(mealId);
      },
      child: Icon(Icons.delete),
    )
      ,);
  }
}
