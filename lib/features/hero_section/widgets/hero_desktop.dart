import 'package:flutter/material.dart';
import 'package:url_launcher/url_launcher.dart';

import '../../../core/theme/app_colors.dart';
import 'background_clipper.dart';

class HeroDesktop extends StatelessWidget {
  final GlobalKey? projectsKey;

  const HeroDesktop({super.key, this.projectsKey});

  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.of(context).size;
    final heroHeight = size.height - 100 > 600 ? size.height - 100 : 600.0;

    return Directionality(
      textDirection: TextDirection.rtl,
      child: SizedBox(
        height: heroHeight,
        child: Stack(
          children: [
            // الخلفية المنحنية
            Positioned(
              left: 0,
              top: 0,
              bottom: 0,
              width: size.width * 0.65,
              child: ClipPath(
                clipper: BackgroundOrganicClipper(isDesktop: true),
                child: Container(color: AppColors.surface),
              ),
            ),

            // المحتوى
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 60),
              child: Row(
                children: [
                  Expanded(
                    flex: 5,
                    child: HeroContent(projectsKey: projectsKey),
                  ),
                  const Expanded(flex: 7, child: HeroImage()),
                ],
              ),
            ),

            // مؤشر النزول
            const Positioned(
              bottom: 25,
              left: 0,
              right: 0,
              child: ScrollIndicator(),
            ),
          ],
        ),
      ),
    );
  }
}

// =========================
// النص والأزرار
// =========================

class HeroContent extends StatelessWidget {
  final GlobalKey? projectsKey;

  const HeroContent({super.key, this.projectsKey});

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
      mainAxisAlignment: MainAxisAlignment.center,
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        const Text(
          'كل فكرة تستحق ، \nتطبيقاً احترافياً',
          textAlign: TextAlign.right,
          style: TextStyle(
            fontSize: 56,
            fontWeight: FontWeight.w700,
            height: 1.5,
            color: AppColors.text,
            letterSpacing: -1,
          ),
        ),

        const SizedBox(height: 30),

        const Text(
          'من الفكرة إلى الإطلاق...\n'
          ' نساعدك على بناء تطبيقات ومواقع حديثة \n تدعم نمو أعمالك وتمنح مستخدميك أفضل تجربة.',
          textAlign: TextAlign.right,
          style: TextStyle(
            fontSize: 16,
            height: 1.5,
            color: AppColors.textGrey,
          ),
        ),

        const SizedBox(height: 20),

        const Icon(Icons.grid_view_rounded, size: 20, color: Colors.black45),

        const SizedBox(height: 30),

        Row(
          mainAxisAlignment: MainAxisAlignment.start,
          children: [
            // زر الواتساب
            ElevatedButton(
              onPressed: _launchWhatsApp,
              style: ElevatedButton.styleFrom(
                backgroundColor: AppColors.primary,
                elevation: 0,
                padding: const EdgeInsets.symmetric(
                  horizontal: 26,
                  vertical: 18,
                ),
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(30),
                ),
              ),
              child: Text(
                'ابدأ مشروعك',
                style: TextStyle(
                  color: Colors.white,
                  fontWeight: FontWeight.bold,
                ),
              ),
            ),

            const SizedBox(width: 14),

            // زر التنقل إلى قسم المشاريع
            OutlinedButton(
              onPressed: _scrollToProjects,
              style: OutlinedButton.styleFrom(
                padding: const EdgeInsets.symmetric(
                  horizontal: 26,
                  vertical: 18,
                ),
                side: const BorderSide(color: Colors.black87),
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(30),
                ),
              ),
              child: const Text(
                'استعرض أعمالنا',
                style: TextStyle(
                  color: Colors.black87,
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

// =========================
// صورة المشروع
// =========================

class HeroImage extends StatelessWidget {
  const HeroImage({super.key});

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: double.infinity,
      height: double.infinity,
      child: Image.asset(
        'assets/images/canva.png',
        fit: BoxFit.cover,
        errorBuilder: (context, error, stackTrace) {
          return const SizedBox();
        },
      ),
    );
  }
}

// =========================
// Scroll Indicator
// =========================

class ScrollIndicator extends StatelessWidget {
  const ScrollIndicator({super.key});

  @override
  Widget build(BuildContext context) {
    return const Column(
      mainAxisSize: MainAxisSize.min,
      children: [
        Icon(Icons.mouse_outlined, size: 22, color: Colors.black54),
        SizedBox(height: 6),
        Text(
          'مرر للأسفل لمشاهدة المميزات',
          style: TextStyle(
            fontSize: 12,
            fontWeight: FontWeight.bold,
            color: Colors.black54,
          ),
        ),
      ],
    );
  }
}
