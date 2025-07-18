import 'package:e_commerce/core/utils/styles/app_styles.dart';
import 'package:e_commerce/features/favourites/presentation/cubits/favorites_cubit/favorites_cubit.dart';
import 'package:e_commerce/features/favourites/presentation/widgets/favorites_item.dart';
import 'package:e_commerce/features/products/presentation/widgets/product_card_shimmer.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class FavoritesPageListView extends StatelessWidget {
  const FavoritesPageListView({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => FavoritesCubit()..getFavorites(),
      child: BlocBuilder<FavoritesCubit, FavoritesState>(
        builder: (context, state) {
          if (state is GetFavoritesSuccessState) {
            final List favorites = state.favorites;

            if (favorites.isEmpty) {
              return Column(
                mainAxisAlignment: MainAxisAlignment.center,
                crossAxisAlignment: CrossAxisAlignment.center,
                mainAxisSize: MainAxisSize.min,
                children: [
                  Text(
                    'No Favorites Yet  😅😅',
                    style: AppStyles.text16.copyWith(
                      fontSize: 30,
                    ),
                  ),
                  const ProductCardShimmer()
                ],
              );

            } else {
              return ListView.builder(
                physics: const BouncingScrollPhysics(),
                itemBuilder: (context, index) {
                  return FavoritesItem(product: favorites[index]);
                },
                itemCount: favorites.length,
              );
            }
          } else {
            return Center(
              child: Text(
                    'Something went wrong  🥸🥸',
                    style: AppStyles.text16.copyWith(
                      fontSize: 30,
                    ),
                  ),
            );
          }
        },
      ),
    );
  }
}
