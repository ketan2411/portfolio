import 'package:flutter/material.dart';
import 'package:portfolio_flutter/constants.dart';

class QuestionWidget extends StatelessWidget {
  final String text;
  final EdgeInsetsGeometry? padding;
  const QuestionWidget(
      {Key? key,  this.text = 'Something went wrong', this.padding}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: padding ?? const EdgeInsets.all(defaultPadding / 2),
      child: ConstrainedBox(
        constraints: const BoxConstraints(maxWidth: 300),
        child: CustomPaint(
          painter: RPSCustomPainter(),
          child: Padding(
            padding: const EdgeInsets.symmetric(
              vertical: defaultPadding / 2,
              horizontal: defaultPadding,
            ),
            child: Text(
              text.trim(),
              textAlign: TextAlign.left,
              style: const TextStyle(
                fontSize: 16,
                height: 1.4,
                fontWeight: FontWeight.w600,
                color: Colors.amber,
              ),
            ),
          ),
        ),
      ),
    );
  }
}

class RPSCustomPainter extends CustomPainter {
  @override
  void paint(Canvas canvas, Size size) {
    // Layer 1
    var width = size.width;
    var height = size.height;
    // const factor = 0.3;
    Paint backgroundFill = Paint()
      ..color = Colors.amber.withOpacity(0.1)
      ..style = PaintingStyle.fill
      ..strokeWidth = 3
      ..strokeCap = StrokeCap.butt
      ..strokeJoin = StrokeJoin.miter;

    Paint triangle = Paint()
      ..color =  Colors.amber
      ..style = PaintingStyle.fill
      ..strokeWidth = 3
      ..strokeCap = StrokeCap.butt
      ..strokeJoin = StrokeJoin.miter;

    Paint paintStroke = Paint()
      ..color =  Colors.amber
      ..style = PaintingStyle.stroke
      ..strokeWidth = size.width * 0.00
      ..strokeCap = StrokeCap.butt
      ..strokeJoin = StrokeJoin.miter;

    Path mainStroke = Path();
    const fix = 16.0;
    // mainStroke.moveTo(height * factor, 0);
    // height * factor=16
    mainStroke.lineTo(width - fix, 0);
    mainStroke.lineTo(width, fix);
    mainStroke.lineTo(width, height);
    mainStroke.lineTo(0, height);
    mainStroke.close();
    canvas.drawPath(mainStroke, backgroundFill);
    canvas.drawPath(mainStroke, paintStroke);

    Path topRightTriangle = Path();
    topRightTriangle.moveTo(width - fix, 4);
    topRightTriangle.lineTo(width - 4, fix);
    topRightTriangle.lineTo(width - fix, fix);
    topRightTriangle.close();
    canvas.drawPath(topRightTriangle, paintStroke);

    canvas.drawPath(topRightTriangle, triangle);
    canvas.drawShadow(
      topRightTriangle.shift(const Offset(0, -defaultPadding)),
       Colors.amber,
      defaultPadding,
      false,
    );
  }

  @override
  bool shouldRepaint(covariant CustomPainter oldDelegate) {
    return true;
  }
}
