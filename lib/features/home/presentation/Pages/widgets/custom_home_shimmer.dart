import 'package:e_commerce/core/utils/colors/app_colors.dart';
import 'package:flutter/material.dart';
import 'package:shimmer/shimmer.dart';

class CustomListViewCardShimmer extends StatelessWidget {
  const CustomListViewCardShimmer({super.key, required this.itemCount});
  final int itemCount;

  @override
  Widget build(BuildContext context) {
    final halfCount = (itemCount / 2).ceil();
    const spacing = 16.0;

    final screenWidth = MediaQuery.of(context).size.width;
    final containerHeight = MediaQuery.of(context).size.height * 0.4;
    Widget buildHorizontalShimmerList(int count) {
      return SizedBox(
        height: containerHeight / 2 - spacing,
        child: ListView.separated(
          scrollDirection: Axis.horizontal,
          itemCount: count,
          padding: const EdgeInsets.symmetric(horizontal: spacing),
          separatorBuilder: (_, __) => const SizedBox(width: spacing),
          itemBuilder: (context, index) {
            return Shimmer.fromColors(
              baseColor: AppColors.grey300,
              highlightColor: AppColors.whiteColor,
              child: Column(
                mainAxisSize: MainAxisSize.min,
                children: [
                  Container(
                    width: screenWidth * 0.3,
                    height: screenWidth * 0.3,
                    decoration: BoxDecoration(
                      color: AppColors.grey300,
                      shape: BoxShape.circle,
                    ),
                  ),
                  const SizedBox(height: 8),
                  Container(
                    width: screenWidth * 0.2,
                    height: 20,
                    decoration: BoxDecoration(
                      color: AppColors.grey300,
                      borderRadius: BorderRadius.circular(6),
                    ),
                  ),
                ],
              ),
            );
          },
        ),
      );
    }

    return SizedBox(
      width: screenWidth,
      height: containerHeight,
      child: Column(
        children: [
          buildHorizontalShimmerList(halfCount),
          const SizedBox(height: spacing),
          buildHorizontalShimmerList(itemCount - halfCount),
        ],
      ),
    );
  }
}
