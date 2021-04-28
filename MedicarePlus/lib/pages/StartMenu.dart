import 'package:flutter/material.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter_application_1/Widgets/provider_widget.dart';
import 'package:flutter_application_1/Widgets/widget.dart';

import 'home.dart';

/* class EmailLogIn extends StatefulWidget {
  @override
  _EmailLogInState createState() => _EmailLogInState();
}

class _EmailLogInState extends State<EmailLogIn> {
  final _formKey = GlobalKey<FormState>();
  TextEditingController emailController = TextEditingController();
  TextEditingController passwordController = TextEditingController();

  bool isLoading = false;

  @override
  Widget build(BuildContext context) {
    const MediTeal = const Color(0xff61c198);
    const MediBlue = const Color(0xff234499);

    return Scaffold(
        body: Form(
            key: _formKey,
            child: SingleChildScrollView(
                child: Column(children: <Widget>[
              SizedBox(height: 75),
              Container(
                  height: 250,
                  width: 300,
                  decoration: BoxDecoration(
                      image: DecorationImage(
                          image: AssetImage("assets/images/title.png")))),
              Padding(
                padding: EdgeInsets.all(10.0),
                child: isLoading
                    ? CircularProgressIndicator()
                    : TextButton(
                        style: TextButton.styleFrom(
                            primary: MediBlue,
                            textStyle: TextStyle(fontSize: 33)),
                        onPressed: () {
                          if (_formKey.currentState.validate()) {
                            setState(() {
                              isLoading = true;
                            });
                            Navigator.of(context).pushReplacementNamed('/home');
                          }
                        },
                        child: Text('Sign In'),
                      ),
              ),
              Padding(
                padding: EdgeInsets.all(15.0),
                child: TextFormField(
                 onSaved: (newEmail) {
                      _email = newEmail;
                    },
                  decoration: InputDecoration(
                    labelText: "Email Address",
                    enabledBorder: OutlineInputBorder(
                      borderSide: BorderSide(
                          color: MediTeal,
                          width: 3.0), // making the border color
                      borderRadius: BorderRadius.circular(10.0),
                    ),
                  ),
                  // The validator receives the text that the user has entered.
                  validator: (value) {
                    if (value.isEmpty) {
                      return 'Email Address';
                    } else if (!value.contains('@')) {
                      return 'Please enter a valid email address!';
                    }
                    return null;
                  },
                ),
              ),
              Padding(
                padding: EdgeInsets.all(15.0),
                child: TextFormField(
                  onSaved: (newPass) {
                      _password = newPass;
                    },
                  obscureText: true,
                  decoration: InputDecoration(
                    labelText: "Password",
                    enabledBorder: OutlineInputBorder(
                      borderSide: BorderSide(
                          color: MediTeal,
                          width: 3.0), // making the border color
                      borderRadius: BorderRadius.circular(10.0),
                    ),
                  ),
                  // The validator receives the text that the user has entered.
                  validator: (value) {
                    if (value.isEmpty) {
                      return 'Password';
                    } else if (value.length < 6) {
                      return 'Password must be atleast 6 characters!';
                    }
                    return null;
                  },
                ),
              ),
              Padding(
                padding: EdgeInsets.all(10.0),
                child: isLoading
                    ? CircularProgressIndicator()
                    : TextButton(
                        style: TextButton.styleFrom(
                            primary: MediTeal,
                            textStyle: TextStyle(fontSize: 20)),
                        onPressed: () {
                          Navigator.pushNamed(context, ForgotPassword.id);
                        },
                        child: Text(
                          'Forgot Password?',
                          style: TextStyle(color: Colors.teal, fontSize: 20),
                        ),
                      ),
              )
            ]))));
  }

  void logIn() {
    FirebaseAuth.instance
        .signInWithEmailAndPassword(
            email: emailController.text, password: passwordController.text)
        .then((result) {
      isLoading = false;
      Navigator.pushReplacement(
        context,
        MaterialPageRoute(builder: (context) => Home(uid: result.user.uid)),
      );
    }).catchError((err) {
      print(err.message);
      showDialog(
          context: context,
          builder: (BuildContext context) {
            return AlertDialog(
              title: Text("Error"),
              content: Text(err.message),
              actions: [
                ElevatedButton(
                  child: Text("Ok"),
                  onPressed: () {
                    Navigator.of(context).pop();
                  },
                )
              ],
            );
          });
    });
  }
}

*/