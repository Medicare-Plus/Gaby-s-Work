import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_application_1/pages/Views/SignInView.dart';

import 'package:splashscreen/splashscreen.dart';

import '../home.dart';

class IntroScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    User result = FirebaseAuth.instance.currentUser;
    return new SplashScreen(
        navigateAfterSeconds:
            result != null ? Home(uid: result.uid) : SignInScreen(),
        seconds: 5,
        image: Image.asset('assets/images/title.png', fit: BoxFit.scaleDown),
        backgroundColor: Colors.white,
        styleTextUnderTheLoader: new TextStyle(),
        photoSize: 100.0,
        onClick: () => print("MedicarePlus"),
        loaderColor: Color(0xff61c198));
  }
}
