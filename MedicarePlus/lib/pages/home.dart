import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:flutter_application_1/Widgets/Nav.dart';

class Home extends StatelessWidget {
  Home({this.uid});
  final String uid;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: NavBar(),
    );
  }
}
