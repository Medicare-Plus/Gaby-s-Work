//This is the current more page, please link it to a value for the nav I am titled w this nav shit

import 'dart:io';
import 'package:flutter_application_1/pages/Views/SignInView.dart';
import 'package:intl/intl.dart';
import 'package:firebase_database/firebase_database.dart';
import 'package:flutter/material.dart';
import 'package:flutter/rendering.dart';
import 'package:firebase_storage/firebase_storage.dart';
import 'package:image_picker/image_picker.dart';

import 'package:flutter_application_1/models/User.dart';

final fb = FirebaseDatabase.instance.reference().child("Users");
FirebaseStorage storage = FirebaseStorage.instance;
User user = User("");
File image;
String url;
Future<void> getImage() async {
  await ImagePicker.pickImage(source: ImageSource.gallery).then((img) {
    image = img;
  });
}

class MoreBase extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
        home: Scaffold(
            appBar: AppBar(
                title: Text('More'),
                backgroundColor: Color(0xff234499),
                leading: IconButton(
                    icon: Icon(Icons.arrow_back, color: Color(0xff61c198)),
                    onPressed: () {
                      Navigator.of(context).pushReplacementNamed('/home');
                    })),
            body: SingleChildScrollView(
                child: Center(
                    child: Column(children: [
              Container(
                  width: 350,
                  height: 150,
                  margin: EdgeInsets.all(20.0),
                  child: Text("Noice")),
              Container(
                margin: EdgeInsets.all(0.0),
                child: Align(
                  alignment: AlignmentDirectional.bottomCenter,
                  child: Text(
                    "Profile Pic",
                    style: TextStyle(
                        fontWeight: FontWeight.bold,
                        color: Color(0xff234499),
                        fontSize: 20),
                  ),
                ),
              ),
              SizedBox(height: 15),
              SizedBox(
                width: 350,
                height: 50,
                child: FlatButton.icon(
                    icon: Icon(Icons.person, color: Color(0xff61c198)),
                    color: Color(0xffeff2f8),
                    textColor: Color(0xff234499),
                    highlightColor: Colors.grey,
                    label: Text("General Information"),
                    onPressed: () {
                      Navigator.of(context)
                          .pushReplacementNamed('/GeneralInfo');
                    }),
              ),
              SizedBox(height: 15),
              SizedBox(
                width: 350,
                height: 50,
                child: FlatButton.icon(
                    icon: Icon(Icons.credit_card, color: Color(0xff61c198)),
                    color: Color(0xffeff2f8),
                    textColor: Color(0xff234499),
                    highlightColor: Colors.grey,
                    label: Text("Payment Method"),
                    onPressed: () {}),
              ),
              SizedBox(height: 15),
              SizedBox(
                width: 350,
                height: 50,
                child: FlatButton.icon(
                    icon: Icon(Icons.qr_code, color: Color(0xff61c198)),
                    color: Color(0xffeff2f8),
                    textColor: Color(0xff234499),
                    highlightColor: Colors.grey,
                    label: Text("QR Code"),
                    onPressed: () {
                      Navigator.of(context).pushReplacementNamed('/QRBase');
                    }),
              ),
              SizedBox(height: 15),
              SizedBox(
                width: 350,
                height: 50,
                child: FlatButton.icon(
                    icon: Icon(Icons.settings, color: Color(0xff61c198)),
                    color: Color(0xffeff2f8),
                    textColor: Color(0xff234499),
                    highlightColor: Colors.grey,
                    label: Text("Settings"),
                    onPressed: () {}),
              ),
              SizedBox(height: 15),
              SizedBox(
                width: 350,
                height: 50,
                child: FlatButton.icon(
                    icon: Icon(Icons.help_center, color: Color(0xff61c198)),
                    color: Color(0xffeff2f8),
                    textColor: Color(0xff234499),
                    highlightColor: Colors.grey,
                    label: Text("Help Center"),
                    onPressed: () {}),
              ),
              SizedBox(height: 15),
              SizedBox(
                width: 350,
                height: 50,
                child: FlatButton.icon(
                    icon: Icon(Icons.logout, color: Color(0xff61c198)),
                    color: Color(0xffeff2f8),
                    textColor: Color(0xff234499),
                    highlightColor: Colors.grey,
                    label: Text("Log out"),
                    onPressed: () {
                      Navigator.of(context)
                          .pushReplacementNamed(SignInScreen.id);
                    }),
              ),
              SizedBox(height: 75),
            ])))));
  }
}
