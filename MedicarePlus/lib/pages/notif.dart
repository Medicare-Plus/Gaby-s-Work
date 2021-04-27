import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:flutter_application_1/Widgets/auth_service.dart';
import 'package:flutter_application_1/Widgets/provider_widget.dart';
import 'package:flutter_application_1/models/user_main.dart';
import 'package:flutter_application_1/pages/StartMenu.dart';
import 'package:intl/intl.dart';

import 'intro.dart';

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
                      MaterialPageRoute(builder: (context) => SignInScreen()),
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
                      backgroundColor:
                          MaterialStateProperty.all<Color>(Color(0xffeff2f8))),
                  label: Text(
                    "Log Out",
                    style: TextStyle(color: Color(0xff234499)),
                  ),
                  onPressed: () {
                    //logout button
                    FirebaseAuth auth = FirebaseAuth.instance;
                    auth.signOut().then((res) {
                      Navigator.pushAndRemoveUntil(
                          context,
                          MaterialPageRoute(
                              builder: (context) => SignInScreen()),
                          (Route<dynamic> route) => false);
                    });
                  },
                ),
              ),

              SizedBox(
                  height:
                      75), //this is to prove it can scroll so I basically made the page bigger so it can scrollz
            ]))));
  }
}

class ProfileView extends StatefulWidget {
  @override
  _ProfileViewState createState() => _ProfileViewState();
}

class _ProfileViewState extends State<ProfileView> {
  User1 user = User1("");
  bool _isAdmin = false;
  TextEditingController _userCountryController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      child: Container(
        width: MediaQuery.of(context).size.width,
        child: Column(
          children: <Widget>[
            FutureBuilder(
              future: Provider.of(context).auth.getCurrentUser(),
              builder: (context, snapshot) {
                if (snapshot.connectionState == ConnectionState.done) {
                  return displayUserInformation(context, snapshot);
                } else {
                  return CircularProgressIndicator();
                }
              },
            )
          ],
        ),
      ),
    );
  }

  Widget displayUserInformation(context, snapshot) {
    final authData = snapshot.data;

    return Column(
      children: <Widget>[
        Padding(
          padding: const EdgeInsets.only(top: 10.0),
          child: Provider.of(context).auth.getProfileImage(),
        ),
        Padding(
          padding: const EdgeInsets.all(8.0),
          child: Text(
            "Name: ${authData.displayName ?? 'Anonymous'}",
            style: TextStyle(fontSize: 20),
          ),
        ),
        Padding(
          padding: const EdgeInsets.all(8.0),
          child: Text(
            "Email: ${authData.email ?? 'Anonymous'}",
            style: TextStyle(fontSize: 20),
          ),
        ),
        Padding(
          padding: const EdgeInsets.all(8.0),
          child: Text(
            "Created: ${DateFormat('MM/dd/yyyy').format(authData.metadata.creationTime)}",
            style: TextStyle(fontSize: 20),
          ),
        ),
        FutureBuilder(
            future: _getProfileData(),
            builder: (context, snapshot) {
              if (snapshot.connectionState == ConnectionState.done) {
                _userCountryController.text = user.homeCountry;
                _isAdmin = user.admin ?? false;
              }
              return Container(
                child: Column(
                  children: <Widget>[
                    Padding(
                      padding: const EdgeInsets.all(8.0),
                      child: Text(
                        "Home Country: ${_userCountryController.text}",
                        style: TextStyle(fontSize: 20),
                      ),
                    ),
                    adminFeature(),
                  ],
                ),
              );
            }),
        SizedBox(height: 15),
        SizedBox(
          width: 350,
          height: 50,
          child: TextButton.icon(
            icon: Icon(Icons.logout, color: Color(0xff61c198)),
            style: ButtonStyle(
                backgroundColor:
                    MaterialStateProperty.all<Color>(Color(0xffeff2f8))),
            label: Text(
              "Log Out",
              style: TextStyle(color: Color(0xff234499)),
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
          ),
        ),
        RaisedButton(
          child: Text("Edit User"),
          onPressed: () {
            _userEditBottomSheet(context);
          },
        )
      ],
    );
  }

  _getProfileData() async {
    final uid = await Provider.of(context).auth.getCurrentUID();
    await Provider.of(context)
        .db
        .collection('userData')
        .document(uid)
        .get()
        .then((result) {
      user.homeCountry = result.data['homeCountry'];
      user.admin = result.data['admin'];
    });
  }

  Widget adminFeature() {
    if (_isAdmin == true) {
      return Text("You are an admin");
    } else {
      return Container();
    }
  }

  void _userEditBottomSheet(BuildContext context) {
    showModalBottomSheet(
      context: context,
      builder: (BuildContext bc) {
        return Container(
          height: MediaQuery.of(context).size.height * .60,
          child: Padding(
            padding: const EdgeInsets.only(left: 15.0, top: 15.0),
            child: Column(
              children: <Widget>[
                Row(
                  children: <Widget>[
                    Text("Update Profile"),
                    Spacer(),
                    IconButton(
                      icon: Icon(Icons.cancel),
                      color: Colors.orange,
                      iconSize: 25,
                      onPressed: () {
                        Navigator.of(context).pop();
                      },
                    ),
                  ],
                ),
                Row(
                  children: [
                    Expanded(
                      child: Padding(
                        padding: const EdgeInsets.only(right: 15.0),
                        child: TextField(
                          controller: _userCountryController,
                          decoration: InputDecoration(
                            helperText: "Home Country",
                          ),
                        ),
                      ),
                    )
                  ],
                ),
              ],
            ),
          ),
        );
      },
    );
  }
}
