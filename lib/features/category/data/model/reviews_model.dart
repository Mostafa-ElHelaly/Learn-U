class ReviewsModel {
  int? courseId;
  int? clientId;
  int? review;
  String? message;
  String? addstamp;
  String? updatestamp;
  String? firstName;
  String? lastName;

  ReviewsModel(
      {this.courseId,
      this.clientId,
      this.review,
      this.message,
      this.addstamp,
      this.updatestamp,
      this.firstName,
      this.lastName});

  ReviewsModel.fromJson(Map<String, dynamic> json) {
    courseId = json['course_id'];
    clientId = json['client_id'];
    review = json['review'];
    message = json['message'];
    addstamp = json['addstamp'];
    updatestamp = json['updatestamp'];
    firstName = json['first_name'];
    lastName = json['last_name'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['course_id'] = this.courseId;
    data['client_id'] = this.clientId;
    data['review'] = this.review;
    data['message'] = this.message;
    data['addstamp'] = this.addstamp;
    data['updatestamp'] = this.updatestamp;
    data['first_name'] = this.firstName;
    data['last_name'] = this.lastName;
    return data;
  }
}
