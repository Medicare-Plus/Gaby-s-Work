//This is the current more page, please link it to a value for the nav I am titled w this nav shit

import 'package:flutter/material.dart';
import 'package:flutter/rendering.dart';
import 'package:firebase_storage/firebase_storage.dart';

Future<Widget> _getImage(BuildContext context, String imageName) async {
  Image image;
  await FireStorageService.loadImage(context, imageName).then((value) {
    image = Image.network(
      value.toString(),
      fit: BoxFit.scaleDown,
    );
  });
  return image;
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
                    onPressed: () {})),
            body: SingleChildScrollView(
                child: Center(
                    child: Column(children: [
              Container(
                width: 350,
                height: 150,
                margin: EdgeInsets.all(20.0),
                child: FutureBuilder(
                  future: _getImage(context, "avatar1.png"),
                  builder: (context, snapshot) {
                    if (snapshot.connectionState == ConnectionState.done) {
                      return Container(
                        width: MediaQuery.of(context).size.width / 1.2,
                        height: MediaQuery.of(context).size.width / 1.2,
                        child: snapshot.data,
                      );
                    }

                    if (snapshot.connectionState == ConnectionState.waiting) {
                      return Container(
                        width: MediaQuery.of(context).size.width / 1.2,
                        height: MediaQuery.of(context).size.width / 1.2,
                        child: CircularProgressIndicator(),
                      );
                    }
                    return Container();
                  },
                ),
              ),
              Container(
                margin: EdgeInsets.all(20.0),
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
                    onPressed: () {}),
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
                    label: Text("Payment Method"),
                    onPressed: () {}),
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
                    onPressed: () {}),
              ),
              SizedBox(height: 75),
            ])))));
  }
}

class FireStorageService extends ChangeNotifier {
  FireStorageService();
  static Future<dynamic> loadImage(BuildContext context, String Image) async {
    return await FirebaseStorage.instance.ref().child(Image).getDownloadURL();
  }
}
