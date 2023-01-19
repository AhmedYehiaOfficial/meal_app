import 'package:flutter/material.dart';
import 'package:meal/screens/categories_screen.dart';
import 'package:meal/screens/favorite_screen.dart';

import '../widgets/main_drawer.dart';

class TabsScreen extends StatefulWidget {
  @override
  State<TabsScreen> createState() => _TabsScreenState();
}

class _TabsScreenState extends State<TabsScreen> {
  final List<Map<String, Object>> pages = [
    {
      'page': CategoriesScreen(),
      'title': 'Categories',
    }, {
      'page': FavoriteScreen(),
      'title': 'Your Favorite'
    }
  ];
  int selectedPageIndex = 0;

  void selectPage(int value) {
    setState(() {
      selectedPageIndex = value;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(pages[selectedPageIndex]['title'].toString()),
      ),
      body:pages[selectedPageIndex]['page'] as Widget,
      bottomNavigationBar: BottomNavigationBar(
        onTap: selectPage,
        backgroundColor: Theme
            .of(context)
            .primaryColor,
        selectedItemColor: Color.fromRGBO(3, 21, 79, 1.0),
        unselectedItemColor: Colors.white,
        currentIndex: selectedPageIndex,
        items: const [
          BottomNavigationBarItem(
              icon: Icon(Icons.category), label: 'Categories'),
          BottomNavigationBarItem(icon: Icon(Icons.star), label: 'Favorite'),

        ],
      ),
      drawer:MainDrawer(),
    );
  }
}
