import 'package:flutter/material.dart';
import 'package:recipes/components/friend_post_list_view.dart';
import 'package:recipes/components/today_recipe_list_view.dart';

import '../models/models.dart';
import '../api/mock_fooderlich_service.dart';

class ExploreScreen extends StatelessWidget {
  final mockService = MockFooderlichService();

  ExploreScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return FutureBuilder(
      future: mockService.getExploreData(),
      builder: (context, AsyncSnapshot<ExploreData> snapshot) {
        if (snapshot.connectionState == ConnectionState.done) {
          return ListView(children: [
            TodayRecipeListView(recipes: snapshot.data?.todayRecipes ?? []),
            const SizedBox(
              height: 16,
            ),
            FriendPostListView(friendPosts: snapshot.data?.friendPosts ?? []),
          ]);
        } else {
          return const Center(
            child: CircularProgressIndicator(),
          );
        }
      },
    );
  }
}
