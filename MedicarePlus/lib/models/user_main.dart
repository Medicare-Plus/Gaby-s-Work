class User_Model {
  String homeCountry;
  bool admin;

  User_Model(this.homeCountry);

  Map<String, dynamic> toJson() => {
        'homeCountry': homeCountry,
        'admin': admin,
      };
}
