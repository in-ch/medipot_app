import 'dart:math';

import 'package:flutter/material.dart';

class RoulettePainter extends CustomPainter {
  final List<String> items;
  final List<Color> colors;

  RoulettePainter({required this.items, required this.colors});

  @override
  void paint(Canvas canvas, Size size) {
    final Paint paint = Paint();
    final double radius = size.width / 2;
    final Offset center = Offset(size.width / 2, size.height / 2);
    final double anglePerItem = 2 * pi / items.length;

    for (int i = 0; i < items.length; i++) {
      paint.color = colors[i % colors.length];
      canvas.drawArc(
        Rect.fromCircle(center: center, radius: radius),
        i * anglePerItem,
        anglePerItem,
        true,
        paint,
      );

      final textPainter = TextPainter(
        text: TextSpan(
          text: items[i],
          style: const TextStyle(
            fontSize: 14,
            color: Colors.white,
            fontWeight: FontWeight.bold,
          ),
        ),
        textAlign: TextAlign.center,
        textDirection: TextDirection.ltr,
      );
      textPainter.layout();

      final double textAngle = i * anglePerItem + anglePerItem / 2;
      final double textX = center.dx + (radius / 1.5) * cos(textAngle);
      final double textY = center.dy + (radius / 1.5) * sin(textAngle);

      canvas.save();
      canvas.translate(textX, textY);
      canvas.rotate(textAngle + pi / 2);
      textPainter.paint(
          canvas, Offset(-textPainter.width / 2, -textPainter.height / 2));
      canvas.restore();
    }
  }

  @override
  bool shouldRepaint(covariant CustomPainter oldDelegate) {
    return true;
  }
}
