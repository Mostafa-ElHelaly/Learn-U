class LoginModel {
  int? id;
  String? countryId;
  String? firstName;
  String? middleName;
  String? lastName;
  String? birthdate;
  String? education;
  String? email;
  String? token;

  String? mobile;
  String? password;
  String? passwordToken;
  String? banned;
  String? deleted;
  String? delstamp;
  String? addstamp;
  String? updatestamp;

  DateTime? expiresOn;
  DateTime? refreshTokenExpiration;


  LoginModel(
      {this.id,
        this.countryId,
        this.firstName,
        this.middleName,
        this.lastName,
        this.birthdate,
        this.education,
        this.email,
        this.mobile,
        this.password,
        this.passwordToken,
        this.banned,
        this.deleted,
        this.token,
        this.delstamp,
        this.expiresOn,
        this.refreshTokenExpiration,
        this.addstamp,
        this.updatestamp});

  LoginModel.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    countryId = json['country_id'];
    firstName = json['first_name'];
    middleName = json['middle_name'];
    lastName = json['last_name'];
    birthdate = json['birthdate'];
    education = json['education'];
    email = json['email'];
    token = json['token'];
    mobile = json['mobile'];
    password = json['password'];
    passwordToken = json['password_token'];
    banned = json['banned'];
    deleted = json['deleted'];
    delstamp = json['delstamp'];
    addstamp = json['addstamp'];
    updatestamp = json['updatestamp'];
    expiresOn = json['expiresOn'];
    refreshTokenExpiration = json['refreshTokenExpiration'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['id'] = this.id;
    data['country_id'] = this.countryId;
    data['first_name'] = this.firstName;
    data['middle_name'] = this.middleName;
    data['last_name'] = this.lastName;
    data['birthdate'] = this.birthdate;
    data['education'] = this.education;
    data['email'] = this.email;
    data['token'] = this.token;
    data['mobile'] = this.mobile;
    data['password'] = this.password;
    data['password_token'] = this.passwordToken;
    data['banned'] = this.banned;
    data['deleted'] = this.deleted;
    data['delstamp'] = this.delstamp;
    data['addstamp'] = this.addstamp;
    data['updatestamp'] = this.updatestamp;
    data['expiresOn'] = this.expiresOn;
    data['refreshTokenExpiration'] = this.refreshTokenExpiration;
    return data;
  }
}