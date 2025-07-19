
import 'package:e_commerce/features/products/data/models/brand_model.dart';
import 'package:e_commerce/features/products/data/models/category_model.dart' show Category;
import 'package:e_commerce/features/products/data/models/sub_category_model.dart';
import 'package:hive/hive.dart';
part 'data_model.g.dart';


@HiveType(typeId: 4)
class Data extends HiveObject {
  @HiveField(0)
  int? sold;

  @HiveField(1)
  List<String>? images;

  @HiveField(2)
  List<Subcategory>? subcategory;

  @HiveField(3)
  int? ratingsQuantity;

  @HiveField(4)
  String? id;

  @HiveField(5)
  String? title;

  @HiveField(6)
  String? slug;

  @HiveField(7)
  String? description;

  @HiveField(8)
  int? quantity;

  @HiveField(9)
  int? price;

  @HiveField(10)
  String? imageCover;

  @HiveField(11)
  Category? category;

  @HiveField(12)
  Brand? brand;

  @HiveField(13)
  double? ratingsAverage;

  @HiveField(14)
  String? createdAt;

  @HiveField(15)
  String? updatedAt;

  @HiveField(16)
  bool? isFavorite;

  Data({
    this.sold,
    this.images,
    this.subcategory,
    this.ratingsQuantity,
    this.id,
    this.title,
    this.slug,
    this.description,
    this.quantity,
    this.price,
    this.imageCover,
    this.category,
    this.brand,
    this.ratingsAverage,
    this.createdAt,
    this.updatedAt,
    this.isFavorite = false, // Default to false if not set
  });

  factory Data.fromJson(Map<String, dynamic> json) => Data(
        sold: json["sold"],
        images: json["images"] == null ? null : List<String>.from(json["images"]),
        subcategory: json["subcategory"] == null
            ? null
            : (json["subcategory"] as List)
                .map((e) => Subcategory.fromJson(e))
                .toList(),
        ratingsQuantity: json["ratingsQuantity"],
        id: json["_id"] ?? json["id"],
        title: json["title"],
        slug: json["slug"],
        description: json["description"],
        quantity: json["quantity"],
        price: json["price"],
        imageCover: json["imageCover"],
        category: json["category"] == null ? null : Category.fromJson(json["category"]),
        brand: json["brand"] == null ? null : Brand.fromJson(json["brand"]),
        ratingsAverage: json["ratingsAverage"]?.toDouble(),
        createdAt: json["createdAt"],
        updatedAt: json["updatedAt"],
      );

  Map<String, dynamic> toJson() => {
        "sold": sold,
        "images": images,
        "subcategory": subcategory?.map((e) => e.toJson()).toList(),
        "ratingsQuantity": ratingsQuantity,
        "_id": id,
        "title": title,
        "slug": slug,
        "description": description,
        "quantity": quantity,
        "price": price,
        "imageCover": imageCover,
        "category": category?.toJson(),
        "brand": brand?.toJson(),
        "ratingsAverage": ratingsAverage,
        "createdAt": createdAt,
        "updatedAt": updatedAt,
      };
}

