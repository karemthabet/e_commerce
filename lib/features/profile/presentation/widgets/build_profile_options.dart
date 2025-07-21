import 'package:e_commerce/core/utils/colors/app_colors.dart';
import 'package:e_commerce/core/utils/styles/app_styles.dart';
import 'package:flutter/material.dart';

class BuildProfileOptions extends StatelessWidget {
  const BuildProfileOptions(
      {super.key,
      required this.icon,
      required this.title,
      required this.onTap});
  final IconData icon;
  final String title;
  final VoidCallback onTap;
  final Color iconColor = AppColors.bluedark;

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        ListTile(
          leading:
              Icon(icon, color: (title == "Logout") ? Colors.red : iconColor),
          title: Text(
            title,
            style: AppStyles.text18
                .copyWith(color: (title == "Logout") ? Colors.red : iconColor),
          ),
          trailing: const Icon(Icons.arrow_forward_ios, size: 16),
          onTap: onTap,
        ),
        const Divider(height: 1),
      ],
    );
  }
}
