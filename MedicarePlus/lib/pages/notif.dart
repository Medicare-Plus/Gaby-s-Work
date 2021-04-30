import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';

import 'package:flutter_application_1/Widgets/provider_widget.dart';
import 'package:flutter_application_1/models/user_main.dart';
import 'package:intl/intl.dart';

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
