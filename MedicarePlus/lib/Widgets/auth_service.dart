import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_application_1/Widgets/widget.dart';
import 'package:flutter_application_1/pages/home.dart';

class AuthService {
  final FirebaseAuth _firebaseAuth = FirebaseAuth.instance;

  Stream<String> get onAuthStateChanged => _firebaseAuth.authStateChanges().map(
        (User user) => user?.uid,
      );

  // GET UID
  String getCurrentUID() {
    return _firebaseAuth.currentUser.uid;
  }

  // GET CURRENT USER
  Future getCurrentUser() async {
    return _firebaseAuth.currentUser;
  }

  getProfileImage() {
    if (_firebaseAuth.currentUser.photoURL != null) {
      return Image.network(_firebaseAuth.currentUser.photoURL,
          height: 100, width: 100);
    } else {
      return Icon(Icons.account_circle, size: 100);
    }
  }

  // Email & Password Sign Up
  Future<String> createUserWithEmailAndPassword(
      String email, String password, String name) async {
    final authResult = await _firebaseAuth.createUserWithEmailAndPassword(
      email: email,
      password: password,
    );

    // Update the username
    await updateUserName(name, authResult.user);
    return authResult.user.uid;
  }

  Future updateUserName(String name, User currentUser) async {
    await currentUser.updateProfile(displayName: name);
    await currentUser.reload();
  }

  // Email & Password Sign In
  Future<String> signInWithEmailAndPassword(
      String email, String password) async {
    return (await _firebaseAuth.signInWithEmailAndPassword(
            email: email, password: password))
        .user
        .uid;
  }

  // Sign Out
  signOut() async {
    return await _firebaseAuth.signOut();
  }

  // Reset Password
  Future sendPasswordResetEmail(String email) async {
    return _firebaseAuth.sendPasswordResetEmail(email: email);
  }
}

class NameValidator {
  static String validate(String value) {
    if (value.isEmpty) {
      return "Name can't be empty";
    }
    if (value.length < 2) {
      return "Name must be at least 2 characters long";
    }
    if (value.length > 50) {
      return "Name must be less than 50 characters long";
    }
    return null;
  }
}

class EmailValidator {
  static String validate(String value) {
    if (value.isEmpty) {
      return "Email can't be empty";
    }
    return null;
  }
}

class PasswordValidator {
  static String validate(String value) {
    if (value.isEmpty) {
      return "Password can't be empty";
    }
    return null;
  }
}

class SignInScreen extends StatefulWidget {
  static String id = 'sign-in';

  @override
  _SignInScreenState createState() => _SignInScreenState();
}

class _SignInScreenState extends State<SignInScreen> {
  final _formKey = GlobalKey<FormState>();

  final _auth = FirebaseAuth.instance;

  String _email;

  String _password;
  bool isLoading = false;

  Future signIn() async {
    _formKey.currentState.save();
    try {
      final user = await _auth.signInWithEmailAndPassword(
          email: _email, password: _password);
      if (user.user.emailVerified) {
        Navigator.of(context).pushReplacementNamed('/home');
      }
    } catch (e) {
      print(e);
    }
  }

  @override
  Widget build(BuildContext context) {
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
                            primary: Color(0xff234499),
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
                          color: Color(0xff61c198),
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
                          color: Color(0xff234499),
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
                child: TextButton(
                  style: TextButton.styleFrom(
                      primary: Color(0xff234499),
                      textStyle: TextStyle(fontSize: 20)),
                  onPressed: () {
                    Navigator.pushNamed(context, ForgotPassword.id);
                  },
                  child: Text(
                    'Forgot Password?',
                    style: TextStyle(color: Colors.teal, fontSize: 20),
                  ),
                ),
              ),
              Padding(
                padding: EdgeInsets.all(10.0),
                child: TextButton(
                  style: TextButton.styleFrom(
                      primary: Color(0xff234499),
                      textStyle: TextStyle(fontSize: 20)),
                  onPressed: () {
                    Navigator.of(context).pushReplacementNamed('/signUp');
                  },
                  child: Text(
                    'Sign Up',
                    style: TextStyle(color: Colors.teal, fontSize: 20),
                  ),
                ),
              )
            ]))));
  }
}
