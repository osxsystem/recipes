import 'package:flutter/material.dart';
import 'package:recipes/screens/empty_grocery_screen.dart';
import 'package:provider/provider.dart';
import 'package:recipes/models/models.dart';
import 'package:recipes/screens/grocery_list_screen.dart';

class GroceryScreen extends StatelessWidget {
  const GroceryScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      floatingActionButton: FloatingActionButton(
        child: const Icon(Icons.add),
        onPressed: () {
          final manager = Provider.of<GroceryManager>(context, listen: false);
          manager.createNewItem();
        },
      ),
      body: buildGroceryScreen(),
    );
  }

  Widget buildGroceryScreen() {
    return Consumer<GroceryManager>(builder: (BuildContext context, GroceryManager manager, Widget? child) {
      if (manager.groceryItems.isNotEmpty) {
        return GroceryListScreen(manager: manager);
      } else {
        return const EmptyGroceryScreen();
      }
    });
  }
}
