import 'package:flutter/material.dart';
import 'package:fooderlich/fooderlich_theme.dart';
import 'card1.dart';
import 'card2.dart';
import 'card3.dart';

class Home extends StatefulWidget {
  const Home({super.key});

  @override
  State<Home> createState() => _HomeState();
}

class _HomeState extends State<Home> {
  int _current_index = 0;
  static List<Widget> Pages = <Widget>[
    const Card1(),
    const Card2(),
    const Card3(),
  ];
  void _onItemTapped(int index) {
    setState(() {
      _current_index = index;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Fooderlich', style: Theme.of(context).textTheme.headline6),
      ),
      body: Pages[_current_index],
      bottomNavigationBar: BottomNavigationBar(
        currentIndex: _current_index,
        onTap: _onItemTapped,
        selectedItemColor: Theme.of(context).textSelectionTheme.selectionColor,
        items: const [
          BottomNavigationBarItem(
              label: 'Card', icon: Icon(Icons.card_giftcard)),
          BottomNavigationBarItem(
              label: 'Card2', icon: Icon(Icons.card_giftcard)),
          BottomNavigationBarItem(
              label: 'Card3', icon: Icon(Icons.card_giftcard))
        ],
      ),
    );
  }
}
