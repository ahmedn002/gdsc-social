import 'dart:math';

import 'package:flutter/material.dart';

import '../../../../../../core/constants/colors.dart';

class StoryBorderPainter extends CustomPainter {
  @override
  void paint(Canvas canvas, Size size) {
    // We don't want the arcs to touch each other so we want some margin
    // We will achieve this by specifying exact degrees for the arcs for better readability
    // Then convert them to radians
    const double marginInDegrees = 3; // Degrees of space between the arcs / 2

    const double topInDegrees = 270;
    const double bottomInDegrees = 90;
    const double sweepInDegrees = 90 - 2 * marginInDegrees; // We multiply by 2 because the starting point is already shifted forward by the margin

    final double topMinusMarginInRadians = _degreesToRadians(topInDegrees - marginInDegrees);
    final double topPlusMarginInRadians = _degreesToRadians(topInDegrees + marginInDegrees);
    final double bottomMinusMarginInRadians = _degreesToRadians(bottomInDegrees - marginInDegrees);
    final double bottomPlusMarginInRadians = _degreesToRadians(bottomInDegrees + marginInDegrees);
    final double sweepInRadians = _degreesToRadians(sweepInDegrees);

    _drawArc(canvas, size, topPlusMarginInRadians, sweepInRadians, AppColors.green);
    _drawArc(canvas, size, topMinusMarginInRadians, -sweepInRadians, AppColors.red);
    _drawArc(canvas, size, bottomPlusMarginInRadians, sweepInRadians, AppColors.accent);
    _drawArc(canvas, size, bottomMinusMarginInRadians, -sweepInRadians, AppColors.yellow);
  }

  void _drawArc(Canvas canvas, Size size, double startAngle, double sweepAngle, Color color) {
    final paint = Paint()
      ..color = color
      ..style = PaintingStyle.stroke
      ..strokeWidth = 2
      ..strokeCap = StrokeCap.round;

    canvas.drawArc(
      Rect.fromLTWH(0, 0, size.width, size.height),
      startAngle,
      sweepAngle,
      false,
      paint,
    );
  }

  double _degreesToRadians(double degrees) {
    return degrees * pi / 180;
  }

  @override
  bool shouldRepaint(covariant CustomPainter oldDelegate) {
    return false;
  }
}
