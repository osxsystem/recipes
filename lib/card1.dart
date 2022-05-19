import 'package:flutter/material.dart';
import 'package:recipes/fooder_theme.dart';

class Card1 extends StatelessWidget {
  
  final String category = 'Editor\'s Choice';
  final String title = 'The Art of Dough';
  final String description = 'Learn to make the perfect bread.';
  final String chef = 'Ray Wenderlich';

  const Card1({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Center(
      child: Container(
        child: Stack(
          children: [
            Text(
              category,
              style: FooderTheme.darkTextTheme.bodyText1,
            ),
            Positioned(
              child: Text(
                title,
                style: FooderTheme.darkTextTheme.headline5,
              ),
              top: 20,
            ),
            Positioned(
              child: Text(
                description,
                style: FooderTheme.darkTextTheme.bodyText1,
              ),
              bottom: 20,
              right: 0,
            ),
            Positioned(
              child: Text(
                chef,
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
        decoration: const BoxDecoration(
          // 4
          image: DecorationImage(
            // 5
            image: AssetImage('assets/mag1.png'),
            // 6
            fit: BoxFit.cover,
          ),
          // 7
          borderRadius: BorderRadius.all(Radius.circular(10.0)),
        ),
      ),
    );
  }
}
