import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter_application_1/pages/More.dart';

FirebaseFirestore firestore = FirebaseFirestore.instance;

class AddUser extends StatelessWidget {
  final String id;
  final String firstName;
  final String lastName;
  final String email;
  final String userRole;

  AddUser(this.id, this.firstName, this.lastName, this.email, this.userRole);

  @override
  Widget build(BuildContext context) {
    // Create a CollectionReference called users that references the firestore collection
    CollectionReference users = FirebaseFirestore.instance.collection('users');

    Future<void> addUser() {
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

    return TextButton(
      onPressed: addUser,
      child: Text(
        "Add User",
      ),
    );
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

class GetUserName extends StatelessWidget {
  final String documentId;

  GetUserName(this.documentId);

  @override
  Widget build(BuildContext context) {
    CollectionReference users = FirebaseFirestore.instance.collection('users');

    return FutureBuilder<DocumentSnapshot>(
      future: users.doc(documentId).get(),
      builder:
          (BuildContext context, AsyncSnapshot<DocumentSnapshot> snapshot) {
        if (snapshot.hasError) {
          return Text("Something went wrong");
        }

        if (snapshot.hasData && !snapshot.data.exists) {
          return Text("Document does not exist");
        }

        if (snapshot.connectionState == ConnectionState.done) {
          Map<String, dynamic> data = snapshot.data.data();
          return Text("Full Name: ${data['full_name']} ${data['last_name']}");
        }

        return Text("loading");
      },
    );
  }
}
