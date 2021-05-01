import 'dart:io';
import 'dart:math';

import 'package:firebase_storage/firebase_storage.dart';
import 'package:flutter/material.dart';
import 'package:flutter_application_1/Widgets/Nav.dart';
import 'package:image_picker/image_picker.dart';
import 'package:permission_handler/permission_handler.dart';

class ProfilePage extends StatefulWidget {
  @override
  _ProfilePageState createState() => _ProfilePageState();
}

class _ProfilePageState extends State<ProfilePage> {
  @override
  GlobalKey<_ProfilePageState> _myKey = GlobalKey();

  Widget build(BuildContext context) {
    Widget bottomSheet() {
      return Container(
        height: 100.0,
        width: MediaQuery.of(context).size.width,
        margin: EdgeInsets.symmetric(
          horizontal: 20,
          vertical: 20,
        ),
        child: Column(
          children: <Widget>[
            Text(
              "Choose a Profile Photo",
              style: TextStyle(
                fontSize: 20.0,
              ),
            ),
            SizedBox(
              height: 20,
            ),
            Row(
              children: <Widget>[
                FlatButton.icon(
                  icon: Icon(Icons.camera),
                  onPressed: () {},
                  label: Text("Camera"),
                ),
                FlatButton.icon(
                  icon: Icon(Icons.image),
                  onPressed: () {},
                  label: Text("Gallery"),
                ),
              ],
            )
          ],
        ),
      );
    }

    Widget imageProfile() {
      return Center(
          child: Stack(children: <Widget>[
        CircleAvatar(
          radius: 80.0,
          backgroundImage: AssetImage("assets/images/BackgroundTemp.png"),
          backgroundColor: Colors.white,
        ),
        Positioned(
            bottom: 20.0,
            right: 25.0,
            child: InkWell(
              onTap: () {
                showModalBottomSheet(
                  context: context,
                  builder: ((builder) => bottomSheet()),
                );
              },
              child: Icon(
                Icons.camera_alt,
                color: Colors.grey,
                size: 28.0,
              ),
            ))
      ]));
    }
  }
}
