class BlogList {
  int? count;
  List<Results>? results;

  BlogList({this.count, this.results});

  BlogList.fromJson(Map<String, dynamic> json) {
    count = json['count'];
    if (json['results'] != null) {
      results = <Results>[];
      json['results'].forEach((v) {
        results!.add(Results.fromJson(v));
      });
    }
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['count'] = count;
    if (results != null) {
      data['results'] = results!.map((v) => v.toJson()).toList();
    }
    return data;
  }
}

class Results {
  int? id;
  String? createdAt;
  String? image;
  String? title;
  String? content;
  int? category;

  Results(
      {this.id,
      this.createdAt,
      this.image,
      this.title,
      this.content,
      this.category});

  Results.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    createdAt = json['created_at'];
    image = json['image'];
    title = json['title'];
    content = json['content'];
    category = json['category'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['id'] = this.id;
    data['created_at'] = this.createdAt;
    data['image'] = this.image;
    data['title'] = this.title;
    data['content'] = this.content;
    data['category'] = this.category;
    return data;
  }
}
