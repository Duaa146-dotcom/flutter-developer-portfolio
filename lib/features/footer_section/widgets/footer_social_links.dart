import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:portfolio/core/theme/app_colors.dart';
import 'package:url_launcher/url_launcher.dart';

class FooterSocialLinks extends StatelessWidget {
  const FooterSocialLinks({super.key});

  // دالة تشغيل الروابط الخارجية
  Future<void> _launchURL(String urlString) async {
    final Uri url = Uri.parse(urlString);
    if (!await launchUrl(url, mode: LaunchMode.externalApplication)) {
      debugPrint('لا يمكن فتح الرابط: $urlString');
    }
  }

  @override
  Widget build(BuildContext context) {
    final socials = [
      {
        'icon': FontAwesomeIcons.github,
        'label': 'GitHub',
        'url': 'https://github.com/Duaa146-dotcom', // استبدلي برابطك
      },
      {
        'icon': FontAwesomeIcons.linkedinIn,
        'label': 'LinkedIn',
        'url':
            'https://www.linkedin.com/in/duaa-ermas-708917361', // استبدلي برابطك
      },
      {
        'icon': FontAwesomeIcons.whatsapp,
        'label': 'WhatsApp',
        'url': 'https://wa.me/776269380', // استبدلي برقمك
      },
      {
        'icon': FontAwesomeIcons.envelope,
        'label': 'Email',
        'url': 'mailto:idwa.2014@gmail.com',
      },
    ];

    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        const Text(
          'تواصل معي  :',
          style: TextStyle(
            fontSize: 14,
            fontWeight: FontWeight.bold,
            color: Colors.white,
          ),
        ),
        const SizedBox(height: 12),
        Row(
          mainAxisSize: MainAxisSize.min,
          children: socials.map((social) {
            return _SocialButton(
              icon: social['icon'] as IconData,
              tooltip: social['label'] as String,
              onTap: () => _launchURL(social['url'] as String),
            );
          }).toList(),
        ),
      ],
    );
  }
}

class _SocialButton extends StatefulWidget {
  final IconData icon;
  final String tooltip;
  final VoidCallback onTap;

  const _SocialButton({
    required this.icon,
    required this.tooltip,
    required this.onTap,
  });

  @override
  State<_SocialButton> createState() => _SocialButtonState();
}

class _SocialButtonState extends State<_SocialButton> {
  bool isHovered = false;

  @override
  Widget build(BuildContext context) {
    return Tooltip(
      message: widget.tooltip,
      child: MouseRegion(
        onEnter: (_) => setState(() => isHovered = true),
        onExit: (_) => setState(() => isHovered = false),
        child: AnimatedContainer(
          duration: const Duration(milliseconds: 200),
          margin: const EdgeInsets.only(left: 10),
          decoration: BoxDecoration(
            color: isHovered ? AppColors.primary : const Color(0xFF1F2937),
            borderRadius: BorderRadius.circular(10),
            border: Border.all(
              color: isHovered ? AppColors.primary : const Color(0xFF374151),
            ),
          ),
          child: InkWell(
            onTap: widget.onTap,
            borderRadius: BorderRadius.circular(10),
            child: Padding(
              padding: const EdgeInsets.all(12),
              child: FaIcon(
                widget.icon,
                size: 18,
                color: isHovered ? Colors.white : const Color(0xFFD1D5DB),
              ),
            ),
          ),
        ),
      ),
    );
  }
}
