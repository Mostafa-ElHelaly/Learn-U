class UserModel {
  String? first_name;
  String? email;
  String? last_name;

  UserModel({
    this.last_name,
    this.first_name,
    this.email,
  });

  // Parsing the JSON to create a CountriesModel instance
  UserModel.fromJson(Map<String, dynamic> json) {
    first_name = json['first_name'];
    email = json['email'];
    last_name = json['last_name'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['first_name'] = this.first_name;
    data['email'] = this.email;
    data['last_name'] = this.last_name;
    return data;
  }
}
