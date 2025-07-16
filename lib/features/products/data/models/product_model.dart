import 'package:hive/hive.dart';
part 'product_model.g.dart';

class ProductsModel {
  int? results;
  Metadata? metadata;
  List<Data>? data;

  ProductsModel({this.results, this.metadata, this.data});

  ProductsModel.fromJson(Map<String, dynamic> json) {
    results = json["results"];
    metadata =
        json["metadata"] == null ? null : Metadata.fromJson(json["metadata"]);
    data = json["data"] == null
        ? null
        : (json["data"] as List).map((e) => Data.fromJson(e)).toList();
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> _data = <String, dynamic>{};
    _data["results"] = results;
    if (metadata != null) {
      _data["metadata"] = metadata?.toJson();
    }
    if (data != null) {
      _data["data"] = data?.map((e) => e.toJson()).toList();
    }
    return _data;
  }
}



@HiveType(typeId: 4)
class Data {
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



@HiveType(typeId: 7)
class Brand {
  @HiveField(0)
  String? id;

  @HiveField(1)
  String? name;

  @HiveField(2)
  String? slug;

  @HiveField(3)
  String? image;

  Brand({this.id, this.name, this.slug, this.image});

  factory Brand.fromJson(Map<String, dynamic> json) => Brand(
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



@HiveType(typeId: 5)
class Subcategory {
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


class Metadata {
  int? currentPage;
  int? numberOfPages;
  int? limit;
  int? nextPage;

  Metadata({this.currentPage, this.numberOfPages, this.limit, this.nextPage});

  Metadata.fromJson(Map<String, dynamic> json) {
    currentPage = json["currentPage"];
    numberOfPages = json["numberOfPages"];
    limit = json["limit"];
    nextPage = json["nextPage"];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> _data = <String, dynamic>{};
    _data["currentPage"] = currentPage;
    _data["numberOfPages"] = numberOfPages;
    _data["limit"] = limit;
    _data["nextPage"] = nextPage;
    return _data;
  }
}
