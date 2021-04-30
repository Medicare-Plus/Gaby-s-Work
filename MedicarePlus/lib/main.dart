import 'package:firebase_auth/firebase_auth.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';

import 'package:flutter_application_1/pages/Views/ForgotPassView.dart';
import 'package:flutter_application_1/pages/Views/GeneralInfoView.dart';
import 'package:flutter_application_1/pages/Views/MoreView.dart';
import 'package:flutter_application_1/pages/Views/QRView.dart';
import 'package:flutter_application_1/pages/Views/SignInView.dart';
import 'package:flutter_application_1/pages/Views/SignUpView.dart';

import 'package:flutter_application_1/pages/home.dart';
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
        routes: <String, WidgetBuilder>{
          '/home': (BuildContext context) => Home(),
          SignInScreen.id: (context) => SignInScreen(),
          ForgotPassword.id: (context) => ForgotPassword(),
          '/signUp': (BuildContext context) => Register(),
          '/QRBase': (context) => QRBase(),
          '/GeneralInfo': (context) => GeneralInfo(),
          '/More': (context) => MoreBase(),
        });
  }
}

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
        onClick: () => print("Welcome"),
        loaderColor: Color(0xff61c198));
  }
}
