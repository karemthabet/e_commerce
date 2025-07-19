import 'package:hive/hive.dart';

part 'categories_or_brand_model.g.dart';

@HiveType(typeId: 10) 
class AllCategoriesOrBrands {
  @HiveField(0)
  int? results;

  @HiveField(1)
  Metadata? metadata;

  @HiveField(2)
  List<CategoryDataOrBrands>? data;

  AllCategoriesOrBrands({this.results, this.metadata, this.data});

  factory AllCategoriesOrBrands.fromJson(Map<String, dynamic> json) => AllCategoriesOrBrands(
        results: json["results"],
        metadata: json["metadata"] == null ? null : Metadata.fromJson(json["metadata"]),
        data: json["data"] == null
            ? null
            : (json["data"] as List).map((e) => CategoryDataOrBrands.fromJson(e)).toList(),
      );

  Map<String, dynamic> toJson() => {
        "results": results,
        "metadata": metadata?.toJson(),
        "data": data?.map((e) => e.toJson()).toList(),
      };
}

@HiveType(typeId: 11)
class CategoryDataOrBrands extends HiveObject {
  @HiveField(0)
  String? id;

  @HiveField(1)
  String? name;

  @HiveField(2)
  String? slug;

  @HiveField(3)
  String? image;

  @HiveField(4)
  String? createdAt;

  @HiveField(5)
  String? updatedAt;

  CategoryDataOrBrands({
    this.id,
    this.name,
    this.slug,
    this.image,
    this.createdAt,
    this.updatedAt,
  });

  factory CategoryDataOrBrands.fromJson(Map<String, dynamic> json) => CategoryDataOrBrands(
        id: json["_id"],
        name: json["name"],
        slug: json["slug"],
        image: json["image"],
        createdAt: json["createdAt"],
        updatedAt: json["updatedAt"],
      );

  Map<String, dynamic> toJson() => {
        "_id": id,
        "name": name,
        "slug": slug,
        "image": image,
        "createdAt": createdAt,
        "updatedAt": updatedAt,
      };
}

@HiveType(typeId: 12)
class Metadata {
  @HiveField(0)
  int? currentPage;

  @HiveField(1)
  int? numberOfPages;

  @HiveField(2)
  int? limit;

  Metadata({this.currentPage, this.numberOfPages, this.limit});

  factory Metadata.fromJson(Map<String, dynamic> json) => Metadata(
        currentPage: json["currentPage"],
        numberOfPages: json["numberOfPages"],
        limit: json["limit"],
      );

  Map<String, dynamic> toJson() => {
        "currentPage": currentPage,
        "numberOfPages": numberOfPages,
        "limit": limit,
      };
}
