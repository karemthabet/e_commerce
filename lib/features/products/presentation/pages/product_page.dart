import 'package:e_commerce/features/products/presentation/cubits/product_cubit/products_cubit.dart';
import 'package:e_commerce/features/products/presentation/widgets/product_page_body.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class ProductPage extends StatelessWidget {
  const ProductPage({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<ProductsCubit, ProductsState>(
      builder: (context, state) {
        context.read<ProductsCubit>().getProducts();
        return const Scaffold(
          body: ProductPageBody(),
        );
      },
    );
  }
}
