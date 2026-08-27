import 'package:flutter/material.dart';
import 'package:portfolio/core/theme/app_colors.dart';
import 'package:portfolio/core/utils/responsive.dart';
import '../models/project_item.dart';

class ProjectCard extends StatefulWidget {
  final ProjectItem project;

  const ProjectCard({super.key, required this.project});

  @override
  State<ProjectCard> createState() => _ProjectCardState();
}

class _ProjectCardState extends State<ProjectCard> {
  bool isHovered = false;

  @override
  Widget build(BuildContext context) {
    return MouseRegion(
      onEnter: (_) => setState(() => isHovered = true),
      onExit: (_) => setState(() => isHovered = false),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        mainAxisSize: MainAxisSize.min,
        children: [
          // إضافة مساحة علوية شفافة (Margin) تتأثر بالهوفر لتمنع قص الكارد من الأعلى
          AnimatedPadding(
            duration: const Duration(milliseconds: 200),
            curve: Curves.easeInOut,
            padding: EdgeInsets.only(
              top: isHovered ? 0 : 8, // يتحرك للأعلى بمرونة داخل مساحته الخاصة
              bottom: isHovered ? 8 : 0,
            ),
            child: AnimatedContainer(
              duration: const Duration(milliseconds: 200),
              curve: Curves.easeInOut,
              decoration: BoxDecoration(
                color: isHovered ? AppColors.primary : const Color(0xFF2A2A2A),
                borderRadius: BorderRadius.circular(28),
                boxShadow: isHovered
                    ? [
                        BoxShadow(
                          color: AppColors.primary.withOpacity(0.25),
                          blurRadius: 16,
                          offset: const Offset(0, 8),
                        ),
                      ]
                    : [],
              ),
              child: Padding(
                padding: const EdgeInsets.all(6),
                child: Stack(
                  alignment: Alignment.bottomRight,
                  children: [
                    // 1. صورة المشروع بزوايا دائرية
                    ClipRRect(
                      borderRadius: BorderRadius.circular(24),
                      child: SizedBox(
                        height: 290,
                        width: double.infinity,
                        child: Image.asset(
                          widget.project.imagePath,
                          fit: BoxFit.cover,
                          errorBuilder: (context, error, stackTrace) {
                            return Container(
                              color: const Color(0xFF1E1E1E),
                              child: const Center(
                                child: Icon(
                                  Icons.image_not_supported_rounded,
                                  size: 40,
                                  color: Colors.white38,
                                ),
                              ),
                            );
                          },
                        ),
                      ),
                    ),

                    // 2. التقنيات المعروضة في أعلى الصورة بشارات زجاجية أنيقة (Chips Overlay)
                    Positioned(
                      top: 14,
                      right: 14,
                      left: 14,
                      child: Wrap(
                        spacing: 8,
                        runSpacing: 8,
                        children: widget.project.technologies.map((tech) {
                          return Container(
                            padding: const EdgeInsets.symmetric(
                              horizontal: 14,
                              vertical: 6,
                            ),
                            decoration: BoxDecoration(
                              color: Colors.black.withOpacity(0.55),
                              borderRadius: BorderRadius.circular(30),
                              border: Border.all(
                                color: Colors.white.withOpacity(0.2),
                                width: 1,
                              ),
                            ),
                            child: Text(
                              tech,
                              style: const TextStyle(
                                fontSize: 12.5,
                                fontWeight: FontWeight.w600,
                                color: Colors.white,
                                letterSpacing: 0.3,
                              ),
                            ),
                          );
                        }).toList(),
                      ),
                    ),

                    // 3. الزاوية المنحنية مع زر السهم التفاعلي (Floating Button Cutout)
                    Positioned(
                      bottom: 0,
                      right: 0,
                      child: Container(
                        padding: const EdgeInsets.all(8),
                        decoration: const BoxDecoration(
                          borderRadius: BorderRadius.only(
                            topLeft: Radius.circular(28),
                          ),
                        ),
                        child: AnimatedContainer(
                          duration: const Duration(milliseconds: 200),
                          width: 52,
                          height: 52,
                          decoration: BoxDecoration(
                            color: Responsive.isMobile(context)
                                ? AppColors.primary
                                : isHovered
                                ? AppColors.primary
                                : const Color(0xFF333333),
                            shape: BoxShape.circle,
                          ),
                          child: const Icon(
                            Icons.north_east_rounded,
                            color: Colors.white,
                            size: 24,
                          ),
                        ),
                      ),
                    ),
                  ],
                ),
              ),
            ),
          ),

          const SizedBox(height: 10),

          // 4. اسم المشروع السفلي
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 8),
            child: Text(
              widget.project.title,
              maxLines: 1,
              overflow: TextOverflow.ellipsis,
              style: const TextStyle(
                fontSize: 20,
                fontWeight: FontWeight.bold,
                color: AppColors.text,
              ),
            ),
          ),
        ],
      ),
    );
  }
}
