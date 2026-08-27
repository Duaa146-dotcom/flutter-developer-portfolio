import 'package:flutter/material.dart';
import 'package:portfolio/core/theme/app_colors.dart';
import 'package:visibility_detector/visibility_detector.dart';
import '../models/process_step.dart';

class ProcessStepCard extends StatefulWidget {
  final ProcessStep step;
  final bool isLeft;
  final int index; // الفهرس لتحديد التتابع الزمني للظهور

  const ProcessStepCard({
    super.key,
    required this.step,
    this.isLeft = false,
    this.index = 0,
  });

  @override
  State<ProcessStepCard> createState() => _ProcessStepCardState();
}

class _ProcessStepCardState extends State<ProcessStepCard>
    with SingleTickerProviderStateMixin {
  late AnimationController _controller;
  late Animation<double> _fadeAnimation;
  late Animation<Offset> _slideAnimation;

  bool _hasAnimated = false; // تثبيت الحركة بعد الظهور الأول

  @override
  void initState() {
    super.initState();
    _controller = AnimationController(
      vsync: this,
      duration: const Duration(milliseconds: 600),
    );

    _fadeAnimation = Tween<double>(
      begin: 0.0,
      end: 1.0,
    ).animate(CurvedAnimation(parent: _controller, curve: Curves.easeOut));

    _slideAnimation = Tween<Offset>(
      begin: const Offset(0, 0.2), // يبدأ من أسفل قليلاً ويرتفع
      end: Offset.zero,
    ).animate(CurvedAnimation(parent: _controller, curve: Curves.easeOutCubic));
  }

  @override
  void dispose() {
    _controller.dispose();
    super.dispose();
  }

  void _onVisibilityChanged(VisibilityInfo info) {
    // يبدأ الأنيميشن فور دخول 5% من الكارت للشاشة
    if (info.visibleFraction > 0.05 && !_hasAnimated) {
      _hasAnimated = true;

      // فارق زمني (120ms) يضمن ظهور الخطوة الأولى ثم الثانية وهكذا
      Future.delayed(Duration(milliseconds: widget.index * 120), () {
        if (mounted) {
          _controller.forward();
        }
      });
    }
  }

  @override
  Widget build(BuildContext context) {
    return VisibilityDetector(
      key: Key('process-step-${widget.step.number}-${widget.index}'),
      onVisibilityChanged: _onVisibilityChanged,
      child: FadeTransition(
        opacity: _fadeAnimation,
        child: SlideTransition(
          position: _slideAnimation,
          child: Directionality(
            textDirection: TextDirection.rtl,
            child: Container(
              margin: const EdgeInsets.symmetric(vertical: 20),
              child: Row(
                mainAxisAlignment: widget.isLeft
                    ? MainAxisAlignment.end
                    : MainAxisAlignment.start,
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  // الأيقونة التوضيحية
                  Container(
                    padding: const EdgeInsets.all(16),
                    decoration: BoxDecoration(
                      color: AppColors.surface,
                      shape: BoxShape.circle,
                      border: Border.all(color: AppColors.border, width: 1.5),
                    ),
                    child: Icon(
                      widget.step.icon,
                      size: 36,
                      color: AppColors.primary,
                    ),
                  ),
                  const SizedBox(width: 20),

                  // المحتوى التوضيحي للخطوة
                  Expanded(
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        // رقم الخطوة + العنوان
                        Row(
                          mainAxisSize: MainAxisSize.min,
                          children: [
                            // رقم الخطوة الدائري
                            Container(
                              width: 32,
                              height: 32,
                              decoration: const BoxDecoration(
                                color: AppColors.primary,
                                shape: BoxShape.circle,
                              ),
                              child: Center(
                                child: Text(
                                  widget.step.number,
                                  style: const TextStyle(
                                    color: Colors.white,
                                    fontWeight: FontWeight.bold,
                                    fontSize: 14,
                                  ),
                                ),
                              ),
                            ),
                            const SizedBox(width: 10),

                            // العنوان
                            Flexible(
                              child: Text(
                                widget.step.title,
                                style: const TextStyle(
                                  fontSize: 20,
                                  fontWeight: FontWeight.bold,
                                  color: AppColors.text,
                                ),
                              ),
                            ),
                          ],
                        ),

                        const SizedBox(height: 8),

                        // الوصف
                        Text(
                          widget.step.description,
                          textAlign: TextAlign.right,
                          style: const TextStyle(
                            fontSize: 14,
                            color: AppColors.textLight,
                            height: 1.6,
                          ),
                        ),
                      ],
                    ),
                  ),
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }
}
