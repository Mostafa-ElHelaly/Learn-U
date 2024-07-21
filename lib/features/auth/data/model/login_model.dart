class RegisterModel {
  String? country_id;
  String? first_name;
  String? middle_name;
  String? last_name;
  String? birthdate;
  String? education;
  String? email;
  String? password;
  String? mobile;
  String? token;

  RegisterModel(
      {this.country_id,
      this.first_name,
      this.middle_name,
      this.last_name,
      this.birthdate,
      this.education,
      this.email,
      this.password,
      this.mobile,
      this.token});

  RegisterModel.fromJson(Map<String, dynamic> json) {
    country_id = json['country_id'];
    first_name = json['first_name'];
    middle_name = json['middle_name'];
    last_name = json['last_name'];
    birthdate = json['birthdate'];
    education = json['education'];
    email = json['email'];
    password = json['password'];
    mobile = json['mobile'];
    token = json['token'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['country_id'] = this.country_id;
    data['first_name'] = this.first_name;
    data['middle_name'] = this.middle_name;
    data['last_name'] = this.last_name;
    data['birthdate'] = this.birthdate;
    data['education'] = this.education;
    data['email'] = this.email;
    data['password'] = this.password;
    data['mobile'] = this.mobile;
    data['token'] = this.token;
    return data;
  }
}
