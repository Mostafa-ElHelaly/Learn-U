class UserModel {
  String? first_name;
  String? email;

  UserModel({
    this.first_name,
    this.email,
  });

  // Parsing the JSON to create a CountriesModel instance
  factory UserModel.fromJson(Map<String, dynamic> json) {
    return UserModel(
      first_name: json['first_name'] as String?,
      email: json['email'] as String?,
    );
  }
}
