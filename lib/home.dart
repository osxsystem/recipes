import 'package:flutter/material.dart';

import 'package:flutter/material.dart';
class Home extends StatefulWidget {
  const Home({Key? key}) : super(key: key);

  @override
  State<StatefulWidget> createState() {
    return _HomeState();
  }
}

class _HomeState extends State<Home> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text('Recipes', style: Theme.of(context).textTheme.headline6,),),
      body: Center(
        child: Text('Cooking', style: Theme.of(context).textTheme.bodyLarge,),
      ),
    );
  }
}