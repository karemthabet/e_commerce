import 'package:cached_network_image/cached_network_image.dart';
import 'package:e_commerce/core/utils/colors/app_colors.dart';
import 'package:e_commerce/core/utils/router/routes_name.dart';
import 'package:e_commerce/core/utils/styles/app_styles.dart';
import 'package:e_commerce/features/products/data/models/product_model.dart';
import 'package:e_commerce/features/products/presentation/pages/widgets/custom_favorite.dart';
import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';

class CustomProductCardInfo extends StatelessWidget {
  const CustomProductCardInfo({
    super.key,
    required this.product,
  });
  final Data product;

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        GoRouter.of(context).push(RoutesName.productDetails,extra: product);
      },
      child: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 10.0),
        child: Container(
          decoration: BoxDecoration(
            color: AppColors.whiteColor,
            border: Border.all(color: AppColors.bluedark),
            borderRadius: BorderRadius.circular(12),
            boxShadow: [
              BoxShadow(
                color: AppColors.greyColor.withOpacity(0.2),
                blurRadius: 5,
                offset: const Offset(0, 3),
              ),
            ],
          ),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Stack(
                children: [
                  ClipRRect(
                    borderRadius:
                        const BorderRadius.vertical(top: Radius.circular(12)),
                    child: CachedNetworkImage(
                      imageUrl: product.imageCover!,
                      height: 100,
                      width: double.infinity,
                      fit: BoxFit.cover,
                    ),
                  ),
                   const CustomFavorite(),
                ],
              ),
              Padding(
                padding: const EdgeInsets.symmetric(horizontal: 8, vertical: 4),
                child: Text(
                  product.title!,
                  style:AppStyles.text16,
                  maxLines: 1,
                  overflow: TextOverflow.ellipsis,
                ),
              ),
              Padding(
                padding: const EdgeInsets.symmetric(horizontal: 8),
                child: Text(
                  product.description!,
                  style: AppStyles.text15.copyWith(fontSize: 12, color: AppColors.greyColor),
                  maxLines: 1,
                  overflow: TextOverflow.ellipsis,
                ),
              ),
              Padding(
                padding: const EdgeInsets.symmetric(horizontal: 8, vertical: 4),
                child: Text("${product.price.toString()} EGP",
                    style: AppStyles.text15),
              ),
              Padding(
                padding: const EdgeInsets.symmetric(horizontal: 8),
                child: Row(
                  children: [
                    Text("Review(${product.ratingsAverage.toString()})",
                        style: AppStyles.text16.copyWith(fontWeight: FontWeight.w100)),
                    const SizedBox(width: 4),
                     const Icon(Icons.star, size: 18, color: AppColors.yellow),
                    const Spacer(),
                    CircleAvatar(
                      backgroundColor: const Color.fromRGBO(35, 84, 100, 1),
                      radius: 16,
                      child: IconButton(
                          onPressed: () {},
                          icon: const Icon(Icons.add,
                              color: AppColors.whiteColor, size: 16)),
                    ),
                  ],
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
