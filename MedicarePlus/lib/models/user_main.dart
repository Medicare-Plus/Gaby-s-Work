import 'package:firebase_auth/firebase_auth.dart';

class User1 {
  String homeCountry;
  bool admin;

  User1(this.homeCountry);

  Map<String, dynamic> toJson() => {
        'homeCountry': homeCountry,
        'admin': admin,
      };
}
