import 'package:flutter/material.dart';
import 'package:portfolio/core/theme/app_colors.dart';
import '../models/faq_item.dart';

class FaqAccordionCard extends StatefulWidget {
  final FaqItem faq;

  const FaqAccordionCard({super.key, required this.faq});

  @override
  State<FaqAccordionCard> createState() => _FaqAccordionCardState();
}

class _FaqAccordionCardState extends State<FaqAccordionCard> {
  bool isExpanded = false;

  @override
  Widget build(BuildContext context) {
    return AnimatedContainer(
      duration: const Duration(milliseconds: 300),
      curve: Curves.easeInOutCubic,
      margin: const EdgeInsets.only(bottom: 16),
      decoration: BoxDecoration(
        color: AppColors.surface,
        borderRadius: BorderRadius.circular(16),
        border: Border.all(
          color: isExpanded
              ? AppColors.primary.withOpacity(0.4)
              : AppColors.border,
          width: 1.2,
        ),
      ),
      child: Material(
        color: Colors.transparent,
        borderRadius: BorderRadius.circular(16),
        child: InkWell(
          borderRadius: BorderRadius.circular(16),
          onTap: () => setState(() => isExpanded = !isExpanded),
          child: Padding(
            padding: const EdgeInsets.all(20),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                // السؤال والسهم التفاعلي
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Expanded(
                      child: Text(
                        widget.faq.question,
                        style: const TextStyle(
                          fontSize: 16,
                          fontWeight: FontWeight.bold,
                          color: AppColors.text,
                        ),
                      ),
                    ),
                    const SizedBox(width: 12),
                    AnimatedContainer(
                      duration: const Duration(milliseconds: 300),
                      curve: Curves.easeInOut,
                      padding: const EdgeInsets.all(6),
                      decoration: BoxDecoration(
                        color: isExpanded
                            ? AppColors.primaryLight
                            : AppColors.white,
                        shape: BoxShape.circle,
                      ),
                      // حركة تدوير ناعمة للسهم
                      child: AnimatedRotation(
                        turns: isExpanded ? 0.5 : 0.0, // تدوير 180 درجة
                        duration: const Duration(milliseconds: 300),
                        curve: Curves.easeInOutCubic,
                        child: Icon(
                          Icons.keyboard_arrow_down_rounded,
                          color: isExpanded
                              ? AppColors.primary
                              : AppColors.iconGrey,
                          size: 22,
                        ),
                      ),
                    ),
                  ],
                ),

                // انيميشن ناعم جداً لظهور واختفاء الإجابة (Smooth Expansion)
                AnimatedCrossFade(
                  firstChild: const SizedBox(width: double.infinity),
                  secondChild: Padding(
                    padding: const EdgeInsets.only(top: 14),
                    child: Text(
                      widget.faq.answer,
                      style: const TextStyle(
                        fontSize: 14,
                        color: AppColors.textGrey,
                        height: 1.6,
                      ),
                    ),
                  ),
                  crossFadeState: isExpanded
                      ? CrossFadeState.showSecond
                      : CrossFadeState.showFirst,
                  duration: const Duration(milliseconds: 300),
                  sizeCurve: Curves.easeInOutCubic,
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
