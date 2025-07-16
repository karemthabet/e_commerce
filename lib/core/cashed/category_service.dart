import 'package:e_commerce/features/home/data/models/categories_or_brand_model.dart';
import 'package:hive/hive.dart';

class CategoryHiveService {
  static const String boxName = 'category';


  final Box<CategoryDataOrBrands> _box = Hive.box<CategoryDataOrBrands>(boxName);

  Future<void> cacheCategory(List<CategoryDataOrBrands> category) async {
    await _box.clear();
    for (var product in category) {
      await _box.add(product);
    }
  }
  List<CategoryDataOrBrands> getCachedCategory() {
    return _box.values.toList();
  }
}
