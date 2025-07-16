
import 'package:e_commerce/core/cache/brand_service.dart';
import 'package:e_commerce/core/cache/category_service.dart';
import 'package:e_commerce/core/cache/hive_product_services.dart';
import 'package:e_commerce/core/cache/prefs.dart';
import 'package:e_commerce/core/services/setup_service_locator.dart';
import 'package:e_commerce/e_commerce.dart';
import 'package:e_commerce/features/home/data/models/categories_or_brand_model.dart';
import 'package:e_commerce/features/products/data/models/product_model.dart';
import 'package:flutter/material.dart' show WidgetsFlutterBinding, runApp;
import 'package:hive_flutter/adapters.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Hive.initFlutter();
  Hive.registerAdapter(DataAdapter());
  Hive.registerAdapter(SubcategoryAdapter());
  Hive.registerAdapter(CategoryAdapter());
  Hive.registerAdapter(BrandAdapter());
  Hive.registerAdapter(AllCategoriesOrBrandsAdapter());
  Hive.registerAdapter(CategoryDataOrBrandsAdapter());
  Hive.registerAdapter(MetadataAdapter());
  await Hive.openBox<Data>(ProductsHiveService.boxName);
  await Hive.openBox<CategoryDataOrBrands>(CategoryHiveService.boxName);
  await Hive.openBox<CategoryDataOrBrands>(BrandHiveService.boxBrand);
  await Prefs.init();
  setupServiceLocator();
  //hide status bar
  
  runApp(const ECommerceApp());
}
