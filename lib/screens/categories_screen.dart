import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:meal/modules/category.dart';
import 'package:meal/widgets/categoryitem.dart';
import '../dummy_data.dart';

class CategoriesScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: GridView(
        padding: EdgeInsets.all(25),
        gridDelegate: const SliverGridDelegateWithMaxCrossAxisExtent(
          maxCrossAxisExtent: 270,
          childAspectRatio: 3 / 2,
          crossAxisSpacing: 20,
          mainAxisSpacing: 20,
        ),
        children: DUMMY_CATEGORIES.map((catData) =>
            CategoryItem(id: catData.id, title: catData.title, color: catData.color)
            )
            .toList(),
      ),
    );
  }
}
