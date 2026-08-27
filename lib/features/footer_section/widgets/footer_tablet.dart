import 'package:flutter/material.dart';
import 'package:portfolio/core/theme/app_colors.dart';
import 'footer_bottom_bar.dart';
import 'footer_brand.dart';
import 'footer_contact_info.dart';
import 'footer_nav_links.dart';
import 'footer_social_links.dart';

class FooterTablet extends StatelessWidget {
  final Map<String, GlobalKey>? sectionKeys;

  const FooterTablet({super.key, this.sectionKeys});

  @override
  Widget build(BuildContext context) {
    return Directionality(
      textDirection: TextDirection.rtl,
      child: Container(
        width: double.infinity,
        color: AppColors.footerColor,
        padding: const EdgeInsets.symmetric(horizontal: 40, vertical: 40),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            const FooterBrand(),
            const SizedBox(height: 28),
            FooterNavLinks(sectionKeys: sectionKeys),
            const SizedBox(height: 28),
            const FooterSocialLinks(),
            // const SizedBox(height: 28),
            // const FooterContactInfo(),
            // const SizedBox(height: 32),
            // const FooterBottomBar(),
          ],
        ),
      ),
    );
  }
}
