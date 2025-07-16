
import 'package:e_commerce/core/utils/colors/app_colors.dart';
import 'package:flutter/material.dart';
import 'package:shimmer/shimmer.dart';

class ProductCardShimmer extends StatelessWidget {
  const ProductCardShimmer({super.key});

  @override
  Widget build(BuildContext context) {
    final screenWidth = MediaQuery.of(context).size.width;
    final screenHeight = MediaQuery.of(context).size.height;
    final cardWidth = screenWidth * 0.45;

    return Padding(
      padding: EdgeInsets.symmetric(horizontal: screenWidth * 0.025),
      child: Container(
        width: cardWidth,
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(12),
          color: AppColors.whiteColor,
          boxShadow: [BoxShadow(color: AppColors.grey300, blurRadius: 5)],
        ),
        child: Shimmer.fromColors(
          baseColor: AppColors.grey300,
          highlightColor: AppColors.whiteColor,
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Container(
                height: cardWidth * 0.6, 
                decoration: BoxDecoration(
                  color: AppColors.grey300,
                  borderRadius: const BorderRadius.vertical(top: Radius.circular(12)),
                ),
              ),
              SizedBox(height: screenHeight * 0.01),
              Container(
                margin: EdgeInsets.symmetric(horizontal: screenWidth * 0.02),
                height: screenHeight * 0.02,
                width: cardWidth * 0.6,
                color: AppColors.grey300,
              ),
              SizedBox(height: screenHeight * 0.008),
              Container(
                margin: EdgeInsets.symmetric(horizontal: screenWidth * 0.02),
                height: screenHeight * 0.018,
                width: cardWidth * 0.9,
                color: AppColors.grey300,
              ),
              SizedBox(height: screenHeight * 0.008),
              Container(
                margin: EdgeInsets.symmetric(horizontal: screenWidth * 0.02),
                height: screenHeight * 0.02,
                width: cardWidth * 0.35,
                color: AppColors.grey300,
              ),
              SizedBox(height: screenHeight * 0.015),
              Padding(
                padding: EdgeInsets.symmetric(horizontal: screenWidth * 0.02),
                child: Row(
                  children: [
                    Container(height: screenHeight * 0.025, width: cardWidth * 0.4, color: Colors.grey.shade400),
                    const Spacer(),
                    Container(
                      height: screenHeight * 0.045,
                      width: screenHeight * 0.045,
                      decoration: BoxDecoration(
                        color: AppColors.grey300,
                        shape: BoxShape.circle,
                      ),
                    ),
                  ],
                ),
              )
            ],
          ),
        ),
      ),
    );
  }
}
