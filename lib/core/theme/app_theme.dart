import 'package:flutter/material.dart';

import 'app_colors.dart';

class AppTheme {
  static ThemeData get lightTheme {
    return ThemeData(
      useMaterial3: true,

      fontFamily: 'IBMPlexSansArabic',

      scaffoldBackgroundColor: AppColors.background,

      colorScheme: ColorScheme.fromSeed(seedColor: AppColors.primary),
    );
  }
}
