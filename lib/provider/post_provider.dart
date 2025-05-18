import 'dart:convert';
import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;

import '../data/model/post.dart';
import '../features/main/util/enum_status.dart';

class PostProvider with ChangeNotifier {
  List<Post> _posts = [];
  List<Post> _filteredPosts = [];

  List<Post> get posts => List.unmodifiable(_filteredPosts);

  PostStatus _status = PostStatus.initial;
  PostStatus get status => _status;

  String? _error;
  String? get error => _error;

  void _updateStatus(PostStatus status, {String? error}) {
    _status = status;
    _error = error;
    notifyListeners();
  }

  Future<void> fetchPosts() async {
    _updateStatus(PostStatus.loading);

    try {
      final response = await http.get(Uri.parse('https://jsonplaceholder.typicode.com/posts'));

      if (response.statusCode == 200) {
        final List<dynamic> jsonData = json.decode(response.body);
        _posts = jsonData.map((json) => Post.fromJson(json)).toList();
        _filteredPosts = List<Post>.from(_posts);
        _updateStatus(PostStatus.success);
      } else {
        _updateStatus(PostStatus.error, error: 'Ошибка загрузки постов: ${response.statusCode}');
      }
    } catch (e) {
      _updateStatus(PostStatus.error, error: e.toString());
    }
  }

  void filterPosts(String query) {
    if (query.trim().isEmpty) {
      _filteredPosts = List<Post>.from(_posts);
    } else {
      final lowerQuery = query.toLowerCase();
      _filteredPosts = _posts.where((post) => post.title.toLowerCase().contains(lowerQuery)).toList();
    }
    notifyListeners();
  }

  Future<bool> sendPostFeedback({
    required String name,
    required String email,
    required String message,
  }) async {
    final url = Uri.parse('https://jsonplaceholder.typicode.com/posts');

    final body = jsonEncode({
      'name': name.trim(),
      'email': email.trim(),
      'message': message.trim(),
    });

    try {
      final response = await http.post(
        url,
        headers: {'Content-Type': 'application/json; charset=UTF-8'},
        body: body,
      );

      if (response.statusCode == 201) {
        return true;
      } else {
        _error = 'Ошибка отправки: ${response.statusCode}';
        notifyListeners();
        return false;
      }
    } catch (e) {
      _error = e.toString();
      notifyListeners();
      return false;
    }
  }
}
