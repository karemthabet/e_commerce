import 'package:e_commerce/core/cache/hive_product_services.dart';
import 'package:e_commerce/core/services/setup_service_locator.dart';
import 'package:e_commerce/core/utils/colors/app_colors.dart';
import 'package:e_commerce/features/favourites/presentation/cubits/favorites_cubit/favorites_cubit.dart';
import 'package:e_commerce/features/products/data/models/product_model.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class CustomFavorite extends StatefulWidget {
  final Data? product;
  ProductsHiveService productsService = ProductsHiveService();
  CustomFavorite({
    super.key,
    required this.product,
  });

  @override
  State<CustomFavorite> createState() => _CustomFavoriteState();
}

class _CustomFavoriteState extends State<CustomFavorite> {
  @override
  Widget build(BuildContext context) {
    return Positioned(
      top: 8,
      right: 8,
      child: CircleAvatar(
        backgroundColor: AppColors.whiteColor,
        radius: 16,
        child: BlocProvider(
          create: (context) => getIt.get<FavoritesCubit>(),
          child: BlocBuilder<FavoritesCubit, FavoritesState>(
            builder: (context, state) {
              return IconButton(
                icon: Icon(Icons.favorite,
                    size: 18,
                    color: (widget.product?.isFavorite == false)
                        ? AppColors.grey300
                        : AppColors.pink),
                onPressed: () async {
                  if (widget.product?.isFavorite != null) {
                    // step 1: toggle the favorite Heart UI
                    context
                        .read<FavoritesCubit>()
                        .updateFavoritesHeart(widget.product!);

                    // step 2: update the favorite status in the Local Storage Hive
                    context.read<FavoritesCubit>().updateIsFavoriteAttribute(
                        widget.product!.id, widget.product!.isFavorite!);

                    // step 3: update the favorites list in the FavoritesCubit  (add - remove)
                    context
                        .read<FavoritesCubit>()
                        .updateFavoritesList(widget.product!);
                  }
                },
              );
            },
          ),
        ),
      ),
    );
  }
}
