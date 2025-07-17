import 'package:e_commerce/features/favourites/presentation/widgets/favorites_item_container_body.dart';
import 'package:e_commerce/features/products/data/models/product_model.dart';
import 'package:flutter/material.dart';

class FavoritesItem extends StatelessWidget {
  final Data product;
  const FavoritesItem({super.key, required this.product});

  @override
  Widget build(BuildContext context) {
    return Container(
      width: double.infinity,
      height: MediaQuery.of(context).size.height * 0.13,
      margin: const EdgeInsets.all(12),
      decoration: BoxDecoration(
        border: Border.all(color: Colors.grey, style: BorderStyle.solid),
        borderRadius: BorderRadius.circular(
          12,
        ),
      ),
      child: FavoritesItemContainerBody(product: product),
    );
  }
}
