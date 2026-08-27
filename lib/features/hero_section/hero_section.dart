import 'package:flutter/material.dart';
import 'package:portfolio/features/hero_section/widgets/hero_tablet.dart';

import '../../core/utils/responsive.dart';
import 'widgets/hero_desktop.dart';
import 'widgets/hero_mobile.dart';

class HeroSection extends StatelessWidget {
  final GlobalKey? projectsKey;

  const HeroSection({super.key, this.projectsKey});

  @override
  Widget build(BuildContext context) {
    if (Responsive.isDesktop(context)) {
      return HeroDesktop(projectsKey: projectsKey);
    }

    if (Responsive.isTablet(context)) {
      return HeroTablet(projectsKey: projectsKey);
    }

    return HeroMobile(projectsKey: projectsKey);
  }
}
