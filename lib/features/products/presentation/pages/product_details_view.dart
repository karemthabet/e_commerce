import 'package:e_commerce/core/utils/colors/app_colors.dart';
import 'package:e_commerce/features/products/data/models/product_model.dart';
import 'package:e_commerce/features/products/presentation/pages/widgets/product_view_details_view_body.dart';
import 'package:flutter/material.dart';

class ProductDetailsView extends StatelessWidget {
  const ProductDetailsView({super.key, required this.product});
final Data product;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title:  const Text("Product Details",style: TextStyle(color: AppColors.bluedark),),
        centerTitle: true,
        actions:  [
          IconButton(icon: const Icon(Icons.shopping_cart_outlined,color: AppColors.bluedark),onPressed: (){},),
          const SizedBox(width: 10),
        ],
      ),
      body: ProductDetailsViewBody(product: product,)
    );
  }
}
