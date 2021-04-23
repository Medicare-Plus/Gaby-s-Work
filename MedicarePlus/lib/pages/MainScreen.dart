import 'package:flutter/material.dart';
import 'package:flutter_application_1/pages/Notification.dart';
import 'package:flutter_application_1/pages/plan.dart';
import 'package:flutter_icons/flutter_icons.dart';
import 'home.dart';

class MainScreen extends StatefulWidget {
  @override
  _MainScreenState createState() => _MainScreenState();
}

class _MainScreenState extends State<MainScreen> {
  int _selectedIndex = 0;

  List<Widget> _widgetOptions = <Widget>[
    Home(),
    Plan(),
    Notif(),
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      bottomNavigationBar: BottomNavigationBar(
        currentIndex: _selectedIndex,
        showSelectedLabels: false,
        showUnselectedLabels: false,
        items: [
          BottomNavigationBarItem(
            icon: Icon(
              Feather.home,
              color: Color(0xFF42A5F5),
            ),
            title: Text('HOME'),
            activeIcon: Icon(
              Feather.home,
              color: Color(0xFF42A5F5),
            ),
          ),
          BottomNavigationBarItem(
            icon: Icon(
              FontAwesome.calendar,
              color: Color(0xFF42A5F5),
            ),
            title: Text('CALENDAR'),
            activeIcon: Icon(
              FontAwesome.calendar,
              color: Color(0xFF42A5F5),
            ),
          ),
          BottomNavigationBarItem(
            icon: Icon(
              EvilIcons.user,
              color: Color(0xFF42A5F5),
              size: 36,
            ),
            title: Text('PROFILE'),
            activeIcon: Icon(
              EvilIcons.user,
              color: Color(0xFF42A5F5),
              size: 36,
            ),
          ),
        ],
        onTap: (index) {
          setState(() {
            _selectedIndex = index;
          });
        },
      ),
      body: _widgetOptions.elementAt(_selectedIndex),
    );
  }
}
