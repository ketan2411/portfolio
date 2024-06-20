import 'package:flutter/material.dart';
import 'package:portfolio_flutter/constants.dart';
import 'package:svg_flutter/svg.dart';

class OptionCheckBox extends StatefulWidget {
  final bool isCorrect;
  const OptionCheckBox({Key? key,  this.isCorrect = false}) : super(key: key);

  @override
  State<OptionCheckBox> createState() => _OptionCheckBoxState();
}

class _OptionCheckBoxState extends State<OptionCheckBox> {
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(defaultPadding * 1.2),
      child: Stack(
        clipBehavior: Clip.none,
        alignment: Alignment.topCenter,
        children: [
          CustomPaint(
            size: const Size(30, 30),
            painter: RPSCustomPainter(),
          ),
          Positioned(
            top: -30,
            child: widget.isCorrect
                ? SvgPicture.asset(
                    'assets/images/arcade/check_icon.svg',
                  )
                : SvgPicture.asset(
                    'assets/images/arcade/uncheck.svg',
                  ),
          ),
        ],
      ),
    );
  }
}

class RPSCustomPainter extends CustomPainter {

  @override
  void paint(Canvas canvas, Size size) async {
    // Layer 1
    var width = size.width;
    var height = size.height;

    Paint backgroundFill = Paint()
      ..color = Colors.white.withOpacity(0.1)
      ..style = PaintingStyle.fill
      ..strokeWidth = 3
      ..strokeCap = StrokeCap.butt
      ..strokeJoin = StrokeJoin.miter;

    Paint triangle = Paint()
      ..color = Colors.white
      ..style = PaintingStyle.fill
      ..strokeWidth = 3
      ..strokeCap = StrokeCap.butt
      ..strokeJoin = StrokeJoin.miter;

    Paint paintStroke = Paint()
      ..color = Colors.white
      ..style = PaintingStyle.stroke
      ..strokeWidth = size.width * 0.00
      ..strokeCap = StrokeCap.butt
      ..strokeJoin = StrokeJoin.miter;

    Path mainStroke = Path();
    mainStroke.lineTo(width, 0);
    mainStroke.lineTo(width, height);
    mainStroke.lineTo(0, height);
    // mainStroke.lineTo(0, height * factor);
    mainStroke.close();
    canvas.drawPath(mainStroke, backgroundFill);
    canvas.drawPath(mainStroke, paintStroke);

    Path topLeftSquare = Path();
    topLeftSquare.lineTo(2, 0);
    topLeftSquare.lineTo(2, 2);
    topLeftSquare.lineTo(0, 2);
    topLeftSquare.close();

    canvas.drawPath(topLeftSquare, triangle);
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

    Path bottomRightSquare = Path();
    bottomRightSquare.moveTo(width, height);
    bottomRightSquare.lineTo(width, height - 2);
    bottomRightSquare.lineTo(width - 2, height - 2);
    bottomRightSquare.lineTo(width - 2, height);
    bottomRightSquare.close();

    canvas.drawPath(bottomRightSquare, triangle);
  }

  @override
  bool shouldRepaint(covariant CustomPainter oldDelegate) {
    return true;
  }
}
