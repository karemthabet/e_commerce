import 'package:e_commerce/core/cache/brand_service.dart';
import 'package:e_commerce/core/cache/category_service.dart';
import 'package:e_commerce/core/utils/colors/app_colors.dart';
import 'package:e_commerce/core/utils/router/routes_name.dart';
import 'package:e_commerce/features/home/data/models/categories_or_brand_model.dart';
import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:hive/hive.dart';

class CartIcon extends StatelessWidget {
  const CartIcon({super.key});

  @override
  Widget build(BuildContext context) {
    return Align(
      alignment: Alignment.topRight,
      child: IconButton(
        icon: const Icon(
          Icons.shopping_cart,
          color: AppColors.bluedark,
          size: 40,
        ),
        onPressed: ()async {
          final Box<CategoryDataOrBrands> box0 =
              Hive.box<CategoryDataOrBrands>(CategoryHiveService.boxName);
          final Box<CategoryDataOrBrands> box =
              Hive.box(BrandHiveService.boxBrand);

        await  box0.clear();
        await  box.clear();

          if (context.mounted) {
            context.go(RoutesName.login);
          }
        },
      ),
    );
  }
}
