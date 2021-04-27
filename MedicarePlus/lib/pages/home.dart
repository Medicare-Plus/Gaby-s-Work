import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import '../main.dart';
import 'StartMenu.dart';

class Home extends StatelessWidget {
  Home({this.uid});
  final String uid;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: NavBar(), // Bottom Nav Bar
    );
  }
}

class HomeBase extends StatefulWidget {
  @override
  _HomeBaseState createState() => _HomeBaseState();
}

class _HomeBaseState extends State<HomeBase> {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
        home: Scaffold(
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
            body: SingleChildScrollView(
                //the sexy body has a function that will allow the pages to slide down
                child: Center(
                    child: Column(
                        //I put the child center and then made the center have a child of column so it would be listed in the specific
                        mainAxisSize: MainAxisSize.max,
                        children: [
                  Stack(children: <Widget>[
                    //this function is used for listing down certain widgets without having to declare them as child since the children widget does that for u
                    Container(
                      //THis is the background
                      width: double.infinity, //fills up all width
                      height: 325,
                      color: Color(0xffe9eaf7),
                    ),

                    Column(children: <Widget>[
                      //this widget here is placed because it is the widget outside of stack but rather inside column for the list, we made this stack to put stuff on top of the bg
                      SizedBox(height: 30),
                      Container(
                          child: Align(
                        //positioning(This is sort  of a janky method)
                        alignment: AlignmentDirectional.bottomCenter,
                        child: Text(
                          "Welcome (name)",
                          style: TextStyle(
                              fontWeight: FontWeight.bold,
                              color: Color(0xff234499),
                              fontSize: 20),
                        ),
                      )),
                      SizedBox(
                        height: 15,
                      ), //janky spacing
                      Container(
                          height: 150,
                          decoration: BoxDecoration(
                              image: DecorationImage(
                                  image: AssetImage(
                                      "assets/images/card.png") //This is an asset frrom the assets folder, there is an option for network images but it will load faster if you use assets

                                  ))),

                      SizedBox(
                        height: 15,
                      ),
                      SizedBox(
                        width: 180,
                        height: 50,
                        child: ElevatedButton(
                            //this is a button type, flatbuttons are outdated
                            style: ButtonStyle(
                                //this is forr colorrs
                                backgroundColor:
                                    MaterialStateProperty.all<Color>(
                                        Color(0xff234499))),
                            child: Text(
                              "View Benefits",
                              style: TextStyle(
                                  color: Colors
                                      .white), //textstyle is forr colors and fonts to make it bold or italic
                            ),
                            onPressed: () {}),
                      ),
                    ])
                  ]),
                  Container(
                    margin: EdgeInsets.all(20.0),
                    child: Align(
                      //jankey positioning
                      alignment: AlignmentDirectional
                          .bottomStart, //this the entire column is centered, we had to use align so it would be on the left or start. It's just bottom so it can be low
                      child: Text(
                        "Our Services",
                        style: TextStyle(
                            fontWeight: FontWeight.bold,
                            color: Color(0xff5db9ae),
                            fontSize: 20),
                      ),
                    ),
                  ),
                  Container(
                      child: Row(
                          //low is like a list put side ways and this container is in charge of the blue buttons
                          mainAxisAlignment: MainAxisAlignment
                              .spaceEvenly, //Spaces evenly. There are times when u need to adjust the container but we don't need to since this container is a list and the size of the buttons is what matters
                          crossAxisAlignment: CrossAxisAlignment.center,
                          children: [
                        SizedBox(
                          width: 90,
                          height: 100,
                          child: TextButton(
                              onPressed:
                                  () {}, //Thee should be a navigator for these but we have left it on a blank state, when null it would be in an untouchable state
                              style: ButtonStyle(
                                  backgroundColor:
                                      MaterialStateProperty.all<Color>(
                                          Color(0xff234499))),
                              child: Center(
                                  child: Column(
                                      //I had to get creative and make it this way so that the icon will be on top and text bottom, if I did not add this, it would icon then side text
                                      children: <Widget>[
                                    Icon(Icons.people,
                                        color: Colors.white,
                                        size:
                                            60), //This is the icon and of course there is the icon type. color and size
                                    Text(
                                      "Our Partners",
                                      style: TextStyle(
                                          fontSize: 10, color: Colors.white),
                                    )
                                  ]))),
                        ),
                        SizedBox(
                          width: 90,
                          height: 100,
                          child: TextButton(
                              onPressed: () {},
                              style: ButtonStyle(
                                  backgroundColor:
                                      MaterialStateProperty.all<Color>(
                                          Color(0xff234499))),
                              child: Center(
                                  child: Column(children: <Widget>[
                                Icon(Icons.sticky_note_2_outlined,
                                    color: Colors.white, size: 60),
                                Text(
                                  "Medical Data",
                                  style: TextStyle(
                                      fontSize: 10, color: Colors.white),
                                )
                              ]))),
                        ),
                        SizedBox(
                          width: 90,
                          height: 100,
                          child: TextButton(
                              onPressed: () {},
                              style: ButtonStyle(
                                  backgroundColor:
                                      MaterialStateProperty.all<Color>(
                                          Color(0xff234499))),
                              child: Center(
                                  child: Column(children: <Widget>[
                                Icon(Icons.meeting_room,
                                    color: Colors.white, size: 60),
                                Text(
                                  "Consultaiton",
                                  style: TextStyle(
                                      fontSize: 10, color: Colors.white),
                                )
                              ]))),
                        ),
                        SizedBox(
                          width: 90,
                          height: 100,
                          child: TextButton(
                              onPressed: () {},
                              style: ButtonStyle(
                                  backgroundColor:
                                      MaterialStateProperty.all<Color>(
                                          Color(0xff234499))),
                              child: Center(
                                  child: Column(children: <Widget>[
                                Icon(Icons.calendar_today,
                                    color: Colors.white, size: 60),
                                Text(
                                  "Schedule",
                                  style: TextStyle(
                                      fontSize: 10, color: Colors.white),
                                )
                              ]))),
                        ),
                      ])),
                  Container(
                    margin: EdgeInsets.all(20.0),
                    child: Align(
                      alignment: AlignmentDirectional.bottomStart,
                      child: Text(
                        "Recent Notifications",
                        style: TextStyle(
                            fontWeight: FontWeight.bold,
                            color: Color(0xff5db9ae),
                            fontSize: 20),
                      ),
                    ),
                  ),
                  SizedBox(height: 75),
                ])))));
  }
}
