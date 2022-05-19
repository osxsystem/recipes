import 'package:flutter/material.dart';
import 'package:recipes/author_card.dart';
import 'fooder_theme.dart';

class Card2 extends StatelessWidget {

  const Card2({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Center(
      // 1
      child: Container(
        constraints: const BoxConstraints.expand(
          width: 350,
          height: 450,
        ),
        decoration: const BoxDecoration(
          image: DecorationImage(
            image: AssetImage('assets/mag5.png'),
            fit: BoxFit.cover,
          ),
          borderRadius: BorderRadius.all(
            Radius.circular(10.0),
          ),
        ),
        // 2
        child: Column(
          children: [
            // TODO 1: add author information
            const AuthorCard(
              authorName: 'Mike',
              title: 'Smoothie Connoisseur',
              imageProvider: AssetImage('assets/author_katz.jpeg'),
            ),
            Expanded(
              child: Stack(
                children: [
                  Positioned(
                    bottom: 16,
                    right: 16,
                    child: Text('Recipe', style: FooderTheme.lightTextTheme.headline1),
                  ),
                  Positioned(
                    left: 16,
                    bottom: 70,
                    child: RotatedBox(
                      quarterTurns: 3 ,
                      child: Text('Smoothies', style: FooderTheme.lightTextTheme.headline1)
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
