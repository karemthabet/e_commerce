import 'package:e_commerce/core/utils/colors/app_colors.dart';
import 'package:e_commerce/features/products/presentation/pages/widgets/custom_grid_view.dart';
import 'package:flutter/material.dart';

class ProductPageBody extends StatelessWidget {
  const ProductPageBody({super.key});

  @override
  Widget build(BuildContext context) {
    return const CustomScrollView(slivers: [
      SliverToBoxAdapter(
        child: Padding(
          padding: EdgeInsets.symmetric(vertical: 20.0,horizontal: 10),
          child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              "𝒮𝒽𝑜𝓅𝓅𝒾𝑒",
              style: TextStyle(fontSize: 50, color: AppColors.bluedark),
            ),
          ]
            ),
        ),
    
      ),
      CustomProductGridView()],
      );
 
    
  }
}
