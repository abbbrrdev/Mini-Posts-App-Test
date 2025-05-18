// lib/presentation/screens/main_screen.dart
import 'package:auto_route/auto_route.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

import 'main/main_screen.dart';
import 'feedback/feedback_form_screen.dart';

@RoutePage()
class NavbarScreen extends StatefulWidget {
  const NavbarScreen({super.key});

  @override
  State<NavbarScreen> createState() => _NavbarState();
}

class _NavbarState extends State<NavbarScreen> {
  int _currentIndex = 0;

  final List<Widget> _screens = [MainScreen(), FeedbackFormScreen()];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: IndexedStack(index: _currentIndex, children: _screens),
      bottomNavigationBar: BottomNavigationBar(
        backgroundColor: Colors.white,
        selectedItemColor: Colors.black,
        currentIndex: _currentIndex,
        onTap: (index) => setState(() => _currentIndex = index),
        items: const [
          BottomNavigationBarItem(
            icon: Icon(CupertinoIcons.arrow_down_circle),
            label: 'Posts',
          ),
          BottomNavigationBarItem(
            icon: Icon(CupertinoIcons.pencil),
            label: 'Feedback Form',
          ),
        ],
      ),
    );
  }
}
