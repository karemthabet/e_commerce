import 'package:e_commerce/features/products/data/models/brand_model.dart';
import 'package:e_commerce/features/products/data/models/category_model.dart';
import 'package:e_commerce/features/products/data/models/data_model.dart';
import 'package:e_commerce/features/products/data/models/sub_category_model.dart';
import 'package:hive/hive.dart';

class ProductsHiveService {
  static const String boxName = 'productsBox';

  final Box<Data> _box = Hive.box<Data>(boxName);

  // Cache all products (overwrites existing)
  Future<void> cacheProducts(List<Data> products) async {
    await _box.clear();
    for (var product in products) {
      await _box.add(product);
    }
  }

  //Get all cached products
  List<Data> getCachedProducts() {
    return _box.values.toList();
  }

// get favorites
  List<Data> getFavoriteProducts() {
    List<Data> favorites = [];
    final allProducts = _box.values.toList();
    for (var product in allProducts) {
      if (product.isFavorite == true) {
        favorites.add(product);
      }
    }
    return favorites;
  }
 Future<void> updateProductAttributeById({
    required String productId,
    required String attribute,
    required dynamic newValue,
  }) async {
    // Find the index of the product with the given ID
    final index =
        _box.values.toList().indexWhere((product) => product.id == productId);

    if (index == -1) {
      throw Exception("Product with ID $productId not found");
    }

    // Get the existing product
    Data existingProduct = _box.getAt(index)!;
    // Update the attribute
    final updatedProduct =
        _updateProductAttribute(existingProduct, attribute, newValue);
    // Save it back to Hive
    await _box.putAt(index, updatedProduct);
  }

  // Helper method to update one attribute dynamically
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
