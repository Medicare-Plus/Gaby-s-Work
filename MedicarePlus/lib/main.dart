import 'package:firebase_auth/firebase_auth.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:flutter_application_1/Widgets/auth_service.dart';
import 'package:flutter_application_1/Widgets/widget.dart';
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
        home: SignInScreen(),
        routes: <String, WidgetBuilder>{
          '/home': (BuildContext context) => Home(),
          SignInScreen.id: (context) => SignInScreen(),
          ForgotPassword.id: (context) => ForgotPassword(),
          ConfirmEmail.id: (context) => ConfirmEmail(),
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
        onClick: () => print("flutter"),
        loaderColor: Color(0xff61c198));
  }
}
