import 'package:flutter/material.dart';

import '../../../../../core/theme/app_colors.dart';

class NavbarMobile extends StatelessWidget {
  const NavbarMobile({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 8),
      color: AppColors.surface,
      child: Row(
        children: [
          const Icon(Icons.code_rounded, color: AppColors.primary, size: 30),

          const SizedBox(width: 8),

          Text(
            'devstudio',
            style: TextStyle(
              fontSize: 24,
              fontWeight: FontWeight.w600,
              color: AppColors.text,
              letterSpacing: -0.5,
            ),
          ),

          const Spacer(),

          // IconButton(
          //   onPressed: () {},

          //   icon: const Icon(
          //     Icons.menu_rounded,

          //     size: 28,

          //     color: AppColors.text,
          //   ),
          // ),
        ],
      ),
    );
  }
}
