import 'package:flutter/material.dart';
import 'package:recipes/home.dart';
import 'fooder_theme.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      theme: Theme.of(context).brightness == Brightness.dark ? FooderTheme.dark() : FooderTheme.light(),
      title: 'Recipes',
      home: const Home(),
    );
  }
}
