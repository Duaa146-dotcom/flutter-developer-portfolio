import 'package:flutter/material.dart';
import 'package:portfolio/core/theme/app_colors.dart';
import 'package:portfolio/core/widgets/section_title.dart';
import '../models/service_item.dart';
import 'service_card.dart';

class ServicesMobile extends StatelessWidget {
  const ServicesMobile({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      width: double.infinity,
      color: AppColors.background,
      padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 40),
      child: Column(
        children: [
          const SectionTitle(
            title: 'خدماتي',
            subTitle: 'ما الذي يمكنني تقديمه لمشروعك القادم؟',
          ),
          const SizedBox(height: 30),

          // استخدام Column بدلاً من ListView يمنع تعارض الارتفاع غير المحدود
          Column(
            children: appServices
                .map(
                  (service) => Padding(
                    padding: const EdgeInsets.only(bottom: 16),
                    child: ServiceCard(service: service),
                  ),
                )
                .toList(),
          ),
        ],
      ),
    );
  }
}
