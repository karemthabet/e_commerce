import 'package:e_commerce/core/utils/colors/app_colors.dart';
import 'package:e_commerce/features/products/presentation/cubits/product_cubit/products_cubit.dart';
import 'package:e_commerce/features/products/presentation/widgets/custom_product_info.dart';
import 'package:e_commerce/features/products/presentation/widgets/product_card_shimmer.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class CustomProductGridView extends StatelessWidget {
  const CustomProductGridView({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<ProductsCubit, ProductsState>(
      builder: (context, state) {
        if (state is ProductsSuccess) {
          final items = 
          state.products;
          return SliverGrid(
            gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
              crossAxisCount: 2,
              mainAxisSpacing: 12,
              crossAxisSpacing: 6,
              childAspectRatio: 0.8,
            ),
            delegate: SliverChildBuilderDelegate(childCount: items.length,
                (context, index) {
              return CustomProductCardInfo(
                product: items[index],
              );
            }),
          );
        } else if (state is ProductsFailure) {
          return SliverToBoxAdapter(
            child: Center(
              child: Text(
                state.errorMessage,
                style: const TextStyle(color: AppColors.pink),
              ),
            ),
          );
        } else {
          return SliverGrid(
            gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
              crossAxisCount: 2,
              mainAxisSpacing: 12,
              crossAxisSpacing: 6,
              childAspectRatio: 0.8,
            ),
            delegate: SliverChildBuilderDelegate(
              childCount: 6,
              (context, index) {
                return const ProductCardShimmer();
              },
            ),
          );
        }
      },
    );
  }
}
