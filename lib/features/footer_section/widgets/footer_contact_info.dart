import 'package:flutter/material.dart';
import 'package:portfolio/core/theme/app_colors.dart';

class FooterContactInfo extends StatelessWidget {
  const FooterContactInfo({super.key});

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        const Row(
          children: [
            Icon(Icons.email_outlined, size: 18, color: AppColors.primary),
            SizedBox(width: 8),
            Text(
              'البريد الإلكتروني:',
              style: TextStyle(fontSize: 13, color: Color(0xFF9CA3AF)),
            ),
          ],
        ),
        const SizedBox(height: 4),
        const Text(
          'contact@doaa.com',
          style: TextStyle(
            fontSize: 14,
            fontWeight: FontWeight.bold,
            color: Colors.white,
          ),
        ),
        const SizedBox(height: 16),

        // حقل إرسال البريد السريع
        Container(
          width: 280,
          height: 46,
          decoration: BoxDecoration(
            color: const Color(0xFF1F2937),
            borderRadius: BorderRadius.circular(8),
            border: Border.all(color: const Color(0xFF374151)),
          ),
          child: Row(
            children: [
              const Expanded(
                child: Padding(
                  padding: EdgeInsets.symmetric(horizontal: 12),
                  child: TextField(
                    style: TextStyle(color: Colors.white, fontSize: 13),
                    decoration: InputDecoration(
                      hintText: 'اكتب إيميلك للتواصل...',
                      hintStyle: TextStyle(
                        fontSize: 12,
                        color: Color(0xFF6B7280),
                      ),
                      border: InputBorder.none,
                      isDense: true,
                    ),
                  ),
                ),
              ),
              Container(
                height: 46,
                width: 46,
                decoration: BoxDecoration(
                  color: AppColors.primary,
                  borderRadius: BorderRadius.circular(7),
                ),
                child: const Icon(
                  Icons.send_rounded,
                  color: Colors.white,
                  size: 18,
                ),
              ),
            ],
          ),
        ),
      ],
    );
  }
}
