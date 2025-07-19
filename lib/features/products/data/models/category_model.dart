
import 'package:hive/hive.dart';

@HiveType(typeId: 6) 
class Category {
  @HiveField(0)
  String? id;

  @HiveField(1)
  String? name;

  @HiveField(2)
  String? slug;

  @HiveField(3)
  String? image;

  Category({this.id, this.name, this.slug, this.image});

  factory Category.fromJson(Map<String, dynamic> json) => Category(
        id: json["_id"],
        name: json["name"],
        slug: json["slug"],
        image: json["image"],
      );

  Map<String, dynamic> toJson() => {
        "_id": id,
        "name": name,
        "slug": slug,
        "image": image,
      };
}


