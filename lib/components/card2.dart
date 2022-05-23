import 'package:flutter/material.dart';
import 'package:recipes/components/author_card.dart';
import 'package:recipes/models/models.dart';

import '../fooder_theme.dart';

class Card2 extends StatelessWidget {
  final ExploreRecipe recipe;

  const Card2({Key? key, required this.recipe}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Center(
      // 1
      child: Container(
        constraints: const BoxConstraints.expand(
          width: 350,
          height: 450,
        ),
        decoration: BoxDecoration(
          image: DecorationImage(
            image: AssetImage(recipe.backgroundImage),
            fit: BoxFit.cover,
          ),
          borderRadius: const BorderRadius.all( Radius.circular(10.0) ),
        ),
        // 2
        child: Column(
          children: [
            AuthorCard(
              authorName: recipe.authorName,
              title: recipe.authorName,
              imageProvider: AssetImage(recipe.profileImage),
            ),
            Expanded(
              child: Stack(
                children: [
                  Positioned(
                    bottom: 16,
                    right: 16,
                    child: Text(recipe.title, style: FooderTheme.lightTextTheme.headline1),
                  ),
                  Positioned(
                    left: 16,
                    bottom: 70,
                    child: RotatedBox(
                      quarterTurns: 3 ,
                      child: Text(recipe.subtitle, style: FooderTheme.lightTextTheme.headline1)
                    ),
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
