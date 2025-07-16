import 'package:e_commerce/core/services/setup_service_locator.dart';
import 'package:e_commerce/features/products/presentation/cubits/product_cubit/products_cubit.dart';
import 'package:e_commerce/features/products/presentation/pages/widgets/product_view_body.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class ProductView extends StatelessWidget {
  const ProductView({super.key});

  @override
  Widget build(BuildContext context) {
    return  Scaffold(
      body: BlocProvider(
        create: (context) => getIt.get<ProductsCubit>()..getProducts(),
        child: const ProductViewBody(),
      ),
    );
  }
}
