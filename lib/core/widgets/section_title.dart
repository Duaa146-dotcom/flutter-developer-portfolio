import 'package:flutter/material.dart';
import 'package:portfolio/core/theme/app_colors.dart';

class SectionTitle extends StatelessWidget {
  final String title;
  final String? subTitle;

  const SectionTitle({super.key, required this.title, this.subTitle});

  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisSize: MainAxisSize.min,
      crossAxisAlignment: CrossAxisAlignment.center,
      children: [
        // العنوان الرئيسي
        Text(
          title,
          textAlign: TextAlign.center,
          style: const TextStyle(
            fontSize: 32,
            fontWeight: FontWeight.bold,
            color: AppColors.text,
            height: 1.2,
          ),
        ),
        const SizedBox(height: 8),

        // خط ديكوري بسيط باللون الأساسي للبراند
        Container(
          width: 50,
          height: 4,
          decoration: BoxDecoration(
            color: AppColors.primary,
            borderRadius: BorderRadius.circular(2),
          ),
        ),

        // الوصف الفرعي إن وجد
        if (subTitle != null) ...[
          const SizedBox(height: 12),
          Text(
            subTitle!,
            textAlign: TextAlign.center,
            style: const TextStyle(fontSize: 16, color: AppColors.textLight),
          ),
        ],
      ],
    );
  }
}
