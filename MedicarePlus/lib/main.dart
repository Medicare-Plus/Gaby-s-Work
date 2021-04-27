import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:flutter_application_1/Widgets/Nav.dart';
import 'package:flutter_application_1/Widgets/auth_service.dart';
import 'package:flutter_application_1/Widgets/provider_widget.dart';
import 'package:flutter_application_1/Widgets/widget.dart';

import 'package:flutter_application_1/pages/StartMenu.dart';
import 'package:flutter_application_1/pages/home.dart';
import 'package:flutter_application_1/pages/intro.dart';

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
          '/home': (BuildContext context) => HomeBase(),
          '/signUp': (BuildContext context) =>
              SignUpView(authFormType: AuthFormType.signUp),
          SignInScreen.id: (context) => SignInScreen(),
          ForgotPassword.id: (context) => ForgotPassword(),
          ConfirmEmail.id: (context) => ConfirmEmail(),
        });
  }
}
