import 'package:flutter/material.dart';

class Settings extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
        home: Scaffold(
      appBar: AppBar(
          title: Text('Page 7'),
          backgroundColor: Color(0xff234499),
          leading: IconButton(
              icon: Icon(Icons.arrow_back, color: Color(0xff61c198)),
              onPressed: () {
                Navigator.of(context).pushReplacementNamed('/More');
              })),
      body: SingleChildScrollView(
          //This allows to scrollz, this should be declared to larrge lists otherwise the rest of the list will not display and have errors
          child: Center(
              child: Column(
                  mainAxisSize: MainAxisSize.max,
                  crossAxisAlignment: CrossAxisAlignment
                      .center, //I actually don't know why I did this even if eveything is already centered
                  children: []))),
    ));
  }
}
