import 'package:flutter/material.dart';
import '../../core/utils/responsive.dart';
import 'widgets/process_desktop.dart';
import 'widgets/process_mobile.dart';
import 'widgets/process_tablet.dart';

class ProcessSection extends StatelessWidget {
  const ProcessSection({super.key});

  @override
  Widget build(BuildContext context) {
    if (Responsive.isDesktop(context)) {
      return const ProcessDesktop();
    }

    if (Responsive.isTablet(context)) {
      return const ProcessTablet();
    }

    return const ProcessMobile();
  }
}
