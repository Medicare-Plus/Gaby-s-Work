import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:image_picker/image_picker.dart';

FirebaseFirestore firestore = FirebaseFirestore.instance;

class UserModel extends StatelessWidget {
  final String id;
  final String firstName;
  final String lastName;

  final String email;
  final String userRole;

  UserModel(this.id, this.firstName, this.lastName, this.email, this.userRole);

  @override
  Widget build(BuildContext context) {
    // Create a CollectionReference called users that references the firestore collection
    CollectionReference users = FirebaseFirestore.instance.collection('users');

    Future<void> UserModel() {
      // Call the user's CollectionReference to add a new user
      return users
          .add({
            'uid': id, // John Doe
            'fistname': firstName,
            'lastname': lastName, // Stokes and Sons
            'email': email,
            'Role': userRole, // 42
          })
          .then((value) => print("User Added"))
          .catchError((error) => print("Failed to add user: $error"));
    }
  }
}

Future<void> userSetup(String firstName, String lastName) async {
  CollectionReference users = FirebaseFirestore.instance.collection('Users');
  FirebaseAuth auth = FirebaseAuth.instance;

  String email = auth.currentUser.email.toString();
  String uid = auth.currentUser.uid.toString();
  String profileImage = '';

  users.add({
    'firstName': firstName,
    'lastName': lastName,
    'email': email,
    'uid': uid,
    'profileImage': profileImage
  });
  return;
}
