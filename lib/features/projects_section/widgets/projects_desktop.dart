import 'package:flutter/material.dart';
import 'package:portfolio/core/theme/app_colors.dart';
import 'package:portfolio/core/widgets/section_title.dart';
import '../models/project_item.dart';
import 'project_card.dart';

class ProjectsDesktop extends StatefulWidget {
  const ProjectsDesktop({super.key});

  @override
  State<ProjectsDesktop> createState() => _ProjectsDesktopState();
}

class _ProjectsDesktopState extends State<ProjectsDesktop> {
  late final PageController _pageController;
  int _currentIndex = 1;
  @override
  void initState() {
    super.initState();

    _pageController = PageController(initialPage: 1, viewportFraction: 0.33);
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
      padding: const EdgeInsets.symmetric(vertical: 80),
      child: Column(
        children: [
          const SectionTitle(
            title: 'مشاريعي',
            subTitle: 'استعرض أحدث الأعمال والتطبيقات التي قمت بتطويرها',
          ),
          const SizedBox(height: 40),

          // السلايدر وأسهم التحكم
          Stack(
            alignment: Alignment.center,
            children: [
              SizedBox(
                height: 470,
                child: PageView.builder(
                  controller: _pageController,
                  itemCount: appProjects.length,
                  onPageChanged: (index) =>
                      setState(() => _currentIndex = index),
                  itemBuilder: (context, index) {
                    return Padding(
                      padding: const EdgeInsets.symmetric(horizontal: 12),
                      child: ProjectCard(project: appProjects[index]),
                    );
                  },
                ),
              ),

              // سهم اليسار
              Positioned(
                left: 30,
                top: 160,
                child: CircleAvatar(
                  backgroundColor: AppColors.white,
                  child: IconButton(
                    icon: const Icon(
                      Icons.arrow_back_ios_rounded,
                      size: 18,
                      color: AppColors.text,
                    ),
                    onPressed: () {
                      _pageController.previousPage(
                        duration: const Duration(milliseconds: 300),
                        curve: Curves.easeInOut,
                      );
                    },
                  ),
                ),
              ),

              // سهم اليمين
              Positioned(
                right: 30,
                top: 160,
                child: CircleAvatar(
                  backgroundColor: AppColors.white,
                  child: IconButton(
                    icon: const Icon(
                      Icons.arrow_forward_ios_rounded,
                      size: 18,
                      color: AppColors.text,
                    ),
                    onPressed: () {
                      _pageController.nextPage(
                        duration: const Duration(milliseconds: 300),
                        curve: Curves.easeInOut,
                      );
                    },
                  ),
                ),
              ),
            ],
          ),

          // const SizedBox(height: 20),

          // مؤشرات السلايدر السفلية (Dots)
          Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: List.generate(
              appProjects.length,
              (index) => AnimatedContainer(
                duration: const Duration(milliseconds: 250),
                margin: const EdgeInsets.symmetric(horizontal: 4),
                width: _currentIndex == index ? 24 : 8,
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
