class LoginModel {
  // int? id;
  String? countryid;
  String? firstname;
  String? middlename;
  String? lastname;
  String? birthdate;
  String? education;
  String? email;
  String? mobile;
  String? password;
  // String? passwordToken;
  // String? banned;
  // String? deleted;
  // // String? delstamp;
  // String? addstamp;
  // String? updatestamp;

  LoginModel(
      {
        // this.id,
        this.countryid,
        this.firstname,
        this.middlename,
        this.lastname,
        this.birthdate,
        this.education,
        this.email,
        this.mobile,
        this.password,
        // this.passwordToken,
        // this.banned,
        // this.deleted,
        // // this.delstamp,
        // this.addstamp,
        // this.updatestamp
      });

  LoginModel.fromJson(Map<String, dynamic> json) {
    // id = json['id'];
    countryid = json['country_id'];
    firstname = json['first_name'];
    middlename = json['middle_name'];
    lastname = json['last_name'];
    birthdate = json['birthdate'];
    education = json['education'];
    email = json['email'];
    mobile = json['mobile'];
    password = json['password'];
    // passwordToken = json['password_token'];
    // banned = json['banned'];
    // deleted = json['deleted'];
    // // delstamp = json['delstamp'];
    // addstamp = json['addstamp'];
    // updatestamp = json['updatestamp'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    // data['id'] = this.id;
    data['country_id'] = this.countryid;
    data['first_name'] = this.firstname;
    data['middle_name'] = this.middlename;
    data['last_name'] = this.lastname;
    data['birthdate'] = this.birthdate;
    data['education'] = this.education;
    data['email'] = this.email;
    data['mobile'] = this.mobile;
    data['password'] = this.password;
    // data['password_token'] = this.passwordToken;
    // data['banned'] = this.banned;
    // data['deleted'] = this.deleted;
    // // data['delstamp'] = this.delstamp;
    // data['addstamp'] = this.addstamp;
    // data['updatestamp'] = this.updatestamp;
    return data;
  }
}