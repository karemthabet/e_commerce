import 'package:e_commerce/core/services/setup_service_locator.dart';
import 'package:e_commerce/features/favourites/presentation/pages/favorites_page.dart';
import 'package:e_commerce/features/home/presentation/Pages/home_page.dart';
import 'package:e_commerce/features/home/presentation/cubits/cubit_brand/brand_cubit.dart';
import 'package:e_commerce/features/home/presentation/cubits/cubit_category/category_cubit.dart';
import 'package:e_commerce/features/home/presentation/widgets/custom_bottom_nav_bar.dart';
import 'package:e_commerce/features/products/presentation/cubits/product_cubit/products_cubit.dart';
import 'package:e_commerce/features/products/presentation/pages/product_page.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class MainPage extends StatefulWidget {
  final int initialIndex;

const MainPage({super.key, this.initialIndex = 0}); // default is 0 (Home)
  @override
  State<MainPage> createState() => _MainPageState();
}

class _MainPageState extends State<MainPage> {
  int currentIndex = 0;

  final List<Widget> screens = const [
    HomePage(),
    ProductPage(),
    FavoritesPage(),
    Center(child: Text("Profile")),
  ];

  void onTap(int index) {
    setState(() {
      currentIndex = index;
    });
  }

  @override
  void initState() {
    super.initState();
        currentIndex = widget.initialIndex; // start from passed index

 
  }

  @override
  void dispose() {
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return MultiBlocProvider(
      providers: [
        // Brand Cubit
        BlocProvider(
          create: (context) => getIt.get<BrandCubit>()..getAllBrands(),
        ),
        // Category Cubit
        BlocProvider(
          create: (context) => getIt.get<CategoryCubit>()..getAllCategories(),
        ),
        // Products Cubit
        BlocProvider(
          create: (context) => getIt.get<ProductsCubit>()..getProducts(),
        ),
      ],
      child:   Scaffold(
      body: screens[currentIndex],
      bottomNavigationBar: CustomBottomNavigationBar(
        onTap: onTap,
        currentIndex: currentIndex,
      ),
    )
    );
  }
}
