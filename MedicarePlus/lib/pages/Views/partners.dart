import 'package:flutter/material.dart';

class Partners extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
        home: Scaffold(
            appBar: AppBar(
                title: Text('Partners'),
                backgroundColor: Color(0xff234499),
                leading: IconButton(
                    icon: Icon(Icons.arrow_back, color: Color(0xff61c198)),
                    onPressed: () {
                      Navigator.of(context).pushReplacementNamed('/home');
                    })),
            body: SingleChildScrollView(
                //This allows to scrollz, this should be declared to larrge lists otherwise the rest of the list will not display and have errors
                child: Center(
                    child: Column(
                        mainAxisSize: MainAxisSize.max,
                        crossAxisAlignment: CrossAxisAlignment
                            .center, //I actually don't know why I did this even if eveything is already centered
                        children: [
                  Container(
                      height: 50,
                      child: Row(
                          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                          children: [
                            SizedBox(
                              child: TextButton(
                                  //this is a button type, flatbuttons are outdated
                                  style: ButtonStyle(//this is forr colorrs
                                      ),
                                  child: Text(
                                    "Hospitals",
                                    style: TextStyle(
                                        color: Color(0xff234499),
                                        fontSize:
                                            20), //textstyle is forr colors and fonts to make it bold or italic
                                  ),
                                  onPressed: () {}),
                            ),
                            SizedBox(
                              child: TextButton(
                                  //this is a button type, flatbuttons are outdated
                                  style: ButtonStyle(//this is forr colorrs
                                      ),
                                  child: Text(
                                    "Clinics",
                                    style: TextStyle(
                                        color: Color(0xff234499),
                                        fontSize:
                                            20), //textstyle is forr colors and fonts to make it bold or italic
                                  ),
                                  onPressed: () {}),
                            ),
                          ])),
                  Container(
                      height: 50,
                      child: Row(
                          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                          children: [
                            SizedBox(
                              width: 120,
                              height: 30,
                              child: TextButton(
                                  //this is still the textbutton we know but with the added icon feature so that the button can have icons without adding a fucking CONTAINER and go sideways
                                  style: ButtonStyle(
                                      backgroundColor:
                                          MaterialStateProperty.all<Color>(
                                              Color(0xffeff2f8))),
                                  child: Text(
                                    "Most Viewed",
                                    style: TextStyle(
                                        color: Color(0xff234499), fontSize: 15),
                                  ),
                                  onPressed: () {}),
                            ),
                            SizedBox(
                              width: 120,
                              height: 30,
                              child: TextButton(
                                  //this is still the textbutton we know but with the added icon feature so that the button can have icons without adding a fucking CONTAINER and go sideways
                                  style: ButtonStyle(
                                      backgroundColor:
                                          MaterialStateProperty.all<Color>(
                                              Color(0xffeff2f8))),
                                  child: Text(
                                    "Popular",
                                    style: TextStyle(
                                        color: Color(0xff234499), fontSize: 15),
                                  ),
                                  onPressed: () {}),
                            ),
                            SizedBox(
                              width: 120,
                              height: 30,
                              child: TextButton(
                                  //this is still the textbutton we know but with the added icon feature so that the button can have icons without adding a fucking CONTAINER and go sideways
                                  style: ButtonStyle(
                                      backgroundColor:
                                          MaterialStateProperty.all<Color>(
                                              Color(0xffeff2f8))),
                                  child: Text(
                                    "New",
                                    style: TextStyle(
                                        color: Color(0xff234499), fontSize: 15),
                                  ),
                                  onPressed: () {}),
                            ),
                          ])),
                  SizedBox(height: 20),
                  Container(
                      height: 150,
                      width: 350,
                      color: Color(0xffe9eaf7),
                      child: Row(
                        children: [
                          Column(
                            children: [
                              SizedBox(height: 20),
                              Container(
                                  height: 30,
                                  child: Text("St. Lukes Medical City",
                                      style: TextStyle(
                                          color: Color(0xff234499),
                                          fontSize: 15))),
                              Container(
                                  height: 30, child: Text('Sample Address')),
                              Container(
                                  height: 30,
                                  child: Text('Circle is Sample Logo'))
                            ],
                          ),
                          SizedBox(width: 50),
                          Container(
                            width: 100,
                            height: 100,
                            margin: EdgeInsets.all(
                                20.0), //this is to make things smooth but I forget to add this function in the buttons as some buttons don't have this function
                            decoration: BoxDecoration(
                                //this is a decoration and only temporary box
                                shape: BoxShape.circle,
                                color: Colors.grey),
                          ),
                        ],
                      ))
                ])))));
  }
}
