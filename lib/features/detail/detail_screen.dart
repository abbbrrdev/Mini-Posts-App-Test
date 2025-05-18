import 'package:auto_route/auto_route.dart';
import 'package:flutter/material.dart';

import 'package:mini_post_app/data/model/post.dart';

@RoutePage()
class DetailScreen extends StatelessWidget {
  final Post post;
  const DetailScreen({required this.post});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text('Post #${post.id}')),
      body: Padding(
        padding: EdgeInsets.all(16),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              post.title,
              style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
            ),
            SizedBox(height: 12),
            Text(post.body),
          ],
        ),
      ),
    );
  }
}
