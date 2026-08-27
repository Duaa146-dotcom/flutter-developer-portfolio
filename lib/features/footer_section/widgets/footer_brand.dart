import 'package:flutter/material.dart';
import 'package:portfolio/core/theme/app_colors.dart';

class FooterBrand extends StatelessWidget {
  const FooterBrand({super.key});

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      mainAxisSize: MainAxisSize.min,
      children: [
        Row(
          mainAxisSize: MainAxisSize.min,
          children: [
            Icon(
              Icons.code_rounded,
              color: AppColors.primary,
              size: 40,
              // weight: 20,
            ),
            const SizedBox(width: 8),
            const Text(
              'DevStudio',
              style: TextStyle(
                fontSize: 24,
                fontWeight: FontWeight.w900,
                color: Colors.white,
                letterSpacing: -0.5,
              ),
            ),
          ],
        ),
        const SizedBox(height: 6),
        const Text(
          'Flutter Developer',
          style: TextStyle(
            fontSize: 13,
            fontWeight: FontWeight.bold,
            color: AppColors.primary,
            letterSpacing: 0.5,
          ),
        ),
        const SizedBox(height: 12),
        const Text(
          'تطوير تطبيقات جوال ومنصات ويب متكاملة، أنيقة وحاصدة لأعلى أداء بلمسات برمجية مدروسة.',
          style: TextStyle(
            fontSize: 13.5,
            color: Color(0xFF9CA3AF),
            height: 1.6,
          ),
        ),
      ],
    );
  }
}
