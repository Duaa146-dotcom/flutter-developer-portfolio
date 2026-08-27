import 'package:flutter/material.dart';
import '../../core/utils/responsive.dart';
import 'widgets/services_desktop.dart';
import 'widgets/services_mobile.dart';
import 'widgets/services_tablet.dart';

class ServicesSection extends StatelessWidget {
  const ServicesSection({super.key});

  @override
  Widget build(BuildContext context) {
    if (Responsive.isDesktop(context)) {
      return const ServicesDesktop();
    }

    if (Responsive.isTablet(context)) {
      return const ServicesTablet();
    }

    return const ServicesMobile();
  }
}
