import 'package:animate_do/animate_do.dart';
import 'package:flutter/material.dart';

class CurvePainterPremiumCard extends CustomPainter {
  final double value;
  final int? currentStep;
  final int? totalSteps;

  CurvePainterPremiumCard(
      {required this.value, this.currentStep, this.totalSteps});

  @override
  void paint(Canvas canvas, Size size) {
    String text = currentStep != null
        ? '$currentStep/$totalSteps'
        : '${(value * 100).toStringAsFixed(0)}%';
    var paint1 = Paint()
      ..color = Colors.amber
      ..style = PaintingStyle.stroke
      ..strokeCap = StrokeCap.round
      ..strokeWidth = 5;
    var paint2 = Paint()
      ..color = const Color.fromARGB(255, 223, 223, 223)
      ..style = PaintingStyle.stroke
      ..strokeCap = StrokeCap.round
      ..strokeWidth = 3;

    final textSpan = TextSpan(
      text: text,
      style: const TextStyle(
        color: Colors.white,
        fontSize: 12,
        fontFamily: 'poppins',
        fontWeight: FontWeight.w400,
      ),
    );
    final textPainter = TextPainter(
      text: textSpan,
      textDirection: TextDirection.ltr,
    );
    textPainter.layout(
      minWidth: 0,
      maxWidth: size.width,
    );
    // draw arc
    canvas.drawArc(
      const Offset(0, 0) & Size(size.height, size.height),
      -1.57, //radians
      (value * 6.28) - 0.2,
      // 0 to 6.28 radians in limit in circle
      false,
      paint1,
    );
    canvas.drawArc(
      const Offset(0, 0) & Size(size.height, size.height),
      (value * 6.28) - 1.55,
      6.0 - (value * 6.28), //radians
      // 0 to 6.28 radians in limit in circle
      false,
      paint2,
    );
    final xCenter = (size.width - textPainter.width) / 2;
    final yCenter = (size.height - textPainter.height) / 2;
    final offset = Offset(xCenter, yCenter);
    textPainter.paint(canvas, offset);
  }

  @override
  bool shouldRepaint(CurvePainterPremiumCard oldDelegate) =>
      oldDelegate.value != value;
}

class AnimatedCircularProgress extends StatefulWidget {
  final double value;
  final int? currentStep;
  final int? totalSteps;
  const AnimatedCircularProgress(
      {Key? key, required this.value, this.currentStep, this.totalSteps}) : super(key: key);

  @override
  AnimatedCircularProgressState createState() =>
      AnimatedCircularProgressState();
}

class AnimatedCircularProgressState extends State<AnimatedCircularProgress>
    with SingleTickerProviderStateMixin {
  late Animation<double> _animation;
  double progressValue = 0;
  late AnimationController controller;

  @override
  void initState() {
    super.initState();
    controller = AnimationController(
      duration: const Duration(milliseconds: 1000),
      vsync: this,
    );
    Future.delayed(const Duration(milliseconds: 500), () {})
        .then((value) => controller.forward());

    controller.addStatusListener((status) {
      if (status == AnimationStatus.completed) {
        controller.stop();
      } else if (status == AnimationStatus.dismissed) {
        controller.forward();
      }
    });
    _animation = Tween(begin: 0.0, end: widget.value).animate(controller)
      ..addListener(() {
        setState(() {
          progressValue = _animation.value;
        });
      });
  }

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(16.0),
      child: ZoomIn(
        duration: const Duration(milliseconds: 250),
        child: CustomPaint(
          size: const Size(50, 50),
          painter: CurvePainterPremiumCard(
              value: progressValue,
              currentStep: widget.currentStep,
              totalSteps: widget.totalSteps),
        ),
      ),
    );
  }

  @override
  void dispose() {
    controller.dispose();
    super.dispose();
  }
}
