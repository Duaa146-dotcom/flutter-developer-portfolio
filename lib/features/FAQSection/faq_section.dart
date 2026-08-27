import 'package:flutter/material.dart';
import '../../core/utils/responsive.dart';
import 'widgets/faq_desktop.dart';
import 'widgets/faq_mobile.dart';
import 'widgets/faq_tablet.dart';

class FaqSection extends StatelessWidget {
  const FaqSection({super.key});

  @override
  Widget build(BuildContext context) {
    if (Responsive.isDesktop(context)) {
      return const FaqDesktop();
    }

    if (Responsive.isTablet(context)) {
      return const FaqTablet();
    }

    return const FaqMobile();
  }
}
