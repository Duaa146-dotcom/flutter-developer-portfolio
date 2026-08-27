import 'package:flutter/material.dart';

class BackgroundOrganicClipper extends CustomClipper<Path> {
  final bool isDesktop;

  BackgroundOrganicClipper({required this.isDesktop});

  @override
  Path getClip(Size size) {
    final path = Path();

    if (isDesktop) {
      path.moveTo(0, 0);

      path.lineTo(size.width * 0.85, 0);

      path.quadraticBezierTo(
        size.width,
        size.height * 0.35,
        size.width * 0.88,
        size.height * 0.7,
      );

      path.quadraticBezierTo(
        size.width * 0.78,
        size.height * 0.95,
        size.width * 0.45,
        size.height,
      );

      path.lineTo(0, size.height);
    } else {
      path.moveTo(0, 0);

      path.lineTo(size.width, 0);

      path.lineTo(size.width, size.height * 0.7);

      path.quadraticBezierTo(
        size.width * 0.5,
        size.height * 1.05,
        0,
        size.height * 0.75,
      );
    }

    path.close();

    return path;
  }

  @override
  bool shouldReclip(covariant CustomClipper<Path> oldClipper) {
    return true;
  }
}
