import 'package:e_commerce/core/widgets/general_app_bar.dart';
import 'package:e_commerce/features/products/presentation/widgets/custom_grid_view.dart';
import 'package:flutter/material.dart';

class ProductPageBody extends StatelessWidget {
  const ProductPageBody({super.key});

  @override
  Widget build(BuildContext context) {
    return const CustomScrollView(
      slivers: [
        SliverToBoxAdapter(
          child: Padding(
            padding: EdgeInsets.symmetric(vertical: 20.0, horizontal: 10),
            child:
                Column(crossAxisAlignment: CrossAxisAlignment.start, children: [
              GeneralAppBar(
                pageTitle: "𝒮𝒽𝑜𝓅𝓅𝒾𝑒",
              ),
            ]),
          ),
        ),
         CustomProductGridView()
      ],
    );
  }
}
