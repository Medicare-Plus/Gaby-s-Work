import 'package:firebase_auth/firebase_auth.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:flutter_application_1/pages/More.dart';
import 'package:flutter_application_1/pages/Notification.dart';
import 'package:flutter_application_1/pages/home.dart';
import 'package:flutter_application_1/pages/StartMenu.dart';
import 'package:flutter_application_1/pages/plan.dart';
import 'package:flutter_icons/flutter_icons.dart';
import 'package:splashscreen/splashscreen.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp();
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Medicare Plus',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: IntroScreen(),
    );
  }
}

class IntroScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    User result = FirebaseAuth.instance.currentUser;
    return new SplashScreen(
        navigateAfterSeconds:
            result != null ? Home(uid: result.uid) : EmailLogIn(),
        seconds: 5,
        image: Image.asset('assets/images/title.png', fit: BoxFit.scaleDown),
        backgroundColor: Colors.white,
        styleTextUnderTheLoader: new TextStyle(),
        photoSize: 100.0,
        onClick: () => print("flutter"),
        loaderColor: Color(0xff61c198));
  }
}

class NavBar extends StatefulWidget {
  // Nav Bar bby
  @override
  _NavBarState createState() => _NavBarState();
}

class _NavBarState extends State<NavBar> {
  // Nav Bar bby
  int _selectedIndex = 0;
  static const TextStyle optionStyle =
      TextStyle(fontSize: 30, fontWeight: FontWeight.bold);
  static List<Widget> _widgetOptions = <Widget>[
    HomeBase(),
    PlanBase(),
    Text(
      'Notifications',
      style: optionStyle,
    ),
    MoreBase(),
  ];

  void _onItemTapped(int index) {
    setState(() {
      _selectedIndex = index;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: _widgetOptions.elementAt(_selectedIndex),
      ),
      bottomNavigationBar: BottomNavigationBar(
        items: const <BottomNavigationBarItem>[
          BottomNavigationBarItem(
            icon: Icon(Icons.home),
            label: 'Home',
            backgroundColor: Colors.red,
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.credit_card),
            label: 'Plans',
            backgroundColor: Colors.green,
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.notifications_outlined),
            label: 'Notification',
            backgroundColor: Colors.purple,
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.more_horiz),
            label: 'More',
            backgroundColor: Colors.pink,
          ),
        ],
        type: BottomNavigationBarType.fixed,
        currentIndex: _selectedIndex,
        unselectedItemColor: Colors.white,
        selectedItemColor: Colors.tealAccent,
        backgroundColor: Colors.blue[900],
        iconSize: 32,
        onTap: _onItemTapped,
      ),
    );
  }
}

class HomeBase extends StatelessWidget {
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

class PlanBase extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: Text('Plan'),
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
            child: Center(
          child: Column(
            mainAxisSize: MainAxisSize.max,
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              Stack(
                children: <Widget>[
                  Container(
                    width: double.infinity,
                    height: 250,
                  ),
                  Column(
                    children: <Widget>[
                      Container(
                          height: 50,
                          child: Align(
                              //positioning(This is sort  of a janky method)
                              alignment: AlignmentDirectional.bottomCenter,
                              child: Text(
                                "Current Balance(WIP):",
                                style: TextStyle(
                                    fontWeight: FontWeight.bold,
                                    color: Color(0xff234499),
                                    fontSize: 20),
                              ))),
                      Stack(children: <Widget>[
                        Container(
                          width: 400,
                          height: 200,

                          margin: EdgeInsets.all(
                              20.0), //this is to make things smooth but I forget to add this function in the buttons as some buttons don't have this function
                          decoration: BoxDecoration(
                            //this is a decoration and only temporary box
                            shape: BoxShape.circle,
                            border: Border.all(
                                width: 5.0, color: Color(0xff61c198)),
                            color: Colors.white,
                          ),
                        ),
                        Container(
                            height: 150,
                            child: Align(
                                //positioning(This is sort  of a janky method)
                                alignment: AlignmentDirectional.bottomCenter,
                                child: Text(
                                  "69%",
                                  style: TextStyle(
                                      color: Color(0xff234499), fontSize: 50),
                                ))),
                        Container(
                            height: 180,
                            child: Align(
                                //positioning(This is sort  of a janky method)
                                alignment: AlignmentDirectional.bottomCenter,
                                child: Text(
                                  "1,000 Php",
                                  style: TextStyle(
                                      color: Color(0xff234499), fontSize: 20),
                                ))),
                      ]),
                    ],
                  )
                ],
              ),
              Container(
                margin: EdgeInsets.all(20.0),
                child: Align(
                  //jankey positioning
                  alignment: AlignmentDirectional
                      .bottomStart, //this the entire column is centered, we had to use align so it would be on the left or start. It's just bottom so it can be low
                  child: Text(
                    "Recent Transactions:",
                    style: TextStyle(
                        fontWeight: FontWeight.bold,
                        color: Color(0xff5db9ae),
                        fontSize: 20),
                  ),
                ),
              ),
              Container(width: double.infinity, height: 3, color: Colors.grey),
              Row(children: <Widget>[
                Container(
                  margin: EdgeInsets.all(20.0),
                  child: Align(
                    //jankey positioning
                    alignment: AlignmentDirectional
                        .bottomStart, //this the entire column is centered, we had to use align so it would be on the left or start. It's just bottom so it can be low
                    child: Text(
                      "Recent Transactions:",
                      style: TextStyle(
                          fontWeight: FontWeight.bold,
                          color: Color(0xff5db9ae),
                          fontSize: 20),
                    ),
                  ),
                ),
                SizedBox(width: 60),
                SizedBox(
                  child: Align(
                    //jankey positioning
                    alignment: AlignmentDirectional.bottomEnd,
                    child: TextButton(
                        //this is a button type, flatbuttons are outdated
                        style: ButtonStyle(//this is forr colorrs
                            ),
                        child: Text(
                          "See All",
                          style: TextStyle(
                              decoration: TextDecoration.underline,
                              color: Colors
                                  .black), //textstyle is forr colors and fonts to make it bold or italic
                        ),
                        onPressed: () {}),
                  ),
                )
              ])
            ], //childen
          ),
        )));
  }
}

class MoreBase extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: Text('More'),
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
            //This allows to scrollz, this should be declared to larrge lists otherwise the rest of the list will not display and have errors
            child: Center(
                child: Column(
                    mainAxisSize: MainAxisSize.max,
                    crossAxisAlignment: CrossAxisAlignment
                        .center, //I actually don't know why I did this even if eveything is already centered
                    children: [
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
                child: TextButton.icon(
                    //this is still the textbutton we know but with the added icon feature so that the button can have icons without adding a fucking CONTAINER and go sideways
                    icon: Icon(Icons.person, color: Color(0xff61c198)),
                    style: ButtonStyle(
                        backgroundColor: MaterialStateProperty.all<Color>(
                            Color(0xffeff2f8))),
                    label: Text(
                      "General Information",
                      style: TextStyle(color: Color(0xff234499)),
                    ),
                    onPressed: () {}),
              ),

              SizedBox(height: 15),
              SizedBox(
                width: 350,
                height: 50,
                child: TextButton.icon(
                    icon: Icon(Icons.credit_card, color: Color(0xff61c198)),
                    style: ButtonStyle(
                        backgroundColor: MaterialStateProperty.all<Color>(
                            Color(0xffeff2f8))),
                    label: Text(
                      "Paymet Method",
                      style: TextStyle(color: Color(0xff234499)),
                    ),
                    onPressed: () {}),
              ),

              SizedBox(height: 15),
              SizedBox(
                width: 350,
                height: 50,
                child: TextButton.icon(
                    icon: Icon(Icons.qr_code, color: Color(0xff61c198)),
                    style: ButtonStyle(
                        backgroundColor: MaterialStateProperty.all<Color>(
                            Color(0xffeff2f8))),
                    label: Text(
                      "QR Code",
                      style: TextStyle(color: Color(0xff234499)),
                    ),
                    onPressed: () {}),
              ),

              SizedBox(height: 15),
              SizedBox(
                width: 350,
                height: 50,
                child: TextButton.icon(
                    icon: Icon(Icons.settings, color: Color(0xff61c198)),
                    style: ButtonStyle(
                        backgroundColor: MaterialStateProperty.all<Color>(
                            Color(0xffeff2f8))),
                    label: Text(
                      "Settings",
                      style: TextStyle(color: Color(0xff234499)),
                    ),
                    onPressed: () {}),
              ),

              SizedBox(height: 15),
              SizedBox(
                width: 350,
                height: 50,
                child: TextButton.icon(
                    icon: Icon(Icons.help_center, color: Color(0xff61c198)),
                    style: ButtonStyle(
                        backgroundColor: MaterialStateProperty.all<Color>(
                            Color(0xffeff2f8))),
                    label: Text(
                      "Help Center",
                      style: TextStyle(color: Color(0xff234499)),
                    ),
                    onPressed: () {}),
              ),

              SizedBox(height: 15),
              SizedBox(
                width: 350,
                height: 50,
                child: TextButton.icon(
                    icon: Icon(Icons.logout, color: Color(0xff61c198)),
                    style: ButtonStyle(
                        backgroundColor: MaterialStateProperty.all<Color>(
                            Color(0xffeff2f8))),
                    label: Text(
                      "Log Out",
                      style: TextStyle(color: Color(0xff234499)),
                    ),
                    onPressed: () {}),
              ),

              SizedBox(
                  height:
                      75), //this is to prove it can scroll so I basically made the page bigger so it can scrollz
            ]))));
  }
}
