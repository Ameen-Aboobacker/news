class BlogCategories {
  bool? status;
  List<BlogsCategory>? blogsCategory;

  BlogCategories({this.status, this.blogsCategory});

 BlogCategories .fromJson(Map<String, dynamic> json) {
    status = json['status'];
    if (json['blogs_category'] != null) {
      blogsCategory = <BlogsCategory>[];
      json['blogs_category'].forEach((v) {
        blogsCategory!.add(BlogsCategory.fromJson(v));
      });
    }
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data =  <String, dynamic>{};
    data['status'] = status;
    if (blogsCategory != null) {
      data['blogs_category'] =
          blogsCategory!.map((v) => v.toJson()).toList();
    }
    return data;
  }
}

class BlogsCategory {
  int? id;
  String? name;

  BlogsCategory({this.id, this.name});

  BlogsCategory.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    name = json['name'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['id'] = this.id;
    data['name'] = this.name;
    return data;
  }
}
