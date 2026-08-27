import 'package:flutter/material.dart';
import 'package:portfolio/core/utils/responsive.dart';
import 'package:portfolio/features/projects_section/widgets/projects_desktop.dart';
import 'package:portfolio/features/projects_section/widgets/projects_mobile.dart';
import 'package:portfolio/features/projects_section/widgets/projects_tablet.dart';

class ProjectsSection extends StatelessWidget {
  const ProjectsSection({super.key});

  @override
  Widget build(BuildContext context) {
    if (Responsive.isDesktop(context)) {
      return const ProjectsDesktop();
    }

    if (Responsive.isTablet(context)) {
      return const ProjectsTablet();
    }

    return const ProjectsMobile();
  }
}
