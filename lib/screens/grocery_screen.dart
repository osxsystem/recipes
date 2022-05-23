import 'package:flutter/material.dart';
import 'package:recipes/screens/empty_grocery_screen.dart';
import 'package:provider/provider.dart';
import 'package:recipes/models/models.dart';

class GroceryScreen extends StatelessWidget {
  const GroceryScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      floatingActionButton: FloatingActionButton(
        child: const Icon(Icons.add),
        onPressed: () {
          // TODO 11: Present GroceryItemScreen
        },
      ),
      body: buildGroceryScreen(),
    );
  }
  Widget buildGroceryScreen() {
    return Consumer<GroceryManager>(
        builder: (BuildContext context, GroceryManager manager, Widget? child) {
          if(manager.groceryItems.isNotEmpty) {
            // TODO 25: add GroceryListItem
            return Container(color: Colors.green,);
          } else {
            return const EmptyGroceryScreen();
          }
        }
    );
  }
}
