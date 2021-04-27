import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:splashscreen/splashscreen.dart';
import 'StartMenu.dart';
import 'home.dart';

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
        onClick: () => print("MedicarePlus"),
        loaderColor: Color(0xff61c198));
  }
}
