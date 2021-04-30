import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_application_1/pages/Views/SignInView.dart';

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
                      MaterialPageRoute(builder: (context) => SignInScreen()),
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
