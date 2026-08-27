import 'package:flutter/material.dart';

class ProcessStep {
  final String number;
  final String title;
  final String description;
  final IconData icon;

  const ProcessStep({
    required this.number,
    required this.title,
    required this.description,
    required this.icon,
  });
}

final List<ProcessStep> processSteps = [
  const ProcessStep(
    number: '1',
    title: 'نفهم فكرتك',
    description:
        'نستمع إلى احتياجاتك ونفهم فكرة المشروع والأهداف التي تريد تحقيقها.',
    icon: Icons.lightbulb_outline_rounded,
  ),
  const ProcessStep(
    number: '2',
    title: 'نخطط ونصمم',
    description:
        'نحدد المتطلبات ونبني تصورًا واضحًا لشكل المشروع وتجربة المستخدم.',
    icon: Icons.design_services_rounded,
  ),
  const ProcessStep(
    number: '3',
    title: 'نطوّر',
    description:
        'نحوّل الفكرة إلى تطبيق أو موقع فعلي باستخدام Flutter والتقنيات المناسبة.',
    icon: Icons.code_rounded,
  ),
  const ProcessStep(
    number: '4',
    title: 'نختبر ونسلّم',
    description: 'نختبر المشروع، نعالج المشاكل، ثم نسلّمه جاهزًا للاستخدام.',
    icon: Icons.verified_outlined,
  ),
];
