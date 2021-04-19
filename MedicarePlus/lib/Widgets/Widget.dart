import 'package:flutter/material.dart';

class BottomNav extends StatefulWidget {
  @override
  _BottomNavState createState() => _BottomNavState();
}

class _BottomNavState extends State<BottomNav> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        bottomNavigationBar: BottomNavigationBar(
      // Bottom Navigation Bar
      currentIndex: 0, // this will be set when a new tab is tapped
      items: [
        BottomNavigationBarItem(
          icon: new Icon(Icons.home),
          label: 'Home',
        ),
        BottomNavigationBarItem(
          icon: new Icon(Icons.mail),
          label: 'Messages',
        ),
        BottomNavigationBarItem(icon: Icon(Icons.person), label: 'Profile')
      ],
    ));
  }
}
