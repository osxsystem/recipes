import 'package:flutter/material.dart';

import 'package:flutter/material.dart';
import 'package:recipes/card1.dart';
import 'package:recipes/card2.dart';
import 'package:recipes/card3.dart';

class Home extends StatefulWidget {
  const Home({Key? key}) : super(key: key);

  @override
  State<StatefulWidget> createState() {
    return _HomeState();
  }
}

class _HomeState extends State<Home> {
  // 7
  int _selectedIndex = 0;

  // 8
  static List<Widget> pages = <Widget>[
    Card1(),
    // TODO: Replace with Card2
    Card2(),
    // TODO: Replace with Card3
    Card3(),
  ];

// 9
  void _onItemTapped(int index) {
    setState(() {
      _selectedIndex = index;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar( title: Text( 'Recipes', style: Theme.of(context).textTheme.headline6 ) ),
      body: pages[_selectedIndex],
      bottomNavigationBar: BottomNavigationBar(
        selectedItemColor: Theme.of(context).textSelectionTheme.selectionColor,
        currentIndex: _selectedIndex,
        onTap: _onItemTapped,
        items: const <BottomNavigationBarItem> [
          BottomNavigationBarItem(icon: Icon(Icons.card_giftcard), label: 'Card'),
          BottomNavigationBarItem(icon: Icon(Icons.card_giftcard), label: 'Card2'),
          BottomNavigationBarItem(icon: Icon(Icons.card_giftcard), label: 'Card3'),
        ],
      ),
    );
  }
}
