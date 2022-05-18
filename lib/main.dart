import 'package:flutter/material.dart';
import 'fooder_theme.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    final darkTheme = FooderTheme.dark();

    return MaterialApp(
      theme: darkTheme,
      title: 'Recipes',
      home: Scaffold(
        appBar: AppBar(
            title: Text(
          'Recipes',
          style: darkTheme.textTheme.headline6,
        )),
        body: Center(child: Text('Main screen', style: darkTheme.textTheme.headline6,)),
      ),
    );
  }
}
