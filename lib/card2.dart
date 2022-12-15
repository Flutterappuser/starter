import 'package:flutter/material.dart';

import 'fooderlich_theme.dart';

class Card2 extends StatelessWidget {
  const Card2({super.key});

  @override
  Widget build(BuildContext context) {
    return Center(
      child: Container(
        padding: const EdgeInsets.all(16),
        constraints: const BoxConstraints.expand(height: 450, width: 350),
        decoration: const BoxDecoration(
            borderRadius: BorderRadius.all(Radius.circular(10.0)),
            image: DecorationImage(
              image: AssetImage('assets/mag5.png'),
              fit: BoxFit.fill,
            )),
        child: Column(
          children: [
            const AuthorCard(
                authorName: 'Mike Katz',
                title: 'Smoothie Connoisseur',
                imageProvider: AssetImage('assets/author_katz.jpeg')),
            Expanded(
              child: Stack(
                children: [
                  Positioned(
                    bottom: 16,
                    right: 16,
                    child: Text(
                      'Recipe',
                      style: FooderlichTheme.lightTextTheme.headline1,
                    ),
                  ),
                  // 4
                  Positioned(
                    bottom: 70,
                    left: 16,
                    child: RotatedBox(
                      quarterTurns: 3,
                      child: Text(
                        'Smoothies',
                        style: FooderlichTheme.lightTextTheme.headline1,
                      ),
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

class AuthorCard extends StatefulWidget {
  const AuthorCard(
      {super.key,
      required this.authorName,
      required this.imageProvider,
      required this.title});
  final String authorName;
  final String title;
  final ImageProvider imageProvider;

  @override
  State<AuthorCard> createState() => _AuthorCardState();
}

class _AuthorCardState extends State<AuthorCard> {
  bool isFavorit = false;
  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        Row(
          children: [
            CircleImage(
              imageProvider: widget.imageProvider,
              imageReduis: 28,
            ),
            const SizedBox(width: 8),
            Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  widget.authorName,
                  style: FooderlichTheme.lightTextTheme.headline2,
                ),
                Text(
                  widget.title,
                  style: FooderlichTheme.lightTextTheme.headline3,
                ),
              ],
            ),
          ],
        ),
        IconButton(
            // 4
            icon: Icon(
                isFavorit ? Icons.favorite_rounded : Icons.favorite_border),
            iconSize: 30,
            color: Colors.red[400],
            // 5
            onPressed: () {
              setState(() {
                isFavorit = !isFavorit;
              });
              const snackBar = SnackBar(content: Text('Press Favorite'));
              ScaffoldMessenger.of(context).showSnackBar(snackBar);
            }),
      ],
    );
  }
}

class CircleImage extends StatelessWidget {
  const CircleImage(
      {super.key, this.imageReduis = 20, required this.imageProvider});
  final double imageReduis;
  final ImageProvider imageProvider;

  @override
  Widget build(BuildContext context) {
    return CircleAvatar(
      backgroundColor: Colors.white,
      radius: imageReduis - 5,
      backgroundImage: imageProvider,
    );
  }
}
