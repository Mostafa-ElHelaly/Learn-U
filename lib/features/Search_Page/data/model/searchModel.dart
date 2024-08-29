class SearchModel {
  int? id;
  int? categoryId;
  int? trainerId;
  // int? certificateId;
  // int? testId;
  // int? questionId;
  // String? slug;
  // String? slugAr;
  String? name;
  String? nameAr;
  String? desc;
  String? descar;
  String? image;
  // String? publishDate;
  // String? pricing;
  // int? paidCurrency;
  // int? paidPrice;
  // int? paidDiscount;
  // int? paidDiscountStartDate;
  // int? paidDiscountEndDate;
  int? courseLength;
  String? courseLengthTime;
  String? courseLevel;
  // String? courseNeededSkills;
  // String? courseNeededSkillsAr;
  // String? courseTargetAudience;
  // String? courseTargetAudienceAr;
  // String? disableComments;
  // String? endWithoutTest;
  // String? hideTrainersNames;
  // String? viewerGuest;
  // String? courseClose;
  // int? courseJoinLimit;
  // int? courseRetakeLimit;
  // String? courseFinish;
  // String? courseValidateMethod;
  // int? passingPercentage;
  // String? active;
  // String? deleted;
  // int? delstamp;
  // String? addstamp;
  // String? updatestamp;
  String? brief;
  String? briefAr;
  // String? courseCurriculum;
  // String? courseCurriculumAr;
  // int? tags;
  // int? preCourseId;
  int? lessonsCount;
  // int? reviews;
  // int? review;
  // int? reviewsSum;
  // int? takers;

  SearchModel({
    this.id,
    this.categoryId,
    this.trainerId,
    // this.certificateId,
    // this.testId,
    // this.questionId,
    // this.slug,
    // this.slugAr,
    this.name,
    this.nameAr,
    this.desc,
    this.descar,
    this.image,
    // this.publishDate,
    // this.pricing,
    // this.paidCurrency,
    // this.paidPrice,
    // this.paidDiscount,
    // this.paidDiscountStartDate,
    // this.paidDiscountEndDate,
    this.courseLength,
    this.courseLengthTime,
    this.courseLevel,
    // this.courseNeededSkills,
    // this.courseNeededSkillsAr,
    // this.courseTargetAudience,
    // this.courseTargetAudienceAr,
    // this.disableComments,
    // this.endWithoutTest,
    // this.hideTrainersNames,
    // this.viewerGuest,
    // this.courseClose,
    // this.courseJoinLimit,
    // this.courseRetakeLimit,
    // this.courseFinish,
    // this.courseValidateMethod,
    // this.passingPercentage,
    // this.active,
    // this.deleted,
    // this.delstamp,
    // this.addstamp,
    // this.updatestamp,
    this.brief,
    this.briefAr,
    // this.courseCurriculum,
    // this.courseCurriculumAr,
    // this.tags,
    // this.preCourseId,
    this.lessonsCount,
    // this.reviews,
    // this.review,
    // this.reviewsSum,
    // this.takers
  });

  SearchModel.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    categoryId = json['category_id'];
    trainerId = json['trainer_id'];
    // certificateId = json['certificate_id'];
    // testId = json['test_id'];
    // questionId = json['question_id'];
    // slug = json['slug'];
    // slugAr = json['slug_ar'];
    name = json['name'];
    nameAr = json['name_ar'];
    desc = json['desc'];
    descar = json['desc_ar'];
    image = json['image'];
    // publishDate = json['publish_date'];
    // pricing = json['pricing'];
    // paidCurrency = json['paid_currency'];
    // paidPrice = json['paid_price'];
    // paidDiscount = json['paid_discount'];
    // paidDiscountStartDate = json['paid_discount_start_date'];
    // paidDiscountEndDate = json['paid_discount_end_date'];
    courseLength = json['course_length'];
    courseLengthTime = json['course_length_time'];
    courseLevel = json['course_level'];
    // courseNeededSkills = json['course_needed_skills'];
    // courseNeededSkillsAr = json['course_needed_skills_ar'];
    // courseTargetAudience = json['course_target_audience'];
    // courseTargetAudienceAr = json['course_target_audience_ar'];
    // disableComments = json['disable_comments'];
    // endWithoutTest = json['end_without_test'];
    // hideTrainersNames = json['hide_trainers_names'];
    // viewerGuest = json['viewer_guest'];
    // courseClose = json['course_close'];
    // courseJoinLimit = json['course_join_limit'];
    // courseRetakeLimit = json['course_retake_limit'];
    // courseFinish = json['course_finish'];
    // courseValidateMethod = json['course_validate_method'];
    // passingPercentage = json['passing_percentage'];
    // active = json['active'];
    // deleted = json['deleted'];
    // delstamp = json['delstamp'];
    // addstamp = json['addstamp'];
    // updatestamp = json['updatestamp'];
    brief = json['brief'];
    briefAr = json['brief_ar'];
    // courseCurriculum = json['course_curriculum'];
    // courseCurriculumAr = json['course_curriculum_ar'];
    // tags = json['tags'];
    // preCourseId = json['pre_course_id'];
    lessonsCount = json['lessons_count'];
    // reviews = json['reviews'];
    // review = json['review'];
    // reviewsSum = json['reviews_sum'];
    // takers = json['takers'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['id'] = this.id;
    data['category_id'] = this.categoryId;
    data['trainer_id'] = this.trainerId;
    // data['certificate_id'] = this.certificateId;
    // data['test_id'] = this.testId;
    // data['question_id'] = this.questionId;
    // data['slug'] = this.slug;
    // data['slug_ar'] = this.slugAr;
    data['name'] = this.name;
    data['name_ar'] = this.nameAr;
    data['desc'] = this.desc;
    data['desc_ar'] = this.descar;
    data['image'] = this.image;
    // data['publish_date'] = this.publishDate;
    // data['pricing'] = this.pricing;
    // data['paid_currency'] = this.paidCurrency;
    // data['paid_price'] = this.paidPrice;
    // data['paid_discount'] = this.paidDiscount;
    // data['paid_discount_start_date'] = this.paidDiscountStartDate;
    // data['paid_discount_end_date'] = this.paidDiscountEndDate;
    data['course_length'] = this.courseLength;
    data['course_length_time'] = this.courseLengthTime;
    data['course_level'] = this.courseLevel;
    // data['course_needed_skills'] = this.courseNeededSkills;
    // data['course_needed_skills_ar'] = this.courseNeededSkillsAr;
    // data['course_target_audience'] = this.courseTargetAudience;
    // data['course_target_audience_ar'] = this.courseTargetAudienceAr;
    // data['disable_comments'] = this.disableComments;
    // data['end_without_test'] = this.endWithoutTest;
    // data['hide_trainers_names'] = this.hideTrainersNames;
    // data['viewer_guest'] = this.viewerGuest;
    // data['course_close'] = this.courseClose;
    // data['course_join_limit'] = this.courseJoinLimit;
    // data['course_retake_limit'] = this.courseRetakeLimit;
    // data['course_finish'] = this.courseFinish;
    // data['course_validate_method'] = this.courseValidateMethod;
    // data['passing_percentage'] = this.passingPercentage;
    // data['active'] = this.active;
    // data['deleted'] = this.deleted;
    // data['delstamp'] = this.delstamp;
    // data['addstamp'] = this.addstamp;
    // data['updatestamp'] = this.updatestamp;
    data['brief'] = this.brief;
    data['brief_ar'] = this.briefAr;
    // data['course_curriculum'] = this.courseCurriculum;
    // data['course_curriculum_ar'] = this.courseCurriculumAr;
    // data['tags'] = this.tags;
    // data['pre_course_id'] = this.preCourseId;
    data['lessons_count'] = this.lessonsCount;
    // data['reviews'] = this.reviews;
    // data['review'] = this.review;
    // data['reviews_sum'] = this.reviewsSum;
    // data['takers'] = this.takers;
    return data;
  }
}
