import 'package:flutter/material.dart';
import 'package:url_launcher/url_launcher.dart';

import '../../../../../core/theme/app_colors.dart';

class NavbarDesktop extends StatelessWidget {
  final Map<String, GlobalKey>? sectionKeys;

  const NavbarDesktop({super.key, this.sectionKeys});

  // دالة التمرير للسكشن
  void _scrollToSection(String title) {
    final key = sectionKeys?[title];
    if (key?.currentContext != null) {
      Scrollable.ensureVisible(
        key!.currentContext!,
        duration: const Duration(milliseconds: 600),
        curve: Curves.easeInOut,
      );
    }
  }

  // دالة فتح الواتساب
  Future<void> _launchWhatsApp() async {
    final Uri whatsappUri = Uri.parse('https://wa.me/967776269380');
    if (!await launchUrl(whatsappUri, mode: LaunchMode.externalApplication)) {
      debugPrint('Could not launch $whatsappUri');
    }
  }

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 60, vertical: 15),
      child: Row(
        children: [
          // Logo
          const Row(
            children: [
              Icon(Icons.code_rounded, color: AppColors.primary, size: 30),
              SizedBox(width: 8),
              Text(
                'devstudio',
                style: TextStyle(
                  fontSize: 24,
                  fontWeight: FontWeight.w600,
                  color: AppColors.text,
                  letterSpacing: -0.5,
                ),
              ),
            ],
          ),

          const Spacer(),

          // Links
          Row(
            children: [
              _NavItem(
                title: 'تواصل معنا',
                onTap: () => _scrollToSection('تواصل معنا'),
              ),
              _NavItem(
                title: 'الأسئلة الشائعة',
                onTap: () => _scrollToSection('الأسئلة الشائعة'),
              ),
              _NavItem(
                title: 'خطوات العمل',
                onTap: () => _scrollToSection('خطوات العمل'),
              ),
              _NavItem(
                title: 'المشاريع',
                onTap: () => _scrollToSection('المشاريع'),
              ),
              _NavItem(
                title: 'الخدمات',
                onTap: () => _scrollToSection('الخدمات'),
              ),
              _NavItem(
                title: 'الرئيسية',
                onTap: () => _scrollToSection('الرئيسية'),
              ),
            ],
          ),

          const SizedBox(width: 40),
          const SizedBox(width: 16),

          ElevatedButton(
            onPressed: _launchWhatsApp,
            style: ElevatedButton.styleFrom(
              backgroundColor: AppColors.primaryLight,
              elevation: 0,
              padding: const EdgeInsets.symmetric(horizontal: 22, vertical: 16),
              shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(20),
              ),
            ),
            child: const Text(
              'ابدأ مشروعك',
              style: TextStyle(
                color: AppColors.primary,
                fontWeight: FontWeight.bold,
              ),
            ),
          ),
        ],
      ),
    );
  }
}

// ============================================
// عنصر القائمة مع تأثير הـ Hover
// ============================================

class _NavItem extends StatefulWidget {
  final String title;
  final VoidCallback onTap;

  const _NavItem({required this.title, required this.onTap});

  @override
  State<_NavItem> createState() => _NavItemState();
}

class _NavItemState extends State<_NavItem> {
  bool isHovered = false;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 16),
      child: MouseRegion(
        cursor: SystemMouseCursors.click,
        onEnter: (_) => setState(() => isHovered = true),
        onExit: (_) => setState(() => isHovered = false),
        child: GestureDetector(
          onTap: widget.onTap,
          child: AnimatedDefaultTextStyle(
            duration: const Duration(milliseconds: 200),
            style: TextStyle(
              color: isHovered ? AppColors.primary : AppColors.text,
              fontSize: 15,
              fontWeight: isHovered ? FontWeight.bold : FontWeight.w400,
            ),
            child: Text(widget.title),
          ),
        ),
      ),
    );
  }
}
