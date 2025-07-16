import 'package:e_commerce/features/products/data/models/product_model.dart';
import 'package:hive/hive.dart';

class ProductsHiveService {
  static const String boxName = 'productsBox';


  final Box<Data> _box = Hive.box<Data>(boxName);

  Future<void> cacheProducts(List<Data> products) async {
    await _box.clear();
    for (var product in products) {
      await _box.add(product);
    }
  }
  List<Data> getCachedProducts() {
    return _box.values.toList();
  }
}


