import 'package:e_commerce/core/utils/colors/app_colors.dart';
import 'package:e_commerce/core/utils/styles/app_styles.dart';
import 'package:e_commerce/core/widgets/custom_favorite.dart';
import 'package:e_commerce/core/widgets/general_network_image.dart';
import 'package:e_commerce/features/products/data/models/data_model.dart' show Data;
import 'package:flutter/material.dart';

class FavoritesItemContainerBody extends StatelessWidget {
  final Data product;
  const FavoritesItemContainerBody({super.key, required this.product});

  @override
  Widget build(BuildContext context) {
    return Row(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        // Product image
        Expanded(
          flex: 2,
          child: GeneralNetworkImage(
            imageUrl: product.imageCover!,
          ),
        ),

        const SizedBox(width: 2),

        // Product name & price
        Expanded(
          flex: 3,
          child: Padding(
            padding: const EdgeInsets.all(8.0),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.spaceAround,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  product.title ?? "No Name",
                  style: AppStyles.text16.copyWith(fontWeight: FontWeight.bold),
                  maxLines: 1,
                  overflow: TextOverflow.ellipsis,
                ),
                const SizedBox(height: 4),
                Text(
                  "${product.price ?? 0} EGP",
                  style: AppStyles.text16.copyWith(
                    fontWeight: FontWeight.bold,
                    color: AppColors.bluedark,
                  ),
                  maxLines: 1,
                  overflow: TextOverflow.ellipsis,
                ),
              ],
            ),
          ),
        ),

        const SizedBox(width: 10),

        // action buttons  favorite + Add to Cart
        Padding(
          padding: const EdgeInsets.all(8.0),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            crossAxisAlignment: CrossAxisAlignment.end,
            children: [
              CustomFavorite(product: product),
              const SizedBox(height: 6),

              // Add to Cart button (Responsive)
              ConstrainedBox(
                constraints: const BoxConstraints(maxWidth: 120),
                child: ElevatedButton(
                  style: ElevatedButton.styleFrom(
                    backgroundColor: AppColors.bluedark,
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(20),
                    ),
                    padding:
                        const EdgeInsets.symmetric(horizontal: 8, vertical: 6),
                  ),
                  onPressed: () {},
                  child: FittedBox(
                    fit: BoxFit.scaleDown,
                    child: Text(
                      "Add to Cart",
                      style: AppStyles.text16.copyWith(
                        color: Colors.white,
                        fontSize: 14, // Slightly smaller to prevent overflow
                      ),
                    ),
                  ),
                ),
              ),
            ],
          ),
        ),
      ],
    );
  }
}
