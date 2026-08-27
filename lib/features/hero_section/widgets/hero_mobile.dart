import 'package:flutter/material.dart';
import 'package:url_launcher/url_launcher.dart';

import '../../../core/theme/app_colors.dart';
import 'background_clipper.dart';

class HeroMobile extends StatelessWidget {
  final GlobalKey? projectsKey;

  const HeroMobile({super.key, this.projectsKey});

  @override
  Widget build(BuildContext context) {
    return Directionality(
      textDirection: TextDirection.rtl,
      child: SizedBox(
        child: Stack(
          children: [
            // الخلفية
            Positioned(
              top: 0,
              left: 0,
              right: 0,
              child: ClipPath(
                clipper: BackgroundOrganicClipper(isDesktop: false),
                child: Container(height: 500, color: AppColors.surface),
              ),
            ),

            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 0, vertical: 40),
              child: Column(
                children: [
                  HeroMobileContent(projectsKey: projectsKey),
                  const SizedBox(height: 40),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}

// ===============================
// المحتوى
// ===============================

class HeroMobileContent extends StatelessWidget {
  final GlobalKey? projectsKey;

  const HeroMobileContent({super.key, this.projectsKey});

  // دالة فتح الواتساب
  Future<void> _launchWhatsApp() async {
    final Uri whatsappUri = Uri.parse('https://wa.me/967776269380');
    if (!await launchUrl(whatsappUri, mode: LaunchMode.externalApplication)) {
      debugPrint('Could not launch $whatsappUri');
    }
  }

  // دالة التمرير لقسم المشاريع
  void _scrollToProjects() {
    if (projectsKey?.currentContext != null) {
      Scrollable.ensureVisible(
        projectsKey!.currentContext!,
        duration: const Duration(milliseconds: 600),
        curve: Curves.easeInOut,
      );
    }
  }

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.center,
      children: [
        const Text(
          'كل فكرة تستحق \nتطبيقاً احترافياً',
          textAlign: TextAlign.center,
          style: TextStyle(
            fontSize: 56,
            fontWeight: FontWeight.w700,
            height: 1.5,
            color: AppColors.text,
            letterSpacing: -1,
          ),
        ),

        const SizedBox(height: 25),

        const SizedBox(
          width: double.infinity,
          child: Text(
            'من الفكرة إلى الإطلاق...\n'
            ' نساعدك على بناء تطبيقات ومواقع حديثة \n تدعم نمو أعمالك وتمنح مستخدميك أفضل تجربة.',
            textAlign: TextAlign.center,
            style: TextStyle(
              fontSize: 16,
              height: 1.5,
              color: AppColors.textGrey,
            ),
          ),
        ),

        const SizedBox(height: 30),

        Column(
          children: [
            // زر ابدأ مشروعك (واتساب)
            ElevatedButton(
              onPressed: _launchWhatsApp,
              style: ElevatedButton.styleFrom(
                backgroundColor: AppColors.primary,
                elevation: 0,
                minimumSize: const Size(330, 50),
                padding: const EdgeInsets.symmetric(
                  horizontal: 26,
                  vertical: 17,
                ),
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(30),
                ),
              ),
              child: const Text(
                'ابدأ مشروعك',
                style: TextStyle(
                  color: Colors.white,
                  fontWeight: FontWeight.bold,
                ),
              ),
            ),

            const SizedBox(height: 14),

            // زر استعرض أعمالنا (التمرير للمشاريع)
            OutlinedButton(
              onPressed: _scrollToProjects,
              style: OutlinedButton.styleFrom(
                padding: const EdgeInsets.symmetric(
                  horizontal: 26,
                  vertical: 17,
                ),
                minimumSize: const Size(330, 50),
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(30),
                ),
              ),
              child: const Text(
                'استعرض أعمالنا',
                style: TextStyle(
                  color: AppColors.text,
                  fontWeight: FontWeight.bold,
                ),
              ),
            ),
          ],
        ),
      ],
    );
  }
}
