import 'package:flutter/material.dart';

class CustomDonutChart extends StatelessWidget {
  const CustomDonutChart({super.key});

  @override
  Widget build(BuildContext context) {
    return CustomPaint(
      painter: CustomDonutPainter(),
    );
  }
}

class CustomDonutPainter extends CustomPainter {
  @override
  void paint(Canvas canvas, Size size) {}

  @override
  bool shouldRepaint(covariant CustomPainter oldDelegate) {
    // TODO: implement shouldRepaint
    throw UnimplementedError();
  }
}
