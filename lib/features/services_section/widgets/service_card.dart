import 'package:flutter/material.dart';
import 'package:portfolio/core/theme/app_colors.dart';
import 'package:visibility_detector/visibility_detector.dart';
import '../models/service_item.dart';

class ServiceCard extends StatefulWidget {
  final ServiceItem service;
  final int index;

  const ServiceCard({super.key, required this.service, this.index = 0});

  @override
  State<ServiceCard> createState() => _ServiceCardState();
}

class _ServiceCardState extends State<ServiceCard>
    with SingleTickerProviderStateMixin {
  late AnimationController _controller;
  late Animation<double> _fadeAnimation;
  late Animation<Offset> _slideAnimation;

  bool isHovered = false;
  bool _hasAnimated = false; // لمنع إعادة الحركة بعد أول ظهور

  @override
  void initState() {
    super.initState();
    // سرعة انيميشن الظهور (600ms)
    _controller = AnimationController(
      vsync: this,
      duration: const Duration(milliseconds: 600),
    );

    _fadeAnimation = Tween<double>(
      begin: 0.0,
      end: 1.0,
    ).animate(CurvedAnimation(parent: _controller, curve: Curves.easeOut));

    _slideAnimation = Tween<Offset>(
      begin: const Offset(0, 0.15), // مسافة ارتفاع خفيفة عند الظهور
      end: Offset.zero,
    ).animate(CurvedAnimation(parent: _controller, curve: Curves.easeOutCubic));
  }

  @override
  void dispose() {
    _controller.dispose();
    super.dispose();
  }

  void _onVisibilityChanged(VisibilityInfo info) {
    // ⚡ يبدأ الأنيميشن فور رؤية 5% فقط من الكرت
    if (info.visibleFraction > 0.05 && !_hasAnimated) {
      _hasAnimated = true;

      // ⚡ فارق زمني سريع جداً (50ms) بين كل كرت والآخر لتجنب أي تأخير ملحوظ
      Future.delayed(Duration(milliseconds: widget.index * 50), () {
        if (mounted) {
          _controller.forward();
        }
      });
    }
  }

  @override
  Widget build(BuildContext context) {
    return VisibilityDetector(
      key: Key('service-card-${widget.service.title}-${widget.index}'),
      onVisibilityChanged: _onVisibilityChanged,
      child: FadeTransition(
        opacity: _fadeAnimation,
        child: SlideTransition(
          position: _slideAnimation,
          child: Directionality(
            textDirection: TextDirection.rtl,
            child: MouseRegion(
              onEnter: (_) => setState(() => isHovered = true),
              onExit: (_) => setState(() => isHovered = false),
              child: AnimatedContainer(
                duration: const Duration(milliseconds: 200),
                curve: Curves.easeInOut,
                transform: Matrix4.translationValues(0, isHovered ? -6 : 0, 0),
                child: Stack(
                  clipBehavior: Clip.none,
                  alignment: Alignment.topCenter,
                  children: [
                    // جسم الكرت الرئيسي
                    Container(
                      width: double.infinity,
                      margin: const EdgeInsets.only(top: 26),
                      padding: const EdgeInsets.fromLTRB(20, 40, 20, 24),
                      decoration: BoxDecoration(
                        color: AppColors.white,
                        borderRadius: BorderRadius.circular(20),
                        border: Border.all(
                          color: isHovered
                              ? AppColors.primary.withOpacity(0.3)
                              : AppColors.border,
                          width: 1.5,
                        ),
                        boxShadow: [
                          BoxShadow(
                            color: isHovered
                                ? AppColors.primary.withOpacity(0.12)
                                : Colors.black.withOpacity(0.04),
                            blurRadius: isHovered ? 24 : 12,
                            offset: Offset(0, isHovered ? 10 : 4),
                          ),
                        ],
                      ),
                      child: Column(
                        mainAxisSize: MainAxisSize.min,
                        crossAxisAlignment: CrossAxisAlignment.center,
                        children: [
                          Text(
                            widget.service.title,
                            textAlign: TextAlign.center,
                            style: const TextStyle(
                              fontSize: 18,
                              fontWeight: FontWeight.bold,
                              color: AppColors.text,
                              height: 1.3,
                            ),
                          ),
                          const SizedBox(height: 12),
                          Text(
                            widget.service.description,
                            textAlign: TextAlign.center,
                            style: const TextStyle(
                              fontSize: 14,
                              color: AppColors.textLight,
                              height: 1.6,
                            ),
                          ),
                        ],
                      ),
                    ),

                    // الأيقونة العلوية البارزة
                    Positioned(
                      top: 0,
                      child: AnimatedContainer(
                        duration: const Duration(milliseconds: 200),
                        padding: const EdgeInsets.all(12),
                        decoration: BoxDecoration(
                          color: isHovered
                              ? AppColors.primaryLight
                              : AppColors.white,
                          borderRadius: const BorderRadius.vertical(
                            top: Radius.circular(16),
                            bottom: Radius.circular(20),
                          ),
                          border: Border.all(
                            color: isHovered
                                ? AppColors.primary.withOpacity(0.4)
                                : AppColors.border,
                            width: 1.5,
                          ),
                          boxShadow: [
                            BoxShadow(
                              color: Colors.black.withOpacity(0.06),
                              blurRadius: 10,
                              offset: const Offset(0, 4),
                            ),
                          ],
                        ),
                        child: Icon(
                          widget.service.icon,
                          size: 26,
                          color: AppColors.primary,
                        ),
                      ),
                    ),
                  ],
                ),
              ),
            ),
          ),
        ),
      ),
    );
  }
}
