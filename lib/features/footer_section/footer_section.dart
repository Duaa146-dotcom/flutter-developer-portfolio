import 'package:flutter/material.dart';
import '../../core/utils/responsive.dart';
import 'widgets/footer_desktop.dart';
import 'widgets/footer_mobile.dart';
import 'widgets/footer_tablet.dart';

class FooterSection extends StatelessWidget {
  final Map<String, GlobalKey>? sectionKeys;

  const FooterSection({super.key, this.sectionKeys});

  @override
  Widget build(BuildContext context) {
    if (Responsive.isDesktop(context)) {
      return FooterDesktop(sectionKeys: sectionKeys);
    }

    if (Responsive.isTablet(context)) {
      return FooterTablet(sectionKeys: sectionKeys);
    }

    return FooterMobile(sectionKeys: sectionKeys);
  }
}
