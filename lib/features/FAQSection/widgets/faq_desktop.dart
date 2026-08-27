import 'package:flutter/material.dart';
import 'package:portfolio/core/theme/app_colors.dart';
import '../models/faq_item.dart';
import 'faq_accordion_card.dart';
import 'faq_contact_card.dart';

class FaqDesktop extends StatelessWidget {
  const FaqDesktop({super.key});

  @override
  Widget build(BuildContext context) {
    return Directionality(
      textDirection: TextDirection.rtl,
      child: Container(
        width: double.infinity,
        color: AppColors.background,
        padding: const EdgeInsets.symmetric(horizontal: 100, vertical: 80),
        child: Row(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            // الجانب الأيمن (العنوان والوصف وكارت التواصل)
            Expanded(
              flex: 4,
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  const Text(
                    'الأسئلة الشائعة',
                    style: TextStyle(
                      fontSize: 32,
                      fontWeight: FontWeight.bold,
                      color: AppColors.text,
                      height: 1.2,
                    ),
                  ),
                  const SizedBox(height: 16),
                  const Text(
                    'إجابات سريعة عن خدمات تطوير التطبيقات والمواقع وآلية العمل.',
                    style: TextStyle(
                      fontSize: 16,
                      color: AppColors.textLight,
                      height: 1.5,
                    ),
                  ),
                  const SizedBox(height: 40),
                  const FaqContactCard(),
                ],
              ),
            ),
            const SizedBox(width: 60),

            // الجانب الأيسر (قائمة الأسئلة الشائعة)
            Expanded(
              flex: 6,
              child: Column(
                children: appFaqs
                    .map((faq) => FaqAccordionCard(faq: faq))
                    .toList(),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
