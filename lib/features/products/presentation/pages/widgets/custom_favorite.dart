
import 'package:e_commerce/core/utils/colors/app_colors.dart';
import 'package:flutter/material.dart';

class CustomFavorite extends StatelessWidget {
  const CustomFavorite({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Positioned(
     top: 8,
     right: 8,
     child: CircleAvatar(
       backgroundColor: AppColors.whiteColor,
       radius: 16,
       child: IconButton(icon: const Icon(Icons.favorite_border,
           size: 18, color: AppColors.greyColor),onPressed: (){},),
     ),
                      );
  }
}
