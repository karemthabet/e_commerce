import 'package:e_commerce/features/favourites/presentation/widgets/favorites_item.dart';
import 'package:flutter/material.dart';

class FavoritesPageBody extends StatelessWidget {
  const FavoritesPageBody({super.key});

  @override
  Widget build(BuildContext context) {
    return ListView.builder(
      itemBuilder: (context, index) {
        return FavoritesItem();
      },
      itemCount: 15,
    );
  }
}