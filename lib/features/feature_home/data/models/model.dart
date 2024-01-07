class MyModel {
  Tag? tag;
  List<Deals>? deals;

  MyModel({this.tag, this.deals});

  MyModel.fromJson(Map<String, dynamic> json) {
    tag = json['tag'] != null ? new Tag.fromJson(json['tag']) : null;
    if (json['deals'] != null) {
      deals = <Deals>[];
      json['deals'].forEach((v) {
        deals!.add(new Deals.fromJson(v));
      });
    }
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    if (this.tag != null) {
      data['tag'] = this.tag!.toJson();
    }
    if (this.deals != null) {
      data['deals'] = this.deals!.map((v) => v.toJson()).toList();
    }
    return data;
  }
}

class Tag {
  int? id;
  String? name;
  String? slug;

  Tag({this.id, this.name, this.slug});

  Tag.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    name = json['name'];
    slug = json['slug'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['id'] = this.id;
    data['name'] = this.name;
    data['slug'] = this.slug;
    return data;
  }
}

class Deals {
  int? id;
  int? dealId;
  int? tehranOnly;
  int? childId;
  int? companyId;
  String? shortName;
  String? slug;
  String? url;
  int? originalPrice;
  int? discountedPrice;
  int? discountPercentage;
  int? dealUserCount;
  String? startDate;
  String? endDate;
  bool? isActive;
  int? maxLimit;
  int? minLimit;
  bool? mark;
  List<Specifications>? specifications;
  List<Null>? team;
  Attachment? attachment;

  Deals(
      {this.id,
      this.dealId,
      this.tehranOnly,
      this.childId,
      this.companyId,
      this.shortName,
      this.slug,
      this.url,
      this.originalPrice,
      this.discountedPrice,
      this.discountPercentage,
      this.dealUserCount,
      this.startDate,
      this.endDate,
      this.isActive,
      this.maxLimit,
      this.minLimit,
      this.mark,
      this.specifications,
      this.team,
      this.attachment});

  Deals.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    dealId = json['deal_id'];
    tehranOnly = json['tehran_only'];
    childId = json['childId'];
    companyId = json['company_id'];
    shortName = json['short_name'];
    slug = json['slug'];
    url = json['url'];
    originalPrice = json['original_price'];
    discountedPrice = json['discounted_price'];
    discountPercentage = json['discount_percentage'];
    dealUserCount = json['deal_user_count'];
    startDate = json['start_date'];
    endDate = json['end_date'];
    isActive = json['is_active'];
    maxLimit = json['max_limit'];
    minLimit = json['min_limit'];
    mark = json['mark'];
    if (json['specifications'] != null) {
      specifications = <Specifications>[];
      json['specifications'].forEach((v) {
        specifications!.add(new Specifications.fromJson(v));
      });
    }
    if (json['team'] != null) {
      team = <Null>[];
      json['team'].forEach((v) {});
    }
    attachment = json['attachment'] != null
        ? new Attachment.fromJson(json['attachment'])
        : null;
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['id'] = this.id;
    data['deal_id'] = this.dealId;
    data['tehran_only'] = this.tehranOnly;
    data['childId'] = this.childId;
    data['company_id'] = this.companyId;
    data['short_name'] = this.shortName;
    data['slug'] = this.slug;
    data['url'] = this.url;
    data['original_price'] = this.originalPrice;
    data['discounted_price'] = this.discountedPrice;
    data['discount_percentage'] = this.discountPercentage;
    data['deal_user_count'] = this.dealUserCount;
    data['start_date'] = this.startDate;
    data['end_date'] = this.endDate;
    data['is_active'] = this.isActive;
    data['max_limit'] = this.maxLimit;
    data['min_limit'] = this.minLimit;
    data['mark'] = this.mark;
    if (this.specifications != null) {
      data['specifications'] =
          this.specifications!.map((v) => v.toJson()).toList();
    }
    if (this.team != null) {}
    if (this.attachment != null) {
      data['attachment'] = this.attachment!.toJson();
    }
    return data;
  }
}

class Specifications {
  String? title;
  List<ChildSpecifications>? childSpecifications;

  Specifications({this.title, this.childSpecifications});

  Specifications.fromJson(Map<String, dynamic> json) {
    title = json['title'];
    if (json['childSpecifications'] != null) {
      childSpecifications = <ChildSpecifications>[];
      json['childSpecifications'].forEach((v) {
        childSpecifications!.add(new ChildSpecifications.fromJson(v));
      });
    }
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['title'] = this.title;
    if (this.childSpecifications != null) {
      data['childSpecifications'] =
          this.childSpecifications!.map((v) => v.toJson()).toList();
    }
    return data;
  }
}

class ChildSpecifications {
  String? title;
  String? value;

  ChildSpecifications({this.title, this.value});

  ChildSpecifications.fromJson(Map<String, dynamic> json) {
    title = json['title'];
    value = json['value'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['title'] = this.title;
    data['value'] = this.value;
    return data;
  }
}

class Attachment {
  String? url;

  Attachment({this.url});

  Attachment.fromJson(Map<String, dynamic> json) {
    url = json['url'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['url'] = this.url;
    return data;
  }
}
