import 'package:flutter/material.dart';

class FooterBottomBar extends StatelessWidget {
  const FooterBottomBar({super.key});

  @override
  Widget build(BuildContext context) {
    return const Column(
      children: [
        Divider(color: Color(0xFF1F2937), height: 1),
        SizedBox(height: 24),
        Center(
          child: Text(
            ' جميع الحقوق محفوظة  2026©',
            style: TextStyle(fontSize: 13, color: Color(0xFF9CA3AF)),
          ),
        ),
      ],
    );
  }
}
