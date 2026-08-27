import 'package:flutter/material.dart';
import 'package:portfolio/features/FAQSection/faq_section.dart';
import 'package:portfolio/features/footer_section/footer_section.dart';
import 'package:portfolio/features/hero_section/hero_section.dart';
import 'package:portfolio/features/home/widgets/navbar.dart';
import 'package:portfolio/features/process_section/process_section.dart';
import 'package:portfolio/features/projects_section/projects_section.dart';
import 'package:portfolio/features/services_section/services_section.dart';

import '../../core/utils/responsive.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  // مفاتيح الأقسام لتحديد مواقعها عند التمرير
  final Map<String, GlobalKey> _sectionKeys = {
    'الرئيسية': GlobalKey(),
    'الخدمات': GlobalKey(),
    'المشاريع': GlobalKey(),
    'خطوات العمل': GlobalKey(),
    'الأسئلة الشائعة': GlobalKey(),
    'تواصل معنا': GlobalKey(),
  };

  @override
  Widget build(BuildContext context) {
    final bool isDesktop = Responsive.isDesktop(context);

    return Scaffold(
      body: SafeArea(
        child: isDesktop
            ? Stack(
                children: [
                  // المحتوى القابل للتمرير لسطح المكتب
                  SingleChildScrollView(
                    padding: const EdgeInsets.only(top: 80),
                    child: _buildMainContent(),
                  ),

                  // Navbar ثابت في الأعلى لسطح المكتب فقط
                  Positioned(
                    top: 0,
                    left: 0,
                    right: 0,
                    child: Container(
                      color: Theme.of(context).scaffoldBackgroundColor,
                      child: CustomNavbar(sectionKeys: _sectionKeys),
                    ),
                  ),
                ],
              )
            // شاشات الموبايل والتابلت: Navbar ينزل ويختفي مع السكرول طبيعي
            : SingleChildScrollView(
                child: Column(
                  children: [
                    CustomNavbar(sectionKeys: _sectionKeys),
                    _buildMainContent(),
                  ],
                ),
              ),
      ),
    );
  }

  // ودجت تجميع السكاشن لتجنب تكرار الكود
  Widget _buildMainContent() {
    return Column(
      children: [
        Container(
          key: _sectionKeys['الرئيسية'],
          child: HeroSection(projectsKey: _sectionKeys['المشاريع']),
        ),
        Container(key: _sectionKeys['الخدمات'], child: const ServicesSection()),

        Container(
          key: _sectionKeys['المشاريع'],
          child: const ProjectsSection(),
        ),

        Container(
          key: _sectionKeys['خطوات العمل'],
          child: const ProcessSection(),
        ),

        Container(
          key: _sectionKeys['الأسئلة الشائعة'],
          child: const FaqSection(),
        ),

        Container(
          key: _sectionKeys['تواصل معنا'],
          child: FooterSection(sectionKeys: _sectionKeys),
        ),
      ],
    );
  }
}
