import 'package:flutter/material.dart';
import 'package:recipes/fooder_theme.dart';
import 'package:recipes/models/models.dart';

class Card1 extends StatelessWidget {
  final ExploreRecipe recipe;

  const Card1({Key? key, required this.recipe}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Center(
      child: Container(
        child: Stack(
          children: [
            Text(
              recipe.subtitle,
              style: FooderTheme.darkTextTheme.bodyText1,
            ),
            Positioned(
              child: Text(
                recipe.title,
                style: FooderTheme.darkTextTheme.headline5,
              ),
              top: 20,
            ),
            Positioned(
              child: Text(
                recipe.message,
                style: FooderTheme.darkTextTheme.bodyText1,
              ),
              bottom: 20,
              right: 0,
            ),
            Positioned(
              child: Text(
                recipe.authorName,
                style: FooderTheme.darkTextTheme.bodyText1,
              ),
              bottom: 0,
              right: 0,
            ),
          ],
        ),
        // 1
        padding: const EdgeInsets.all(16),
        // 2
        constraints: const BoxConstraints.expand(
          width: 350,
          height: 450,
        ),
        // 3
        decoration: BoxDecoration(
          // 4
          image: DecorationImage(
            // 5
            image: AssetImage(recipe.backgroundImage),
            // 6
            fit: BoxFit.cover,
          ),
          // 7
          borderRadius: const BorderRadius.all(Radius.circular(10.0)),
        ),
      ),
    );
  }
}
