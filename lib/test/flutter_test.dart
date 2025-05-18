import 'package:flutter_test/flutter_test.dart';
import 'package:mini_post_app/data/model/post.dart';

List<Post> filterPosts(List<Post> all, String query) {
  if (query.isEmpty) return all;
  final q = query.toLowerCase();
  return all.where((p) => p.title.toLowerCase().contains(q)).toList();
}

void main() {
  test('filterPosts возвращает только совпадающие заголовки', () {
    final posts = [
      Post(id: 1, title: 'Hello World', body: 'test test'),
      Post(id: 2, title: 'Flutter is great', body: 'test')
    ];
    final result = filterPosts(posts, 'flutter');
    expect(result.length, 1);
    expect(result.first.id, 2);
  });
}



