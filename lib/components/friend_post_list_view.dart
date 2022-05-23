import 'package:flutter/material.dart';
import 'package:recipes/components/friend_post_title.dart';

import '../models/post.dart';

class FriendPostListView extends StatelessWidget {
  final List<Post> friendPosts;

  const FriendPostListView({Key? key, required this.friendPosts}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(left: 16, right: 16, top: 0),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text('Social chefs', style: Theme.of(context).textTheme.headline1),
          const SizedBox(height: 16),
          ListView.separated(
              primary: false,
              physics: const RangeMaintainingScrollPhysics(),
              shrinkWrap: true,
              scrollDirection: Axis.vertical,
              itemBuilder: (BuildContext context, int index) {
                final post = friendPosts[index];
                return FriendPostTitle(post: post);
              },
              separatorBuilder: (BuildContext context, int index) {
                return const SizedBox(height: 16);
              },
              itemCount: friendPosts.length)
        ],
      ),
    );
  }
}
