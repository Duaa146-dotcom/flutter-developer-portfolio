import 'package:flutter/material.dart';

import '../../../../../core/utils/responsive.dart';
import 'navbar_desktop.dart';
import 'navbar_mobile.dart';

class CustomNavbar extends StatelessWidget {
  final Map<String, GlobalKey>? sectionKeys;

  const CustomNavbar({super.key, this.sectionKeys});

  @override
  Widget build(BuildContext context) {
    if (Responsive.isDesktop(context)) {
      return NavbarDesktop(sectionKeys: sectionKeys);
    }

    return NavbarMobile();
  }
}
