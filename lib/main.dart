import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import 'provider/post_provider.dart';
import 'internal/application.dart';
import 'router/router.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();

  final router = AppRouter();

  runApp(
    MultiProvider(
      providers: [
        ChangeNotifierProvider(create: (_) => PostProvider()..fetchPosts()),
      ],
      child: Application(router: router),
    ),
  );
}
