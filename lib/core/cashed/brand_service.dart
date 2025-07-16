
import 'package:e_commerce/features/home/data/models/categories_or_brand_model.dart';
import 'package:hive/hive.dart';

class BrandHiveService {
  static const String boxBrand= 'brand';
final Box<CategoryDataOrBrands> box=Hive.box(BrandHiveService.boxBrand);

Future<void>casheBrand(List<CategoryDataOrBrands>brands)async{
  await box.clear();
  for(var brand in brands ){
    await box.add(brand);
  }
}
List<CategoryDataOrBrands> getCashedBrands(){
  return box.values.toList();

}
}