import 'package:e_commerce/features/home/data/models/categories_or_brand_model.dart';
import 'package:hive/hive.dart';

class CategoryOrBrandHiveService {
  static const String boxName = 'categoryOrBrand';


  final Box<CategoryDataOrBrands> _box = Hive.box<CategoryDataOrBrands>(boxName);

  Future<void> cacheProducts(List<CategoryDataOrBrands> products) async {
    await _box.clear();
    for (var product in products) {
      await _box.add(product);
    }
  }
  List<CategoryDataOrBrands> getCachedProducts() {
    return _box.values.toList();
  }
}
