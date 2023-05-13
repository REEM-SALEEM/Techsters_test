class Record {
  final String? id;
  final String? category;
  final String? isGallery;

  Record({
    this.id,
    this.category,
    this.isGallery,
  });

  factory Record.fromJson(Map<String, dynamic> json) => Record(
        id: json["id"],
        category: json["category"],
        isGallery: json["is_gallery"],
      );

  Map<String, dynamic> toJson() => {
        "id": id,
        "category": category,
        "is_gallery": isGallery,
      };
}

class RecordTwo {
  final String? id;
  final String? title;
  final String? image;
  final String? categoryId;
  final String? description;
  final String? active;

  RecordTwo({
    this.id,
    this.title,
    this.image,
    this.categoryId,
    this.description,
    this.active,
  });

  factory RecordTwo.fromJson(Map<String, dynamic> json) => RecordTwo(
        id: json["id"],
        title: json["title"],
        image: json["image"],
        categoryId: json["category_id"],
        description: json["description"],
        active: json["active"],
      );

  Map<String, dynamic> toJson() => {
        "id": id,
        "title": title,
        "image": image,
        "category_id": categoryId,
        "description": description,
        "active": active,
      };
}
