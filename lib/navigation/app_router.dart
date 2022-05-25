import 'package:flutter/material.dart';
import 'package:recipes/screens/home.dart';
import 'package:recipes/models/fooderlich_pages.dart';
import 'package:recipes/screens/screen.dart';
import 'package:recipes/models/models.dart';

class AppRouter extends RouterDelegate with ChangeNotifier, PopNavigatorRouterDelegateMixin {

  @override
  final GlobalKey<NavigatorState> navigatorKey;

  final AppStateManager appStateManager;

  final GroceryManager groceryManager;

  final ProfileManager profileManager;

  AppRouter({
    required this.appStateManager,
    required this.groceryManager,
    required this.profileManager,
  }) : navigatorKey = GlobalKey<NavigatorState>() {
    appStateManager.addListener(notifyListeners);
    groceryManager.addListener(notifyListeners);
    profileManager.addListener(notifyListeners);
  }

  @override
  void dispose() {
    appStateManager.removeListener(notifyListeners);
    groceryManager.removeListener(notifyListeners);
    profileManager.removeListener(notifyListeners);
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Navigator(
      key: navigatorKey,
      onPopPage: _handlePopPage,
      pages: [
        if (!appStateManager.isInitialized) SplashScreen.page(),
        if (appStateManager.isInitialized && !appStateManager.isLoggedIn) LoginScreen.page(),
        if (appStateManager.isLoggedIn && !appStateManager.isOnboardingComplete) OnboardingScreen.page(),
        // Add Home
        if (appStateManager.isOnboardingComplete) Home.page(appStateManager.getSelectedTab),
        // Create new item
        if (groceryManager.isCreateNewItem)
          GroceryItemScreen.page(
            onCreate: (item) {
              groceryManager.addItem(item);
            },
            onUpdate: (item, index) {
              // 4 No update
            },
          ),
        // Select GroceryItemScreen
        if (groceryManager.selectedIndex != -1)
          GroceryItemScreen.page(
            item: groceryManager.selectedGroceryItem,
            index: groceryManager.selectedIndex,
            onCreate: (_) {},
            onUpdate: (item, index) { groceryManager.updateItem(item, index); },
          ),
        // Add Profile Screen
        if(profileManager.didSelectUser) ProfileScreen.page(profileManager.getUser),
        if(profileManager.didTapOnRaywenderlich) WebViewScreen.page(),
      ],
    );
  }

  bool _handlePopPage(Route<dynamic> route, result) {
    if (!route.didPop(result)) {
      return false;
    }
    // Handle Onboarding and splash
    if (route.settings.name == FooderlichPages.onboardingPath) {
      appStateManager.logout();
    }

    // Handle state when user closes grocery item screen
    if(route.settings.name == FooderlichPages.groceryItemDetails) {
      groceryManager.groceryItemTapped(-1);
    }
    // Handle state when user closes profile screen
    if (route.settings.name == FooderlichPages.profilePath) {
      profileManager.tapOnProfile(false);
    }
    if(route.settings.name == FooderlichPages.raywenderlich) {
      profileManager.tapOnRaywenderlich(false);
    }
    return true;
  }

  @override
  Future<void> setNewRoutePath(configuration) async => null;
}
