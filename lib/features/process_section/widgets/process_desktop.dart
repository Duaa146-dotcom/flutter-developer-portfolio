import 'package:flutter/material.dart';
import 'package:portfolio/core/theme/app_colors.dart';
import 'package:portfolio/core/widgets/section_title.dart';
import '../models/process_step.dart';
import 'process_step_card.dart';

class ProcessDesktop extends StatelessWidget {
  const ProcessDesktop({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      width: double.infinity,
      color: AppColors.background,
      padding: const EdgeInsets.symmetric(horizontal: 100, vertical: 80),
      child: Column(
        children: [
          const SectionTitle(
            title: 'خطوات العمل',
            subTitle:
                'من الفكرة الأولى إلى المنتج النهائي، نعمل بخطوات واضحة ومنظمة.',
          ),
          const SizedBox(height: 60),

          // الخط الزمني الرأسي في المنتصف
          ConstrainedBox(
            constraints: const BoxConstraints(maxWidth: 1000),
            child: Stack(
              alignment: Alignment.center,
              children: [
                // الخط الفاصل العمودي (في مكانه تماماً)
                Positioned(
                  top: 0,
                  bottom: 0,
                  child: Container(width: 2, color: AppColors.border),
                ),

                // توزيع الخطوات يميناً ويساراً
                Column(
                  children: List.generate(processSteps.length, (index) {
                    final isEven = index % 2 == 0;
                    return Row(
                      children: [
                        // الجانب الأيسر
                        Expanded(
                          child: isEven
                              ? const SizedBox()
                              : Padding(
                                  // تم زيادة الهامش لإبعاد الكارد عن الخط والدائرة
                                  padding: const EdgeInsets.only(
                                    left: 30,
                                    right: 20,
                                  ),
                                  child: ProcessStepCard(
                                    step: processSteps[index],
                                    isLeft: true,
                                  ),
                                ),
                        ),

                        // مسافة أمان قبل الدائرة
                        const SizedBox(width: 10),

                        // النقطة المركزية الفاصلة
                        Container(
                          width: 12,
                          height: 12,
                          decoration: BoxDecoration(
                            color: AppColors.primary,
                            shape: BoxShape.circle,
                            border: Border.all(color: Colors.white, width: 2),
                          ),
                        ),

                        // مسافة أمان بعد الدائرة
                        const SizedBox(width: 10),

                        // الجانب الأيمن
                        Expanded(
                          child: !isEven
                              ? const SizedBox()
                              : Padding(
                                  // تم زيادة الهامش لإبعاد الكارد عن الخط والدائرة
                                  padding: const EdgeInsets.only(
                                    right: 60,
                                    left: 30,
                                  ),
                                  child: ProcessStepCard(
                                    step: processSteps[index],
                                    isLeft: false,
                                  ),
                                ),
                        ),
                      ],
                    );
                  }),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
