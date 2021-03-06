import 'package:flutter/material.dart';
import 'package:recipes/screens/grocery_screen.dart';
import 'package:recipes/screens/recipes_screen.dart';
import 'screens/explore_screen.dart';
import 'package:provider/provider.dart';
import 'models/models.dart';

class Home extends StatefulWidget {
  const Home({Key? key}) : super(key: key);

  @override
  State<StatefulWidget> createState() {
    return _HomeState();
  }
}

class _HomeState extends State<Home> {

  static List<Widget> pages = <Widget>[
    const ExploreScreen(),
    RecipesScreen(),
    const GroceryScreen(),
  ];

  @override
  Widget build(BuildContext context) {
    return Consumer<TabManager>(
      builder: (BuildContext context, tabManager, Widget? child) {
        return Scaffold(
          appBar: AppBar(title: Text('Recipes', style: Theme.of(context).textTheme.headline6)),
          body: IndexedStack(
            index: tabManager.selectedTab,
            children: pages,
          ),
          bottomNavigationBar: BottomNavigationBar(
            selectedItemColor: Theme.of(context).textSelectionTheme.selectionColor,
            currentIndex: tabManager.selectedTab,
            onTap: (index) {
              tabManager.goToTab(index);
            },
            items: const <BottomNavigationBarItem>[
              BottomNavigationBarItem(icon: Icon(Icons.explore), label: 'Explore'),
              BottomNavigationBarItem(icon: Icon(Icons.book), label: 'Recipes'),
              BottomNavigationBarItem(icon: Icon(Icons.list), label: 'To By'),
            ],
          ),
        );
      },
    );
  }
}
