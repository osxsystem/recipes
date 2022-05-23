import 'package:flutter/material.dart';
import 'package:recipes/api/mock_fooderlich_service.dart';
import 'package:recipes/components/components.dart';
import 'package:recipes/models/simple_recipe.dart';

class RecipesScreen extends StatelessWidget {

  final exploreService = MockFooderlichService();

  RecipesScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return FutureBuilder(
        future: exploreService.getRecipes(),
        builder: (BuildContext context, AsyncSnapshot<List<SimpleRecipe>> snapshot) {
          if (snapshot.connectionState == ConnectionState.done) {
            return RecipesGridView(recipes: snapshot.data ?? []);
          } else {
            return const Center(child: CircularProgressIndicator(),);
          }
        }
    );
  }
}
