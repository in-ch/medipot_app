import 'package:flutter/material.dart';

class SmallCircleDecoration extends Decoration {
  @override
  BoxPainter createBoxPainter([VoidCallback? onChanged]) {
    return _SmallCirclePainter();
  }
}

class _SmallCirclePainter extends BoxPainter {
  @override
  void paint(Canvas canvas, Offset offset, ImageConfiguration configuration) {
    final rect = offset & configuration.size!;
    final paint = Paint()..color = Colors.red;
    canvas.drawCircle(rect.center, 1, paint);
  }
}
