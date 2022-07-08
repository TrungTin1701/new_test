// ignore_for_file: public_member_api_docs, sort_constructors_first, prefer_const_constructors, unnecessary_this, file_names
import 'package:flutter/material.dart';

class MyPainter extends CustomPainter {
  final String label;
  final Color color;
  MyPainter(
    this.label,
    this.color,
  );
  bool isColor = false;

  @override
  void paint(Canvas canvas, Size size) {
    Paint paint = Paint();
    final rect = Rect.fromLTWH(0, 0, size.width, size.height);
    final RRect rRect = RRect.fromRectAndRadius(rect, Radius.circular(50));
    paint.color = this.color;
    canvas.drawRRect(rRect, paint);
    final textPainter = TextPainter(
      text: TextSpan(
        text: this.label,
        style: TextStyle(
          color: this.color == Colors.white ? Colors.black : Colors.white,
          fontSize: 45,
        ),
      ),
      textDirection: TextDirection.ltr,
      textAlign: TextAlign.start,
    );
    textPainter.layout(
      minWidth: 0,
      maxWidth: size.width,
    );
    textPainter.paint(
      canvas,
      Offset(40, size.height / 2 - textPainter.height / 2),
    );
  }

  @override
  bool shouldRepaint(CustomPainter oldDelegate) {
    return false;
  }
}
