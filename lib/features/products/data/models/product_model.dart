import 'package:e_commerce/features/home/data/models/categories_or_brand_model.dart';
import 'package:e_commerce/features/products/data/models/data_model.dart';
import 'package:hive/hive.dart';

class ProductsModel  extends HiveObject{
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
      _data["metadata"] = metadata!.toJson();
    }
    if (data != null) {
      _data["data"] = data!.map((e) => e.toJson()).toList();
    }
    return _data;
  }
}



