// import 'package:e_commerce/core/cashed/prefs.dart';
// import 'package:e_commerce/core/utils/constants/app_constants.dart';
// import 'package:e_commerce/core/utils/router/routes_name.dart';
// import 'package:e_commerce/features/home/presentation/Pages/widgets/home_view_body.dart';
// import 'package:flutter/material.dart';
// import 'package:go_router/go_router.dart';

// class HomePage extends StatelessWidget {
//   const HomePage({super.key});

//   @override
//   Widget build(BuildContext context) {
//     return const Scaffold(
//       // appBar: AppBar(
//       //   actions: [
//       //     IconButton(
//       //       onPressed: () async {
//       //         await Prefs.removeData(key: AppConstants.kToken);
//       //         await Prefs.setBool(AppConstants.isLoggedIn, false);
//       //         context.go(RoutesName.login);
//       //       },
//       //       icon: const Icon(Icons.logout_sharp),
//       //     ),
//       //   ],
//       // ),

//       body: HomeViewBody(),
//     );
//   }
// }
import 'package:e_commerce/features/home/presentation/Pages/widgets/custom_bottom_nav_bar.dart';
import 'package:e_commerce/features/home/presentation/Pages/widgets/home_view_body.dart';
import 'package:e_commerce/features/products/presentation/pages/product_view.dart';
import 'package:flutter/material.dart';

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  int currentIndex = 0;

  final List<Widget> screens = [
    const HomeViewBody(),
const ProductView(),
    const Center(child: Text("Favorites")),
    const Center(child: Text("Profile")),
  ];

  void onTap(int index) {
    setState(() {
      currentIndex = index;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: screens[currentIndex],
      bottomNavigationBar:CustomBottomNavigationBar(onTap: onTap, currentIndex: currentIndex)
    );
  }
}
