class CourseDetailsModel {
  Course? course;
  List<Groups>? groups;
  Test? test;

  CourseDetailsModel({this.course, this.groups, this.test});

  CourseDetailsModel.fromJson(Map<String, dynamic> json) {
    course =
        json['course'] != null ? new Course.fromJson(json['course']) : null;
    if (json['groups'] != null) {
      groups = <Groups>[];
      json['groups'].forEach((v) {
        groups!.add(new Groups.fromJson(v));
      });
    }
    test = json['test'] != null ? new Test.fromJson(json['test']) : null;
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    if (this.course != null) {
      data['course'] = this.course!.toJson();
    }

    if (this.groups != null) {
      data['groups'] = this.groups!.map((v) => v.toJson()).toList();
    }
    if (this.test != null) {
      data['test'] = this.test!.toJson();
    }
    return data;
  }
}

class Course {
  int? id;
  // int? categoryId;
  // int? trainerId;
  // String? slug;
  // String? slugAr;
  String? name;
  String? nameAr;
  // String? desc;
  // String? descAr;
  // String? image;
  // String? pricing;
  // int? courseLength;
  // String? courseLengthTime;
  // String? courseLevel;
  // String? courseNeededSkills;
  // String? courseNeededSkillsAr;
  // String? courseTargetAudience;
  // String? courseTargetAudienceAr;
  // String? disableComments;
  // String? endWithoutTest;
  // String? hideTrainersNames;
  // String? viewerGuest;
  // String? courseClose;
  // String? courseFinish;
  // String? active;
  // String? deleted;
  // String? addstamp;
  // String? updatestamp;
  // String? brief;
  // String? briefAr;
  // String? courseCurriculum;
  // String? courseCurriculumAr;
  // int? lessonsCount;
  // int? takers;

  Course({
    this.id,
    // this.categoryId,
    // this.trainerId,
    // this.slug,
    // this.slugAr,
    this.name,
    this.nameAr,
    // this.desc,
    // this.descAr,
    // this.image,
    // this.pricing,
    // this.courseLength,
    // this.courseLengthTime,
    // this.courseLevel,
    // this.courseNeededSkills,
    // this.courseNeededSkillsAr,
    // this.courseTargetAudience,
    // this.courseTargetAudienceAr,
    // this.disableComments,
    // this.endWithoutTest,
    // this.hideTrainersNames,
    // this.viewerGuest,
    // this.courseClose,
    // this.courseFinish,
    // this.active,
    // this.deleted,
    // this.addstamp,
    // this.updatestamp,
    // this.brief,
    // this.briefAr,
    // this.courseCurriculum,
    // this.courseCurriculumAr,
    // this.lessonsCount,
    // this.takers
  });

  Course.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    // categoryId = json['category_id'];
    // trainerId = json['trainer_id'];
    // slug = json['slug'];
    // slugAr = json['slug_ar'];
    name = json['name'];
    nameAr = json['name_ar'];
    // desc = json['desc'];
    // descAr = json['desc_ar'];
    // image = json['image'];
    // pricing = json['pricing'];
    // courseLength = json['course_length'];
    // courseLengthTime = json['course_length_time'];
    // courseLevel = json['course_level'];
    // courseNeededSkills = json['course_needed_skills'];
    // courseNeededSkillsAr = json['course_needed_skills_ar'];
    // courseTargetAudience = json['course_target_audience'];
    // courseTargetAudienceAr = json['course_target_audience_ar'];
    // disableComments = json['disable_comments'];
    // endWithoutTest = json['end_without_test'];
    // hideTrainersNames = json['hide_trainers_names'];
    // viewerGuest = json['viewer_guest'];
    // courseClose = json['course_close'];
    // courseFinish = json['course_finish'];
    // active = json['active'];
    // deleted = json['deleted'];
    // addstamp = json['addstamp'];
    // updatestamp = json['updatestamp'];
    // brief = json['brief'];
    // briefAr = json['brief_ar'];
    // courseCurriculum = json['course_curriculum'];
    // courseCurriculumAr = json['course_curriculum_ar'];
    // lessonsCount = json['lessons_count'];
    // takers = json['takers'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['id'] = this.id;
    // data['category_id'] = this.categoryId;
    // data['trainer_id'] = this.trainerId;
    // data['slug'] = this.slug;
    // data['slug_ar'] = this.slugAr;
    data['name'] = this.name;
    data['name_ar'] = this.nameAr;
    // data['desc'] = this.desc;
    // data['desc_ar'] = this.descAr;
    // data['image'] = this.image;
    // data['pricing'] = this.pricing;
    // data['course_length'] = this.courseLength;
    // data['course_length_time'] = this.courseLengthTime;
    // data['course_level'] = this.courseLevel;
    // data['course_needed_skills'] = this.courseNeededSkills;
    // data['course_needed_skills_ar'] = this.courseNeededSkillsAr;
    // data['course_target_audience'] = this.courseTargetAudience;
    // data['course_target_audience_ar'] = this.courseTargetAudienceAr;
    // data['disable_comments'] = this.disableComments;
    // data['end_without_test'] = this.endWithoutTest;
    // data['hide_trainers_names'] = this.hideTrainersNames;
    // data['viewer_guest'] = this.viewerGuest;
    // data['course_close'] = this.courseClose;
    // data['course_finish'] = this.courseFinish;
    // data['active'] = this.active;
    // data['deleted'] = this.deleted;
    // data['addstamp'] = this.addstamp;
    // data['updatestamp'] = this.updatestamp;
    // data['brief'] = this.brief;
    // data['brief_ar'] = this.briefAr;
    // data['course_curriculum'] = this.courseCurriculum;
    // data['course_curriculum_ar'] = this.courseCurriculumAr;
    // data['lessons_count'] = this.lessonsCount;
    // data['takers'] = this.takers;
    return data;
  }
}

class Groups {
  int? id;
  int? courseId;
  String? name;
  String? nameAr;
  String? addstamp;
  String? updatestamp;
  List<Lessons>? lessons;

  Groups(
      {this.id,
      this.courseId,
      this.name,
      this.nameAr,
      this.addstamp,
      this.updatestamp,
      this.lessons});

  Groups.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    courseId = json['course_id'];
    name = json['name'];
    nameAr = json['name_ar'];
    addstamp = json['addstamp'];
    updatestamp = json['updatestamp'];
    if (json['lessons'] != null) {
      lessons = <Lessons>[];
      json['lessons'].forEach((v) {
        lessons!.add(new Lessons.fromJson(v));
      });
    }
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['id'] = this.id;
    data['course_id'] = this.courseId;
    data['name'] = this.name;
    data['name_ar'] = this.nameAr;
    data['addstamp'] = this.addstamp;
    data['updatestamp'] = this.updatestamp;
    if (this.lessons != null) {
      data['lessons'] = this.lessons!.map((v) => v.toJson()).toList();
    }
    return data;
  }
}

class Lessons {
  int? id;
  int? groupId;
  String? name;
  String? nameAr;
  String? lessonVideo;
  String? addstamp;
  String? updatestamp;

  Lessons(
      {this.id,
      this.groupId,
      this.name,
      this.nameAr,
      this.lessonVideo,
      this.addstamp,
      this.updatestamp});

  Lessons.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    groupId = json['group_id'];
    name = json['name'];
    nameAr = json['name_ar'];
    lessonVideo = json['lesson_video'];
    addstamp = json['addstamp'];
    updatestamp = json['updatestamp'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['id'] = this.id;
    data['group_id'] = this.groupId;
    data['name'] = this.name;
    data['name_ar'] = this.nameAr;
    data['lesson_video'] = this.lessonVideo;
    data['addstamp'] = this.addstamp;
    data['updatestamp'] = this.updatestamp;
    return data;
  }
}

class Test {
  int? id;
  String? name;
  String? nameAr;
  String? desc;
  String? descAr;
  String? instantGrading;
  String? showAnswers;
  int? duration;
  String? durationTime;
  String? deleted;
  String? addstamp;
  String? updatestamp;
  List<Questions>? questions;

  Test(
      {this.id,
      this.name,
      this.nameAr,
      this.desc,
      this.descAr,
      this.instantGrading,
      this.showAnswers,
      this.duration,
      this.durationTime,
      this.deleted,
      this.addstamp,
      this.updatestamp,
      this.questions});

  Test.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    name = json['name'];
    nameAr = json['name_ar'];
    desc = json['desc'];
    descAr = json['desc_ar'];
    instantGrading = json['instant_grading'];
    showAnswers = json['show_answers'];
    duration = json['duration'];
    durationTime = json['duration_time'];
    deleted = json['deleted'];
    addstamp = json['addstamp'];
    updatestamp = json['updatestamp'];
    if (json['questions'] != null) {
      questions = <Questions>[];
      json['questions'].forEach((v) {
        questions!.add(new Questions.fromJson(v));
      });
    }
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['id'] = this.id;
    data['name'] = this.name;
    data['name_ar'] = this.nameAr;
    data['desc'] = this.desc;
    data['desc_ar'] = this.descAr;
    data['instant_grading'] = this.instantGrading;
    data['show_answers'] = this.showAnswers;
    data['duration'] = this.duration;
    data['duration_time'] = this.durationTime;
    data['deleted'] = this.deleted;
    data['addstamp'] = this.addstamp;
    data['updatestamp'] = this.updatestamp;
    if (this.questions != null) {
      data['questions'] = this.questions!.map((v) => v.toJson()).toList();
    }
    return data;
  }
}

class Questions {
  int? id;
  int? testId;
  String? type;
  String? name;
  String? nameAr;
  String? desc;
  String? descAr;
  String? clarification;
  String? clarificationAr;
  int? points;
  int? duration;
  String? durationTime;
  String? deleted;
  String? addstamp;
  String? updatestamp;

  Questions(
      {this.id,
      this.testId,
      this.type,
      this.name,
      this.nameAr,
      this.desc,
      this.descAr,
      this.clarification,
      this.clarificationAr,
      this.points,
      this.duration,
      this.durationTime,
      this.deleted,
      this.addstamp,
      this.updatestamp});

  Questions.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    testId = json['test_id'];
    type = json['type'];
    name = json['name'];
    nameAr = json['name_ar'];
    desc = json['desc'];
    descAr = json['desc_ar'];
    clarification = json['clarification'];
    clarificationAr = json['clarification_ar'];
    points = json['points'];
    duration = json['duration'];
    durationTime = json['duration_time'];
    deleted = json['deleted'];
    addstamp = json['addstamp'];
    updatestamp = json['updatestamp'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['id'] = this.id;
    data['test_id'] = this.testId;
    data['type'] = this.type;
    data['name'] = this.name;
    data['name_ar'] = this.nameAr;
    data['desc'] = this.desc;
    data['desc_ar'] = this.descAr;
    data['clarification'] = this.clarification;
    data['clarification_ar'] = this.clarificationAr;
    data['points'] = this.points;
    data['duration'] = this.duration;
    data['duration_time'] = this.durationTime;
    data['deleted'] = this.deleted;
    data['addstamp'] = this.addstamp;
    data['updatestamp'] = this.updatestamp;
    return data;
  }
}
