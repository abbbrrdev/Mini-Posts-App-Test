import 'package:flutter/material.dart';

import '../router/router.dart';

class Application extends StatelessWidget {
  final AppRouter router;
  
  const Application({
    super.key,
    required this.router,
  });
    
  @override
  Widget build(BuildContext context) {
    return MaterialApp.router(
      routerConfig: router.config(),
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
        primarySwatch: Colors.blue,
        visualDensity: VisualDensity.adaptivePlatformDensity,
      ),
    );
  }
}