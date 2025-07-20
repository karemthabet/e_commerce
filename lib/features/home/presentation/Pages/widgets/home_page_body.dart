import 'package:e_commerce/core/utils/assets/app_assets.dart';
import 'package:e_commerce/core/utils/colors/app_colors.dart';
import 'package:e_commerce/core/utils/router/routes_name.dart';
import 'package:e_commerce/core/widgets/custom_cursor.dart';
import 'package:e_commerce/features/home/presentation/cubits/cubit_brand/brand_cubit.dart';
import 'package:e_commerce/features/home/presentation/cubits/cubit_category/category_cubit.dart';
import 'package:e_commerce/features/home/presentation/widgets/custom_home_shimmer.dart';
import 'package:e_commerce/features/home/presentation/widgets/custom_list_view_card.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:go_router/go_router.dart';

class HomePagesBody extends StatelessWidget {
  const HomePagesBody({super.key});
  @override
  Widget build(BuildContext context) {
    return CustomScrollView(
      physics: const BouncingScrollPhysics(),
      slivers: [
        SliverToBoxAdapter(
          child: Padding(
            padding: const EdgeInsets.symmetric(vertical: 20.0, horizontal: 10),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    const Text(
                      "𝒮𝒽𝑜𝓅𝓅𝒾𝑒",
                      style: TextStyle(fontSize: 50, color: AppColors.bluedark),
                    ),
                    const SizedBox(
                      height: 10,
                    ),
                    IconButton(
                      icon: const Icon(
                        Icons.shopping_cart,
                        color: AppColors.bluedark,
                        size: 40,
                      ),
                      onPressed: ()  {
                    

                        if (context.mounted) {
                          context.go(RoutesName.login);
                        }
                      },
                    )
                  ],
                ),
                const SizedBox(
                  height: 20,
                ),
                const CustomCarouselSlider(
                  images: [
                    AppAssets.sliderImageOne,
                    AppAssets.sliderImageTwo,
                    AppAssets.sliderImageThree,
                  ],
                ),
                const SizedBox(
                  height: 20,
                ),
                const Text(
                  "Categories",
                  style: TextStyle(
                      fontSize: 18,
                      color: AppColors.bluedark,
                      fontWeight: FontWeight.w500),
                ),
                BlocBuilder<CategoryCubit, CategoryState>(
                  builder: (context, state) {
                    if (state is CategorySuccess) {
                      final data = state.categories;
                      final halfLength = data.length ~/ 2;
                      final firstHalf = data.sublist(0, halfLength);
                      final secondHalf = data.sublist(halfLength);
                      return Column(
                        children: [
                          SizedBox(
                            height: MediaQuery.of(context).size.height * .2,
                            child: CustomListViewCard(
                                categoriesOrBrand: firstHalf),
                          ),
                          const SizedBox(height: 16),
                          SizedBox(
                            height: MediaQuery.of(context).size.height * .2,
                            child: CustomListViewCard(
                                categoriesOrBrand: secondHalf),
                          ),
                        ],
                      );
                    } else if (state is CategoryFailure) {
                      return SliverToBoxAdapter(
                        child: Center(
                          child: Text(
                            state.errorMessage,
                            style: const TextStyle(color: AppColors.pink),
                          ),
                        ),
                      );
                    } else {
                      return const CustomListViewCardShimmer(itemCount: 100);
                    }
                  },
                ),
                const Text(
                  "Brands",
                  style: TextStyle(
                      fontSize: 18,
                      color: AppColors.bluedark,
                      fontWeight: FontWeight.w500),
                ),
                BlocBuilder<BrandCubit, BrandState>(
                  builder: (context, state) {
                    if (state is BrandSuccess) {
                      final data = state.brands;
                      final halfLength = data.length ~/ 2;
                      final firstHalf = data.sublist(0, halfLength);
                      final secondHalf = data.sublist(halfLength);

                      return Column(
                        children: [
                          SizedBox(
                            height: MediaQuery.of(context).size.height * .2,
                            child: CustomListViewCard(
                                categoriesOrBrand: firstHalf),
                          ),
                          const SizedBox(height: 16),
                          SizedBox(
                            height: MediaQuery.of(context).size.height * .2,
                            child: CustomListViewCard(
                                categoriesOrBrand: secondHalf),
                          ),
                        ],
                      );
                    } else if (state is BrandFailure) {
                      return SliverToBoxAdapter(
                        child: Center(
                          child: Text(
                            state.errorMessage,
                            style: const TextStyle(color: AppColors.pink),
                          ),
                        ),
                      );
                    } else {
                      return const CustomListViewCardShimmer(itemCount: 10);
                    }
                  },
                ),
              ],
            ),
          ),
        )
      ],
    );
  }
}
