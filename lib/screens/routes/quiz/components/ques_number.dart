import 'package:flutter/material.dart';
import 'package:portfolio_flutter/constants.dart';

class QuestionNumberWidget extends StatelessWidget {
  final int totalQ;
  final int currentQ;
  const QuestionNumberWidget({Key? key,  this.totalQ = 0, this.currentQ = 0}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisSize: MainAxisSize.min,
      children: [
        Padding(
          padding: const EdgeInsets.all(defaultPadding / 2),
          child: CustomPaint(
            painter: RPSCustomPainter(),
            child: Padding(
              padding: const EdgeInsets.symmetric(
                  vertical: defaultPadding / 2, horizontal: defaultPadding,),
              child: Text(
                'QUESTION $currentQ OF $totalQ',
                style: const TextStyle(
                  fontWeight: FontWeight.w600,
                  color:  Colors.amber,
                  fontSize: 12,
                ),
              ),
            ),
          ),
        ),
        const Icon(
          Icons.person,
          size: 12,
        ),
        const Text(
          '450 LIVE',
          style: TextStyle(fontSize: 12, fontWeight: FontWeight.bold),
        ),
      ],
    );
  }
}

class RPSCustomPainter extends CustomPainter {
  @override
  void paint(Canvas canvas, Size size) {
    // Layer 1
    var width = size.width;
    var height = size.height;
    const factor = 0.3;

    Paint backgroundFill = Paint()
      ..color =  Colors.amber.withOpacity(0.1)
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
    mainStroke.moveTo(height * factor, 0);
    mainStroke.lineTo(width, 0);
    mainStroke.lineTo(width, height - (height * factor));
    mainStroke.lineTo(width - (height * factor), height);
    mainStroke.lineTo(0, height);
    mainStroke.lineTo(0, height * factor);
    mainStroke.close();
    canvas.drawPath(mainStroke, backgroundFill);
    canvas.drawPath(mainStroke, paintStroke);

    Path topLeftTriangle = Path();
    topLeftTriangle.lineTo(height * factor - 4, 0);
    topLeftTriangle.lineTo(0, height * factor - 4);
    topLeftTriangle.close();

    canvas.drawPath(topLeftTriangle, triangle);
    canvas.drawPath(topLeftTriangle, paintStroke);
    canvas.drawShadow(
      topLeftTriangle.shift(const Offset(0, -defaultPadding)),
       Colors.amber,
      defaultPadding,
      false,
    );

    Path bottomRightTriangle = Path();
    bottomRightTriangle.moveTo(width, height);
    bottomRightTriangle.lineTo(width, height - height * factor + 4);
    bottomRightTriangle.lineTo(width - height * factor + 4, height);
    bottomRightTriangle.close();
    canvas.drawPath(bottomRightTriangle, paintStroke);

    canvas.drawPath(bottomRightTriangle, triangle);
    canvas.drawShadow(
        bottomRightTriangle.shift(const Offset(0, -defaultPadding)),
         Colors.amber,
        defaultPadding,
        false,);

    Path bottomLeftSquare = Path();
    bottomLeftSquare.moveTo(0, height);
    bottomLeftSquare.lineTo(2, height);
    bottomLeftSquare.lineTo(2, height - 2);
    bottomLeftSquare.lineTo(0, height - 2);
    bottomLeftSquare.close();

    canvas.drawPath(bottomLeftSquare, triangle);

    Path topRightSquare = Path();
    topRightSquare.moveTo(width, 0);
    topRightSquare.lineTo(width, 2);
    topRightSquare.lineTo(width - 2, 2);
    topRightSquare.lineTo(width - 2, 0);
    topRightSquare.close();

    canvas.drawPath(topRightSquare, triangle);
  }

  @override
  bool shouldRepaint(covariant CustomPainter oldDelegate) {
    return true;
  }
}
