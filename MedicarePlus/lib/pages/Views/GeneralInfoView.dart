import 'package:flutter/material.dart';

class GeneralInfo extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
        home: Scaffold(
            appBar: //the magic appbar can be applied to a Scaffold
                AppBar(
              title: Text('General Kenobi'),
              actions: [
                IconButton(
                    icon: Icon(Icons.search, color: Colors.white),
                    onPressed: () {}),
              ],
              leading: IconButton(
                  icon: Icon(Icons.arrow_back, color: Color(0xff61c198)),
                  onPressed: () {
                    Navigator.of(context).pushReplacementNamed('/More');
                  }),
              backgroundColor: Color(0xff234499),
            ),
            body: SingleChildScrollView(
                child: Center(
                    child: Column(children: <Widget>[
              Container(
                width: 350,
                height: 150,
                margin: EdgeInsets.all(
                    20.0), //this is to make things smooth but I forget to add this function in the buttons as some buttons don't have this function
                decoration: BoxDecoration(
                    //this is a decoration and only temporary box
                    shape: BoxShape.circle,
                    color: Colors.grey),
              ),
              Row(children: <Widget>[
                Container(
                  width: 30,
                ),
                Container(
                  margin: EdgeInsets.all(10.0),
                  child: Text(
                    "First Name",
                    style: TextStyle(
                        fontWeight: FontWeight.bold,
                        color: Color(0xff234499),
                        fontSize: 20),
                  ),
                ),
                Spacer(
                  flex: 1,
                ),
                Container(
                    margin: EdgeInsets.all(10.0),
                    child: Text(
                      "Sample First Name",
                      style: TextStyle(
                          fontWeight: FontWeight.bold,
                          color: Colors.black,
                          fontSize: 20), //set firrst name string here
                    )),
              ]),
              SizedBox(
                height: 15,
              ),
              Container(width: double.infinity, height: 3, color: Colors.grey),
              SizedBox(
                height: 15,
              ),
              Row(children: <Widget>[
                Container(
                  width: 30,
                ),
                Container(
                  margin: EdgeInsets.all(10.0),
                  child: Text(
                    "Last Name",
                    style: TextStyle(
                        fontWeight: FontWeight.bold,
                        color: Color(0xff234499),
                        fontSize: 20),
                  ),
                ),
                Spacer(
                  flex: 1,
                ),
                Container(
                    margin: EdgeInsets.all(10.0),
                    child: Text(
                      "Sample Last Name",
                      style: TextStyle(
                          fontWeight: FontWeight.bold,
                          color: Colors.black,
                          fontSize: 20),
                    )),
              ]),
              SizedBox(
                height: 15,
              ),
              Container(width: double.infinity, height: 3, color: Colors.grey),
              SizedBox(
                height: 15,
              ),
              Row(children: <Widget>[
                Container(
                  width: 30,
                ),
                Container(
                  margin: EdgeInsets.all(10.0),
                  child: Text(
                    "Email:",
                    style: TextStyle(
                        fontWeight: FontWeight.bold,
                        color: Color(0xff234499),
                        fontSize: 20),
                  ),
                ),
                Spacer(
                  flex: 1,
                ),
                Container(
                    margin: EdgeInsets.all(10.0),
                    child: Text(
                      "Sample Email",
                      style: TextStyle(
                          fontWeight: FontWeight.bold,
                          color: Colors.black,
                          fontSize: 20),
                    )),
              ]),
              SizedBox(
                height: 15,
              ),
              Container(width: double.infinity, height: 3, color: Colors.grey),
              SizedBox(
                height: 15,
              ),
              Row(children: <Widget>[
                Container(
                  width: 30,
                ),
                Container(
                  margin: EdgeInsets.all(10.0),
                  child: Text(
                    "Plan",
                    style: TextStyle(
                        fontWeight: FontWeight.bold,
                        color: Color(0xff234499),
                        fontSize: 20),
                  ),
                ),
                Spacer(
                  flex: 1,
                ),
                Container(
                    margin: EdgeInsets.all(10.0),
                    child: Text(
                      "Sample Plan",
                      style: TextStyle(
                          fontWeight: FontWeight.bold,
                          color: Colors.black,
                          fontSize: 20),
                    )),
              ]),
              SizedBox(
                height: 15,
              ),
              Container(width: double.infinity, height: 3, color: Colors.grey)
            ])))));
  }
}
