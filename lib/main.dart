import 'package:flutter/material.dart';
import 'package:recipes/home.dart';
import 'fooder_theme.dart';
import 'package:provider/provider.dart';
import 'models/models.dart';
import 'navigation/app_router.dart';

void main() {
  runApp(const Fooderlich());
}

class Fooderlich extends StatefulWidget {

  const Fooderlich({Key? key}) : super(key: key);

  @override
  State<Fooderlich> createState() => _FooderlichState();
}

class _FooderlichState extends State<Fooderlich> {
  final _groceryManager = GroceryManager();
  final _profileManager = ProfileManager();
  final _appStateManager = AppStateManager();

  late AppRouter _appRouter;

  @override
  void initState() {
    super.initState();
    _appRouter = AppRouter(
      appStateManager: _appStateManager,
      groceryManager: _groceryManager,
      profileManager: _profileManager,
    );
  }

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
        theme: Theme.of(context).brightness == Brightness.dark ? FooderTheme.dark() : FooderTheme.light(),
        title: 'Recipes',
        home: MultiProvider(
          providers: [
            ChangeNotifierProvider(create: (context) => _groceryManager),
            ChangeNotifierProvider(create: (context) => _profileManager),
            ChangeNotifierProvider(create: (context) => _appStateManager),
          ],
          child: Consumer<ProfileManager>(
            builder: (context, profileManager, child) {
              ThemeData theme;
              if(profileManager.darkMode) {
                theme = FooderTheme.dark();
              } else {
                theme = FooderTheme.light();
              }

              return MaterialApp(
                theme: theme,
                title: 'Fooder',
                home: Router(
                  routerDelegate: _appRouter,
                  backButtonDispatcher: RootBackButtonDispatcher(),
                )
              );
            },
          ),
        ));
  }
}
