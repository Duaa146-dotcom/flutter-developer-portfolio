import 'package:flutter/material.dart';

class FooterNavLinks extends StatelessWidget {
  final Map<String, GlobalKey>? sectionKeys;

  const FooterNavLinks({super.key, this.sectionKeys});

  // دالة للتمرير السلس إلى القسم المحدد
  void _scrollToSection(GlobalKey? key) {
    if (key?.currentContext != null) {
      Scrollable.ensureVisible(
        key!.currentContext!,
        duration: const Duration(milliseconds: 600),
        curve: Curves.easeInOut,
      );
    }
  }

  @override
  Widget build(BuildContext context) {
    // قائمة أسماء الأقسام
    final navItems =
        sectionKeys?.keys.toList() ??
        ['الرئيسية', 'الخدمات', 'المشاريع', 'خطوات العمل', 'الأسئلة الشائعة'];

    return Wrap(
      spacing: 24,
      runSpacing: 12,
      children: navItems.map((item) {
        final key = sectionKeys?[item];

        return InkWell(
          onTap: () => _scrollToSection(key),
          hoverColor: Colors.transparent,
          borderRadius: BorderRadius.circular(4),
          child: Text(
            item,
            style: const TextStyle(
              fontSize: 14,
              fontWeight: FontWeight.w500,
              color: Color(0xFFE5E7EB),
            ),
          ),
        );
      }).toList(),
    );
  }
}
