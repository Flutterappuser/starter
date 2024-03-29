import 'package:flutter/material.dart';

import 'fooderlich_theme.dart';

class Card1 extends StatelessWidget {
  const Card1({super.key});
  final String category = 'Editor\'s Choice';
  final String title = 'The Art of Dough';
  final String description = 'Learn to make the perfect bread.';
  final String chef = 'Ray Wenderlich';

  @override
  Widget build(BuildContext context) {
    return Center(
      child: Container(
        padding: const EdgeInsets.all(16),
        constraints: const BoxConstraints.expand(width: 350, height: 450),
        decoration: const BoxDecoration(
          color: Colors.red,
          image: DecorationImage(
            image: AssetImage('assets/mag1.png'),
            fit: BoxFit.fill,
          ),
          borderRadius: BorderRadius.all(Radius.circular(10.0)),
        ),
        child: Stack(children: [
          Text(
            category,
            style: FooderlichTheme.darkTextTheme.bodyText1,
          ),
          Positioned(
              top: 20,
              child: Text(
                title,
                style: FooderlichTheme.darkTextTheme.headline5,
              )),
          Positioned(
              bottom: 40,
              right: 20,
              child: Text(
                description,
                style: FooderlichTheme.darkTextTheme.headline2,
              )),
          Positioned(
              bottom: 20,
              right: 20,
              child: Text(
                chef,
                style: FooderlichTheme.darkTextTheme.headline2,
              )),
        ]),
      ),
    );
  }
}
