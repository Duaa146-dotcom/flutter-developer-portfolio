import 'package:flutter/material.dart';
import 'package:url_launcher/url_launcher.dart';

import '../../../core/theme/app_colors.dart';
import 'background_clipper.dart';

class HeroTablet extends StatelessWidget {
  final GlobalKey? projectsKey;

  const HeroTablet({super.key, this.projectsKey});

  @override
  Widget build(BuildContext context) {
    return Directionality(
      textDirection: TextDirection.rtl,
      child: SizedBox(
        child: Stack(
          children: [
            // الخلفية المنحنية
            Positioned(
              top: 0,
              left: 0,
              right: 0,
              child: ClipPath(
                clipper: BackgroundOrganicClipper(isDesktop: false),
                child: Container(height: 520, color: AppColors.surface),
              ),
            ),

            // المحتوى الرئيسي ممركز كالموبايل
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 24, vertical: 50),
              child: HeroTabletContent(projectsKey: projectsKey),
            ),
          ],
        ),
      ),
    );
  }
}

// =============================
// محتوى النص (ممركز بدون صورة)
// =============================

class HeroTabletContent extends StatelessWidget {
  final GlobalKey? projectsKey;

  const HeroTabletContent({super.key, this.projectsKey});

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
            height: 1.3,
            color: AppColors.text,
            letterSpacing: -1,
          ),
        ),

        const SizedBox(height: 25),

        const SizedBox(
          width: double.infinity,
          child: Text(
            'من الفكرة إلى الإطلاق...\n'
            'نساعدك على بناء تطبيقات ومواقع حديثة \n'
            'تدعم نمو أعمالك وتمنح مستخدميك أفضل تجربة.',
            textAlign: TextAlign.center,
            style: TextStyle(
              fontSize: 18,
              height: 1.6,
              color: AppColors.textGrey,
            ),
          ),
        ),

        const SizedBox(height: 35),

        // الأزرار ممركزة جنبًا إلى جنب بتناسق
        Wrap(
          alignment: WrapAlignment.center,
          spacing: 16,
          runSpacing: 14,
          children: [
            ElevatedButton(
              onPressed: _launchWhatsApp,
              style: ElevatedButton.styleFrom(
                backgroundColor: AppColors.primary,
                elevation: 0,
                minimumSize: const Size(220, 52),
                padding: const EdgeInsets.symmetric(
                  horizontal: 28,
                  vertical: 16,
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
                  fontSize: 16,
                ),
              ),
            ),

            OutlinedButton(
              onPressed: _scrollToProjects,
              style: OutlinedButton.styleFrom(
                minimumSize: const Size(220, 52),
                padding: const EdgeInsets.symmetric(
                  horizontal: 28,
                  vertical: 16,
                ),
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(30),
                ),
              ),
              child: const Text(
                'استعرض أعمالنا',
                style: TextStyle(
                  color: AppColors.text,
                  fontWeight: FontWeight.bold,
                  fontSize: 16,
                ),
              ),
            ),
          ],
        ),
      ],
    );
  }
}
