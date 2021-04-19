import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:flutter_application_1/Widgets/Widget.dart';
import 'package:flutter_application_1/pages/plan.dart';
import '../main.dart';
import "More.dart";
import 'StartMenu.dart';
import 'Notification.dart';

class Home extends StatelessWidget {
  Home({this.uid});
  final String uid;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: NavBar(), // Bottom Nav Bar
      appBar: AppBar(
        title: Text('Home'),
        backgroundColor: Color(0xff234499),
        actions: <Widget>[
          IconButton(
            //logout button
            icon: Icon(
              Icons.exit_to_app, //logout button
              color: Colors.white,
            ),
            onPressed: () {
              //logout button
              FirebaseAuth auth = FirebaseAuth.instance;
              auth.signOut().then((res) {
                Navigator.pushAndRemoveUntil(
                    context,
                    MaterialPageRoute(builder: (context) => EmailLogIn()),
                    (Route<dynamic> route) => false);
              });
            },
          )
        ],
      ),
    );
  }
}
