import 'package:e_commerce/core/widgets/general_app_bar.dart';
import 'package:e_commerce/features/favourites/presentation/widgets/favorites_page_app_bar.dart';
import 'package:e_commerce/features/favourites/presentation/widgets/favorites_page_list_view.dart';
import 'package:flutter/material.dart';

class FavoritesPage extends StatelessWidget {
  const FavoritesPage({super.key});

  @override
  Widget build(BuildContext context) {
    return const Scaffold(
      body: Column(
        children: [
          // App Bar
          SafeArea(
            child: FavoritesPageAppBar(),
          ),

          // List View
          Expanded(
            flex: 1,
            child: FavoritesPageListView(),
          ),
        ],
      ),
    );
  }
}
