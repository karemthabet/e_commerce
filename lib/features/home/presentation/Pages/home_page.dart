import 'package:e_commerce/core/cache/prefs.dart';
import 'package:e_commerce/core/utils/constants/app_constants.dart';
import 'package:e_commerce/core/utils/router/routes_name.dart';
import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
 
 
class HomePage extends StatelessWidget {
  const HomePage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        actions: [
          IconButton(
            onPressed: () async {
              await Prefs.removeData(key: AppConstants.kToken);
              await Prefs.setBool(AppConstants.isLoggedIn, false);
              if (context.mounted) {
                context.go(RoutesName.login);
              }
            },
            icon: const Icon(Icons.logout_sharp),
          ),
        ],
      ),

      body: const Center(child: Text('Home View')),
    );
  }
}
