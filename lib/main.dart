import 'package:flutter/material.dart';
import 'package:recipes/home.dart';
import 'fooder_theme.dart';
import 'package:provider/provider.dart';
import 'models/models.dart';

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
        home: MultiProvider(
          providers: [
            ChangeNotifierProvider(create: (context) => TabManager()),
          ],
          child: const Home(),
        ));
  }
}
