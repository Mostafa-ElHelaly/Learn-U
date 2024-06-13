class LoginModel {
  int? status;
  String? statusText;
  dynamic error;
  dynamic message;
  Data? data;

  LoginModel(
      {this.status, this.statusText, this.error, this.message, this.data});

  LoginModel.fromJson(Map<String, dynamic> json) {
    status = json['status'];
    statusText = json['statusText'];
    error = json['error'];
    message = json['message'];
    data = json['data'] != null ? new Data.fromJson(json['data']) : null;
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['status'] = this.status;
    data['statusText'] = this.statusText;
    data['error'] = this.error;
    data['message'] = this.message;
    if (this.data != null) {
      data['data'] = this.data!.toJson();
    }
    return data;
  }
}

class Data {
  String? uID;
  Client? client;

  Data({this.uID, this.client});

  Data.fromJson(Map<String, dynamic> json) {
    uID = json['UID'];
    client =
    json['client'] != null ? new Client.fromJson(json['client']) : null;
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['UID'] = this.uID;
    if (this.client != null) {
      data['client'] = this.client!.toJson();
    }
    return data;
  }
}

class Client {
  int? id;
  String? name;
  String? birthdate;
  String? gender;
  String? email;
  String? telephone;
  int? banned;
  int? deleted;
  String? addstamp;
  String? updatestamp;

  Client(
      {this.id,
        this.name,
        this.birthdate,
        this.gender,
        this.email,
        this.telephone,
        this.banned,
        this.deleted,
        this.addstamp,
        this.updatestamp});

  Client.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    name = json['name'];
    birthdate = json['birthdate'];
    gender = json['gender'];
    email = json['email'];
    telephone = json['telephone'];
    banned = json['banned'];
    deleted = json['deleted'];
    addstamp = json['addstamp'];
    updatestamp = json['updatestamp'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['id'] = this.id;
    data['name'] = this.name;
    data['birthdate'] = this.birthdate;
    data['gender'] = this.gender;
    data['email'] = this.email;
    data['telephone'] = this.telephone;
    data['banned'] = this.banned;
    data['deleted'] = this.deleted;
    data['addstamp'] = this.addstamp;
    data['updatestamp'] = this.updatestamp;
    return data;
  }
}