import 'package:flutter/material.dart';
import 'package:flutter_application_1/pages/home.dart';

import '../main.dart';

class Plan extends StatefulWidget {
  @override
  _PlanState createState() => _PlanState();
}

class _PlanState extends State<Plan> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(('Plan')),
      ),
    );
  }
}
