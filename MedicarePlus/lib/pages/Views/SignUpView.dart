import 'package:firebase_auth/firebase_auth.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:flutter_application_1/pages/Views/SignInView.dart';

import 'package:flutter_application_1/services/firestore_service.dart';

class Register extends StatefulWidget {
  @override
  _RegisterViewState createState() => _RegisterViewState();
}

class _RegisterViewState extends State<Register> {
  final _formKey = GlobalKey<FormState>();
  TextEditingController _firstNameController = TextEditingController();
  TextEditingController _lastNameController = TextEditingController();
  TextEditingController _contactNumberController = TextEditingController();
  TextEditingController _emailController = TextEditingController();
  TextEditingController _passwordController = TextEditingController();
  TextEditingController _repasswordController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    body:
    SingleChildScrollView();
    final mq = MediaQuery.of(context);

    final Header = Padding(
        padding: EdgeInsets.only(top: 10.0),
        child: Text(
          'Sign Up',
          textAlign: TextAlign.center,
          overflow: TextOverflow.ellipsis,
          style: TextStyle(fontSize: 33, color: Color(0xff234499)),
        ));

    final firstNameField = Padding(
        padding: EdgeInsets.all(10.0),
        child: TextFormField(
          controller: _firstNameController,
          style: TextStyle(
            color: Colors.black,
          ),
          cursorColor: Colors.grey,
          decoration: InputDecoration(
            labelText: "First Name",
            enabledBorder: OutlineInputBorder(
              borderSide: BorderSide(
                  color: Color(0xff61c198),
                  width: 3.0), // making the border color

              borderRadius: BorderRadius.circular(10.0),
            ),
          ),
        ));
    final lastNameField = Padding(
        padding: EdgeInsets.all(10.0),
        child: TextFormField(
          controller: _lastNameController,
          style: TextStyle(
            color: Colors.black,
          ),
          cursorColor: Colors.grey,
          decoration: InputDecoration(
            labelText: "Last Name",
            enabledBorder: OutlineInputBorder(
              borderSide: BorderSide(
                  color: Color(0xff61c198),
                  width: 3.0), // making the border color

              borderRadius: BorderRadius.circular(10.0),
            ),
          ),
        ));

    final emailField = Padding(
        padding: EdgeInsets.all(10.0),
        child: TextFormField(
          controller: _emailController,
          keyboardType: TextInputType.emailAddress,
          style: TextStyle(
            color: Colors.black,
          ),
          cursorColor: Colors.black,
          decoration: InputDecoration(
            labelText: "Email Address",
            hintText: "email@address.com",
            enabledBorder: OutlineInputBorder(
              borderSide: BorderSide(
                  color: Color(0xff61c198),
                  width: 3.0), // making the border color

              borderRadius: BorderRadius.circular(10.0),
            ),
          ),
        ));

    final passwordField = Padding(
        padding: EdgeInsets.all(10.0),
        child: TextFormField(
          obscureText: true,
          controller: _passwordController,
          style: TextStyle(
            color: Colors.black,
          ),
          cursorColor: Colors.black,
          decoration: InputDecoration(
            labelText: "Password",
            enabledBorder: OutlineInputBorder(
              borderSide: BorderSide(
                  color: Color(0xff61c198),
                  width: 3.0), // making the border color

              borderRadius: BorderRadius.circular(10.0),
            ),
          ),
        ));

    final repasswordField = Padding(
        padding: EdgeInsets.all(10.0),
        child: TextFormField(
          obscureText: true,
          controller: _repasswordController,
          style: TextStyle(
            color: Colors.black,
          ),
          cursorColor: Colors.black,
          decoration: InputDecoration(
            labelText: "Re Enter Password",
            enabledBorder: OutlineInputBorder(
              borderSide: BorderSide(
                  color: Color(0xff61c198),
                  width: 3.0), // making the border color

              borderRadius: BorderRadius.circular(10.0),
            ),
          ),
        ));

    final fields = Padding(
      padding: EdgeInsets.only(top: 10.0),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.start,
        children: <Widget>[
          firstNameField,
          lastNameField,
          emailField,
          passwordField,
          repasswordField,
        ],
      ),
    );

    final bottom = Column(
      mainAxisAlignment: MainAxisAlignment.start,
      crossAxisAlignment: CrossAxisAlignment.stretch,
      children: <Widget>[
        Padding(
          padding: EdgeInsets.only(top: 0.0),
        ),
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: <Widget>[
            TextButton(
              style: TextButton.styleFrom(
                  primary: Color(0xff61c198),
                  textStyle: TextStyle(fontSize: 20)),
              onPressed: () {
                Navigator.of(context).pushReplacementNamed(SignInScreen.id);
              },
              child: Text('Go Back'),
            ),
            MaterialButton(
              //Next Button
              onPressed: () async {
                try {
                  await Firebase.initializeApp();
                  UserCredential user = await FirebaseAuth.instance
                      .createUserWithEmailAndPassword(
                    email: _emailController.text,
                    password: _passwordController.text,
                  );
                  User updateUser = FirebaseAuth.instance.currentUser;
                  updateUser.updateProfile(
                      displayName: _firstNameController.text);
                  userSetup(
                      _firstNameController.text, _lastNameController.text);
                  Navigator.of(context).pushNamed('/home');
                } on FirebaseAuthException catch (e) {
                  if (e.code == 'weak-password') {
                    print('The password provided is too weak.');
                  } else if (e.code == 'email-already-in-use') {
                    print('The account already exists for that email.');
                  }
                } catch (e) {
                  print(e.toString());
                }
              },
              child: Text(
                "Next",
                style: Theme.of(context)
                    .textTheme
                    .subtitle1
                    .copyWith(color: Color(0xff234499), fontSize: 20),
              ),
            ),
          ],
        ),
      ],
    );

    return Scaffold(
      backgroundColor: Colors.white,
      body: Form(
        key: _formKey,
        child: SingleChildScrollView(
          padding: EdgeInsets.all(40),
          child: Container(
            height: mq.size.height,
            child: Column(
              mainAxisAlignment: MainAxisAlignment.spaceAround,
              children: <Widget>[
                Header,
                fields,
                Padding(
                  padding: EdgeInsets.only(bottom: 70, top: 0),
                  child: bottom,
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
