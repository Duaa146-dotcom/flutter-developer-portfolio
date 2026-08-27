import 'package:flutter/material.dart';
import 'package:portfolio/core/theme/app_colors.dart';
import 'package:portfolio/core/widgets/section_title.dart';
import '../models/service_item.dart';
import 'service_card.dart';

class ServicesTablet extends StatelessWidget {
  const ServicesTablet({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      width: double.infinity,
      color: AppColors.background,
      padding: const EdgeInsets.symmetric(horizontal: 40, vertical: 60),
      child: Column(
        children: [
          const SectionTitle(
            title: 'خدماتي',
            subTitle: 'ما الذي يمكنني تقديمه لمشروعك القادم؟',
          ),
          const SizedBox(height: 40),
          GridView.builder(
            shrinkWrap: true,
            physics: const NeverScrollableScrollPhysics(),
            itemCount: appServices.length,
            gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
              crossAxisCount: 2,
              crossAxisSpacing: 20,
              mainAxisSpacing: 0,
              childAspectRatio: 1.47,
              mainAxisExtent: 280,
            ),
            itemBuilder: (context, index) {
              return ServiceCard(service: appServices[index]);
            },
          ),
        ],
      ),
    );
  }
}
