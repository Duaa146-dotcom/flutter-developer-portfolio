import 'package:flutter/material.dart';

class ServiceItem {
  final IconData icon;
  final String title;
  final String description;

  const ServiceItem({
    required this.icon,
    required this.title,
    required this.description,
  });
}

// قائمة الخدمات المقدمة
final List<ServiceItem> appServices = [
  const ServiceItem(
    icon: Icons.phone_android_rounded,
    title: 'Flutter Mobile Apps',
    description:
        'تطوير تطبيقات Android و iOS باستخدام Flutter مع تصميم حديث وأداء سريع.',
  ),
  const ServiceItem(
    icon: Icons.language_rounded,
    title: 'Flutter Web Development',
    description:
        'إنشاء مواقع ولوحات تحكم باستخدام Flutter Web تعمل على جميع أحجام الشاشات.',
  ),
  const ServiceItem(
    icon: Icons.space_dashboard_rounded,
    title: 'Admin Dashboards',
    description:
        'تطوير لوحات تحكم لإدارة الأنظمة والبيانات والإحصائيات وتسهيل إدارة البيانات.',
  ),
  const ServiceItem(
    icon: Icons.palette_rounded,
    title: 'Responsive UI Implementation',
    description:
        'تحويل تصميمات Figma أو Adobe XD إلى تطبيقات Flutter مطابقة للتصميم مع Animations و Responsive.',
  ),
  const ServiceItem(
    icon: Icons.api_rounded,
    title: 'REST API Integration',
    description:
        'ربط التطبيقات مع قواعد البيانات وواجهات REST API باستخدام PHP أو أي Backend آخر.',
  ),
  const ServiceItem(
    icon: Icons.settings_suggest_rounded,
    title: 'Custom Business Systems',
    description:
        'تطوير أنظمة مخصصة للشركات أو الجامعات أو المؤسسات حسب احتياج العميل.',
  ),
];
