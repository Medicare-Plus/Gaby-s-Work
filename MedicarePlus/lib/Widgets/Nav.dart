import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

import 'package:flutter_application_1/pages/home.dart';
import 'package:flutter_application_1/pages/more.dart';
import 'package:flutter_application_1/pages/plan.dart';

class NavBar extends StatefulWidget {
  @override
  _NavBarState createState() => _NavBarState();
}

class _NavBarState extends State<NavBar> {
  int _currentIndex = 0;
  @override
  Widget build(BuildContext context) {
    final List<Widget> _children = [
      HomeBase(),
      PlanBase(),
      MoreBase(),
      ProfileView(),
    ];

    return Scaffold(
      body: _children[_currentIndex],
      bottomNavigationBar: BottomNavigationBar(
        onTap: onTabTapped,
        currentIndex: _currentIndex,
        items: [
          BottomNavigationBarItem(
            icon: new Icon(Icons.home),
            label: ("Home"),
          ),
          BottomNavigationBarItem(
            icon: new Icon(Icons.attach_money),
            label: ("Plan"),
          ),
          BottomNavigationBarItem(
            icon: new Icon(Icons.notification_important_outlined),
            label: ("Notification"),
          ),
          BottomNavigationBarItem(
            icon: new Icon(Icons.account_circle),
            label:("Profile"),
          ),
        ],
        type: BottomNavigationBarType.fixed,
        unselectedItemColor: Colors.white,
        selectedItemColor: Colors.tealAccent,
        backgroundColor: Colors.blue[900],
        iconSize: 32,
      ),
    );
  }

  void onTabTapped(int index) {
    setState(() {
      _currentIndex = index;
    });
  }
}
