import 'package:e_commerce/features/products/presentation/widgets/product_page_body.dart';
import 'package:flutter/material.dart';

class ProductPage extends StatelessWidget {
  const ProductPage({super.key});

  @override
  Widget build(BuildContext context) {
    return  const Scaffold(
      body: ProductPageBody(),
    );
  }
}
