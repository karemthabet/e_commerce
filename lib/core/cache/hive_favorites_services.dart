import 'dart:developer';

import 'package:e_commerce/features/products/data/models/product_model.dart';
import 'package:hive/hive.dart';

class FavoritesHiveService {
  static const String boxName = 'favoritesBox';

  final Box<Data> _box = Hive.box<Data>(boxName);

  /// ✅ Cache all products (overwrites existing)
  Future<void> cacheFavorites(Data product) async {
    await _box.put(product.id, product);
  }

  /// ✅ Delete a single product by its Hive key (index)
  /// Returns true if deleted, false if not found
  Future<void> removeFromFavorites(Data product) async {
    return _box.delete(product.id);
  }


  Future<void> removeAllFavorites() async {
    await _box.clear();
  }

  /// ✅ Get all cached products
  List<Data> getCachedFavorites() {
    log("length of get is ${_box.values.toList().length}");
    return _box.values.toList();
  }

  /// ✅ Update a single attribute for a product by its Hive key (index)
  Future<void> updateProductAttributeById({
    required String productId,
    required String attribute,
    required dynamic newValue,
  }) async {
var productsBox = Hive.box<Data>('productsBox');

    
    
    // Find the index of the product with the given ID
    final index =
        productsBox.values.toList().indexWhere((product) => product.id == productId);

    if (index == -1) {
      throw Exception("Product with ID $productId not found");
    }

    // Get the existing product
    Data existingProduct = productsBox.getAt(index)!;

    // Update the attribute
    final updatedProduct =
        _updateProductAttribute(existingProduct, attribute, newValue);

    // Save it back to Hive
    await productsBox.putAt(index, updatedProduct);
  }

  /// ✅ Helper method to update one attribute dynamically
  Data _updateProductAttribute(
      Data product, String attribute, dynamic newValue) {
    switch (attribute) {
      case "sold":
        product.sold = newValue as int?;
        break;
      case "images":
        product.images = newValue as List<String>?;
        break;
      case "subcategory":
        product.subcategory = newValue as List<Subcategory>?;
        break;
      case "ratingsQuantity":
        product.ratingsQuantity = newValue as int?;
        break;
      case "id":
        product.id = newValue as String?;
        break;
      case "title":
        product.title = newValue as String?;
        break;
      case "slug":
        product.slug = newValue as String?;
        break;
      case "description":
        product.description = newValue as String?;
        break;
      case "quantity":
        product.quantity = newValue as int?;
        break;
      case "price":
        product.price = newValue as int?;
        break;
      case "imageCover":
        product.imageCover = newValue as String?;
        break;
      case "category":
        product.category = newValue as Category?;
        break;
      case "brand":
        product.brand = newValue as Brand?;
        break;
      case "ratingsAverage":
        product.ratingsAverage = newValue as double?;
        break;
      case "createdAt":
        product.createdAt = newValue as String?;
        break;
      case "updatedAt":
        product.updatedAt = newValue as String?;
        break;
      case "isFavorite":
        product.isFavorite = newValue as bool?;
        break;
      default:
        throw Exception("Attribute $attribute not found in Data model");
    }
    return product;
  }
}
