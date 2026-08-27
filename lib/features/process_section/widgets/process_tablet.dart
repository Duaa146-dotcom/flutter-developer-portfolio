import 'package:flutter/material.dart';
import 'package:portfolio/core/theme/app_colors.dart';
import 'package:portfolio/core/widgets/section_title.dart';
import '../models/process_step.dart';
import 'process_step_card.dart';

class ProcessTablet extends StatelessWidget {
  const ProcessTablet({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      width: double.infinity,
      color: AppColors.background,
      padding: const EdgeInsets.symmetric(horizontal: 40, vertical: 60),
      child: Column(
        children: [
          const SectionTitle(
            title: 'خطوات العمل',
            subTitle:
                'من الفكرة الأولى إلى المنتج النهائي، نعمل بخطوات واضحة ومنظمة.',
          ),
          const SizedBox(height: 40),
          Column(
            children: processSteps
                .map((step) => ProcessStepCard(step: step))
                .toList(),
          ),
        ],
      ),
    );
  }
}
