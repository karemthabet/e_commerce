import 'package:e_commerce/core/cashed/prefs.dart';
import 'package:e_commerce/core/utils/router/routes_name.dart';
import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';

class SkipWidget extends StatelessWidget {
  const SkipWidget({super.key, required this.isLastPage});

  final bool isLastPage;

  @override
  Widget build(BuildContext context) {
    return Positioned.directional(
      textDirection: Directionality.of(context),
      end: 20,
      top: 50,
      child: Visibility(
        visible: !isLastPage,
        child: InkWell(
          onTap: () async {
            await Prefs.setSeenOnBoarding(true);
            context.go(RoutesName.login);
          },
          borderRadius: BorderRadius.circular(8),
          child:  const Padding(
            padding: EdgeInsets.all(8.0),
            child: Text('Skip'),
          ),
        ),
      ),
    );
  }
}
