class TrainersModel {
  int? id;
  String? name;
  String? nameAr;
  String? about;
  String? aboutAr;
  String? email;
  String? mobile;
  String? thumbnail;
  String? introVideo;
  String? password;
  String? passwordToken;
  String? chat;
  String? banned;
  String? active;
  String? deleted;
  String? addstamp;
  String? updatestamp;
  String? socialLinkedin;
  String? socialFacebook;
  String? position;
  String? positionAr;
  String? slug;
  String? slugAr;

  TrainersModel(
      {this.id,
      this.name,
      this.nameAr,
      this.about,
      this.aboutAr,
      this.email,
      this.mobile,
      this.thumbnail,
      this.introVideo,
      this.password,
      this.passwordToken,
      this.chat,
      this.banned,
      this.active,
      this.deleted,
      this.addstamp,
      this.updatestamp,
      this.socialLinkedin,
      this.socialFacebook,
      this.position,
      this.positionAr,
      this.slug,
      this.slugAr});

  TrainersModel.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    name = json['name'];
    nameAr = json['name_ar'];
    about = json['about'];
    aboutAr = json['about_ar'];
    email = json['email'];
    mobile = json['mobile'];
    thumbnail = json['thumbnail'];
    introVideo = json['intro_video'];
    password = json['password'];
    passwordToken = json['password_token'];
    chat = json['chat'];
    banned = json['banned'];
    active = json['active'];
    deleted = json['deleted'];
    addstamp = json['addstamp'];
    updatestamp = json['updatestamp'];
    socialLinkedin = json['social_linkedin'];
    socialFacebook = json['social_facebook'];
    position = json['position'];
    positionAr = json['position_ar'];
    slug = json['slug'];
    slugAr = json['slug_ar'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['id'] = this.id;
    data['name'] = this.name;
    data['name_ar'] = this.nameAr;
    data['about'] = this.about;
    data['about_ar'] = this.aboutAr;
    data['email'] = this.email;
    data['mobile'] = this.mobile;
    data['thumbnail'] = this.thumbnail;
    data['intro_video'] = this.introVideo;
    data['password'] = this.password;
    data['password_token'] = this.passwordToken;
    data['chat'] = this.chat;
    data['banned'] = this.banned;
    data['active'] = this.active;
    data['deleted'] = this.deleted;
    data['addstamp'] = this.addstamp;
    data['updatestamp'] = this.updatestamp;
    data['social_linkedin'] = this.socialLinkedin;
    data['social_facebook'] = this.socialFacebook;
    data['position'] = this.position;
    data['position_ar'] = this.positionAr;
    data['slug'] = this.slug;
    data['slug_ar'] = this.slugAr;
    return data;
  }
}
