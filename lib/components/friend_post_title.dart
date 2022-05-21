import 'package:flutter/material.dart';
import 'package:recipes/components/components.dart';
import 'package:recipes/models/models.dart';

class FriendPostTitle extends StatelessWidget {
  final Post post;
  const FriendPostTitle({Key? key, required this.post}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Row(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        CircleImage(imageProvider: AssetImage(post.profileImageUrl), imageRadius: 20),
        const SizedBox(width: 16),
        Expanded(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(post.comment),
                Text('${post.comment} min ago.', style: const TextStyle(fontWeight: FontWeight.w700)),
            ]),
        ),
      ],
    );
  }

}