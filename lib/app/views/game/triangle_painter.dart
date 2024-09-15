import 'package:flutter/material.dart';

class TriangleWidget extends StatelessWidget {
  const TriangleWidget({super.key});

  @override
  Widget build(BuildContext context) {
    return CustomPaint(
      size: const Size(20, 10), // 사이즈 설정
      painter: TrianglePainter(),
    );
  }
}

class TrianglePainter extends CustomPainter {
  @override
  void paint(Canvas canvas, Size size) {
    // 삼각형을 그릴 페인트 객체
    final paint = Paint()
      ..color = Colors.black
      ..style = PaintingStyle.fill;

    // 뒤집힌 삼각형의 세 점 좌표를 정의
    final path = Path()
      ..moveTo(size.width / 2, size.height) // 아래쪽 중간 (꼭짓점)
      ..lineTo(0, 0) // 왼쪽 위 모서리
      ..lineTo(size.width, 0) // 오른쪽 위 모서리
      ..close(); // 삼각형을 닫음

    // 캔버스에 삼각형 그리기
    canvas.drawPath(path, paint);
  }

  @override
  bool shouldRepaint(CustomPainter oldDelegate) => false;
}
