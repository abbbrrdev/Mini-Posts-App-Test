import 'package:auto_route/auto_route.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import '../../router/router.dart';
import '../../provider/post_provider.dart';
import 'util/enum_status.dart';

@RoutePage()
class MainScreen extends StatelessWidget {
  const MainScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final provider = Provider.of<PostProvider>(context);
    final status = provider.status;
    final posts = provider.posts;
    final fetchPosts = provider.fetchPosts;

    return Scaffold(
      appBar: AppBar(
        title: const Text('Posts'),
        backgroundColor: Colors.transparent,
        surfaceTintColor: Colors.transparent,
      ),
      body: Column(
        children: [
          Padding(
            padding: const EdgeInsets.all(16),
            child: TextField(
              decoration: const InputDecoration(
                border: OutlineInputBorder(),
                prefixIcon: Icon(Icons.search),
                labelText: 'Фильтр по поиску',
              ),
              onChanged: context.read<PostProvider>().filterPosts,
            ),
          ),
          Expanded(
            child: Builder(
              builder: (_) {
                switch (status) {
                  case PostStatus.loading:
                    return const Center(child: CircularProgressIndicator());

                  case PostStatus.error:
                    return Center(
                      child: Column(
                        mainAxisSize: MainAxisSize.min,
                        children: [
                          const Text('Ошибка загрузки'),
                          const SizedBox(height: 10),
                          ElevatedButton(
                            onPressed: fetchPosts,
                            child: const Text('Повторить'),
                          ),
                        ],
                      ),
                    );

                  case PostStatus.success:
                    return ListView.builder(
                      itemCount: posts.length,
                      itemBuilder: (_, i) {
                        final post = posts[i];
                        return Card(
                          margin: const EdgeInsets.symmetric(horizontal: 12, vertical: 6),
                          child: ListTile(
                            title: Text(
                              post.title,
                              style: const TextStyle(fontWeight: FontWeight.bold),
                            ),
                            subtitle: Text(post.body.split('\n').first),
                            onTap: () {
                             context.pushRoute(DetailRoute(post: post));
                            },
                          ),
                        );
                      },
                    );

                  default:
                    return const SizedBox.shrink();
                }
              },
            ),
          ),
        ],
      ),
    );
  }
}
