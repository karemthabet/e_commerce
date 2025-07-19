
import 'package:hive/hive.dart';

part 'sub_category_model.g.dart';

@HiveType(typeId: 5)
class Subcategory  extends HiveObject{
  @HiveField(0)
  String? id;

  @HiveField(1)
  String? name;

  @HiveField(2)
  String? slug;

  @HiveField(3)
  String? category;

  Subcategory({this.id, this.name, this.slug, this.category});

  Subcategory.fromJson(Map<String, dynamic> json) {
    id = json["_id"];
    name = json["name"];
    slug = json["slug"];
    category = json["category"];
  }

  Map<String, dynamic> toJson() => {
        "_id": id,
        "name": name,
        "slug": slug,
        "category": category,
      };
}



