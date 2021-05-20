import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:image_picker/image_picker.dart';

final FirebaseAuth _firebaseAuth = FirebaseAuth.instance;

class AddUser extends StatelessWidget {
  final String id;
  final String firstName;
  final String lastName;
  final String email;
  final String userRole;
  final String photoURL;

  AddUser(this.id, this.firstName, this.lastName, this.email, this.userRole,
      this.photoURL);

  @override
  Widget build(BuildContext context) {
    CollectionReference users = FirebaseFirestore.instance.collection('users');

    Future<void> AddUser() {
      return users
          .add({
            'uid': id,
            'fistname': firstName,
            'lastname': lastName,
            'email': email,
            'Role': userRole,
            'photoURL': photoURL,
          })
          .then((value) => print("User Added"))
          .catchError((error) => print("Failed to add user: $error"));
    }
  }
}

Future<void> userSetup(String firstName, String lastName) async {
  CollectionReference users = FirebaseFirestore.instance.collection('users');
  FirebaseAuth auth = FirebaseAuth.instance;
  String email = auth.currentUser.email.toString();
  String uid = auth.currentUser.uid.toString();
  String photoURL = auth.currentUser.photoURL.toString();

  users.add({
    'firstName': firstName,
    'lastName': lastName,
    'email': email,
    'uid': uid,
    'photoURL': photoURL,
  });
  return;
}
