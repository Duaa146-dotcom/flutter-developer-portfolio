import 'package:flutter/material.dart';
import 'package:portfolio/core/theme/app_colors.dart';
import 'package:portfolio/core/widgets/section_title.dart';
import '../models/project_item.dart';
import 'project_card.dart';

class ProjectsTablet extends StatefulWidget {
  const ProjectsTablet({super.key});

  @override
  State<ProjectsTablet> createState() => _ProjectsTabletState();
}

class _ProjectsTabletState extends State<ProjectsTablet> {
  late final PageController _pageController;
  int _currentIndex = 1;
  @override
  void initState() {
    super.initState();

    _pageController = PageController(initialPage: 1, viewportFraction: 0.55);
  }

  @override
  void dispose() {
    _pageController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      width: double.infinity,
      color: AppColors.background,
      padding: const EdgeInsets.symmetric(vertical: 60),
      child: Column(
        children: [
          const SectionTitle(
            title: 'مشاريعي',
            subTitle: 'استعرض أحدث الأعمال والتطبيقات التي قمت بتطويرها',
          ),
          const SizedBox(height: 35),
          SizedBox(
            height: 470,
            child: PageView.builder(
              controller: _pageController,
              itemCount: appProjects.length,
              onPageChanged: (index) => setState(() => _currentIndex = index),
              itemBuilder: (context, index) {
                return Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 10),
                  child: ProjectCard(project: appProjects[index]),
                );
              },
            ),
          ),
          const SizedBox(height: 16),
          Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: List.generate(
              appProjects.length,
              (index) => AnimatedContainer(
                duration: const Duration(milliseconds: 250),
                margin: const EdgeInsets.symmetric(horizontal: 4),
                width: _currentIndex == index ? 22 : 8,
                height: 8,
                decoration: BoxDecoration(
                  color: _currentIndex == index
                      ? AppColors.primary
                      : AppColors.border,
                  borderRadius: BorderRadius.circular(4),
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }
}
