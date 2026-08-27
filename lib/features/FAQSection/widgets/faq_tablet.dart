import 'package:flutter/material.dart';
import 'package:portfolio/core/theme/app_colors.dart';
import 'package:portfolio/core/widgets/section_title.dart';
import '../models/faq_item.dart';
import 'faq_accordion_card.dart';
import 'faq_contact_card.dart';

class FaqTablet extends StatelessWidget {
  const FaqTablet({super.key});

  @override
  Widget build(BuildContext context) {
    return Directionality(
      textDirection: TextDirection.rtl,
      child: Container(
        width: double.infinity,
        color: AppColors.background,
        padding: const EdgeInsets.symmetric(horizontal: 40, vertical: 60),
        child: Column(
          children: [
            const SectionTitle(
              title: 'الأسئلة الشائعة',
              subTitle:
                  'إجابات سريعة عن خدمات تطوير التطبيقات والمواقع وآلية العمل.',
            ),
            const SizedBox(height: 40),
            Column(
              children: appFaqs
                  .map((faq) => FaqAccordionCard(faq: faq))
                  .toList(),
            ),
            const SizedBox(height: 30),
            const FaqContactCard(),
          ],
        ),
      ),
    );
  }
}
