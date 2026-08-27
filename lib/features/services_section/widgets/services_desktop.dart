import 'package:flutter/material.dart';
import 'package:portfolio/core/theme/app_colors.dart';
import 'package:portfolio/core/widgets/section_title.dart';
import '../models/service_item.dart';
import 'service_card.dart';

class ServicesDesktop extends StatelessWidget {
  const ServicesDesktop({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      width: double.infinity,
      color: AppColors.background,
      padding: const EdgeInsets.symmetric(horizontal: 80, vertical: 80),
      child: Column(
        children: [
          const SectionTitle(
            title: 'خدماتي',
            subTitle: 'ما الذي يمكنني تقديمه لمشروعك القادم؟',
          ),
          const SizedBox(height: 50),
          GridView.builder(
            shrinkWrap: true,
            physics: const NeverScrollableScrollPhysics(),
            itemCount: appServices.length,
            gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
              crossAxisCount: 3,
              crossAxisSpacing: 24,
              mainAxisSpacing: 24,
              childAspectRatio: 1,
              mainAxisExtent: 280,
            ),
            itemBuilder: (context, index) {
              return ServiceCard(
                service: appServices[index],
                index: index, // تمرير الفهرس لتسلسل الحركة
              );
            },
          ),
        ],
      ),
    );
  }
}
