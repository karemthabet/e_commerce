import 'package:e_commerce/core/services/setup_service_locator.dart';
import 'package:e_commerce/features/favourites/presentation/cubits/favorites_cubit/favorites_cubit.dart';
import 'package:e_commerce/features/products/presentation/cubits/product_cubit/products_cubit.dart';
import 'package:e_commerce/features/products/presentation/widgets/product_page_body.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class ProductPage extends StatelessWidget {
  const ProductPage({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
  create: (context) => getIt.get<ProductsCubit>()..getProducts(),
      child: BlocBuilder<ProductsCubit, ProductsState>(
        builder: (context, state) {
          context.read<ProductsCubit>().getProducts();
          return const Scaffold(
            body: ProductPageBody(),
          );
        },
      ),
    );
  }
}
