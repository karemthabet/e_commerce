import 'package:cached_network_image/cached_network_image.dart';
import 'package:e_commerce/core/utils/colors/app_colors.dart';
import 'package:e_commerce/features/home/data/models/categories_or_brand_model.dart';
import 'package:flutter/material.dart';

class CustomListViewCard extends StatelessWidget {
  const CustomListViewCard({super.key, required this.categoriesOrBrand});
  final List<CategoryDataOrBrands> categoriesOrBrand;
  @override
  Widget build(BuildContext context) {
    return ListView.separated(
        separatorBuilder: (context, index) {
          return const SizedBox(
            width: 16,
          );
        },
        itemCount: categoriesOrBrand.length,
        scrollDirection: Axis.horizontal,
        itemBuilder: (context, index) {
          final result = categoriesOrBrand[index];

          return Column(
            children: [
              CircleAvatar(
                radius: 60,
                backgroundImage: CachedNetworkImageProvider(
                  result.image??"",
                ),
              ),
              Text(
                result.name??"",
                style: const TextStyle(
                    fontSize: 18,
                    color: AppColors.bluedark,
                    fontWeight: FontWeight.w500),
              ),
            ],
          );
        });
  }
}

