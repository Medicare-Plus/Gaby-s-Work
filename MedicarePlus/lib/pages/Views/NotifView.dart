import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';

class Notif extends StatefulWidget {
  @override
  _NotifState createState() => _NotifState();
}

class _NotifState extends State<Notif> {
  @override
  Widget build(BuildContext context) {
    return Container(
        child: Text(
      "Welcome (name)",
    ));
  }
}
