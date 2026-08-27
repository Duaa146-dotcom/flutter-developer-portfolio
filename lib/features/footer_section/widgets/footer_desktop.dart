import 'package:flutter/material.dart';
import 'package:portfolio/core/theme/app_colors.dart';
import 'footer_bottom_bar.dart';
import 'footer_brand.dart';
import 'footer_contact_info.dart';
import 'footer_nav_links.dart';
import 'footer_social_links.dart';

class FooterDesktop extends StatelessWidget {
  final Map<String, GlobalKey>? sectionKeys;

  const FooterDesktop({super.key, this.sectionKeys});

  @override
  Widget build(BuildContext context) {
    return Directionality(
      textDirection: TextDirection.rtl,
      child: Container(
        width: double.infinity,
        color: AppColors.footerColor,
        padding: const EdgeInsets.symmetric(horizontal: 100, vertical: 60),
        child: Column(
          children: [
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                const Expanded(child: FooterBrand()),
                const SizedBox(width: 40),
                Expanded(child: FooterNavLinks(sectionKeys: sectionKeys)),
              ],
            ),
            const SizedBox(height: 40),
            const Divider(color: Color(0xFF1F2937)),
            const SizedBox(height: 32),
            const Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              crossAxisAlignment: CrossAxisAlignment.end,
              children: [
                FooterSocialLinks(),
                //  FooterContactInfo()
              ],
            ),
            // const SizedBox(height: 40),
            // const FooterBottomBar(),
          ],
        ),
      ),
    );
  }
}
