class CategoriesModel {
  int? id;
  String? slug;
  String? slugAr;
  String? name;
  String? nameAr;
  String? desc;
  String? descAr;
  String? thumbnail;
  int? sortOrder;
  String? active;
  String? deleted;
  String? addstamp;
  String? updatestamp;

  CategoriesModel({
    this.id,
    this.slug,
    this.slugAr,
    this.name,
    this.nameAr,
    this.desc,
    this.descAr,
    this.thumbnail,
    this.sortOrder,
    this.active,
    this.deleted,
    this.addstamp,
    this.updatestamp,
  });

  CategoriesModel.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    slug = json['slug'];
    slugAr = json['slug_ar'];
    name = json['name'];
    nameAr = json['name_ar'];
    desc = json['desc'];
    descAr = json['desc_ar'];
    thumbnail = json['thumbnail'];
    sortOrder = json['sort_order'];
    active = json['active'];
    deleted = json['deleted'];
    addstamp = json['addstamp'];
    updatestamp = json['updatestamp'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['id'] = this.id;
    data['slug'] = this.slug;
    data['slug_ar'] = this.slugAr;
    data['name'] = this.name;
    data['name_ar'] = this.nameAr;
    data['desc'] = this.desc;
    data['desc_ar'] = this.descAr;
    data['thumbnail'] = this.thumbnail;
    data['sort_order'] = this.sortOrder;
    data['active'] = this.active;
    data['deleted'] = this.deleted;
    data['addstamp'] = this.addstamp;
    data['updatestamp'] = this.updatestamp;
    return data;
  }
}
