class UserModel {
  String? first_name;
  String? email;

  UserModel({
    this.first_name,
    this.email,
  });

  // Parsing the JSON to create a CountriesModel instance
  UserModel.fromJson(Map<String, dynamic> json) {
    first_name = json['first_name'];
    email = json['email'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['first_name'] = this.first_name;
    data['email'] = this.email;
    return data;
  }
}
