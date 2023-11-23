import 'package:flutter/cupertino.dart';

import '../../models/dot_info.dart';

class DrawingPainter extends CustomPainter {
  final List<List<DotInfo>> lines;

  DrawingPainter(this.lines);

  @override
  void paint(Canvas canvas, Size size) {
    for (var oneLine in lines) {
      var l = <Offset>[];
      var p = Path();

      for (var oneDot in oneLine) {
        l.add(oneDot.offset);
      }
      p.addPolygon(l, false);
      canvas.drawPath(
          p,
          Paint()
            ..color = oneLine.first.color
            ..strokeWidth = oneLine.first.size
            ..strokeCap = StrokeCap.round
            ..style = PaintingStyle.stroke);
    }
  }

  @override
  bool shouldRepaint(covariant CustomPainter oldDelegate) {
    return true;
  }
}
