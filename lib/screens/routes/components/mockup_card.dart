// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'dart:async';
import 'dart:developer';
import 'dart:math' as math;

import 'package:flutter/material.dart';
import 'package:responsive_sizer/responsive_sizer.dart';
import 'package:sensors_plus/sensors_plus.dart';

class MockupCard extends StatefulWidget {
  final String url;
  final bool isLaptop;
  const MockupCard({
    Key? key,
    required this.url,
    this.isLaptop = false,
  }) : super(key: key);

  @override
  State<MockupCard> createState() => _MockupCardState();
}

class _MockupCardState extends State<MockupCard> {
  double tiltX = 0.0; // Radians for tilt around the X-axis (up-down)
  double tiltY = 0.0; // Radians for tilt around the Y-axis (left-right)

  String data = '';
  double hoverSensitivity = 0.3;
  Matrix4 calculateTiltMatrix() {
    Matrix4 tiltMatrix = Matrix4.identity();
    tiltMatrix.rotateX(-tiltY);
    tiltMatrix.rotateY(-tiltX);
    tiltMatrix.rotateZ(tiltX * 0.1);
    // Perspective transform:

    return tiltMatrix;
  }

  StreamSubscription<GyroscopeEvent>? _streamSubscription;

  void initState() {
    super.initState();
    _streamSubscription = gyroscopeEvents.listen((event) {
      // Process gyroscope data (x, y, z values)
      setState(() {
        // my idea of using cos for this eqution
        final normalizedX = event.x / 300;
        final normalizedY = event.y / 600;
        final value =
            math.cos(normalizedX * math.pi); // Adjust PI for desired curve
        final value1 =
            -math.cos(normalizedY * math.pi); // Adjust PI for desired curve
        tiltX = value * hoverSensitivity; // Adjust tilt based on value
        tiltY = (value1 * hoverSensitivity); // Adjust tilt based on value
        data = " y:$tiltY";
      });
    });
  }

  @override
  void dispose() {
    super.dispose();
    _streamSubscription?.cancel(); // Cancel subscription when done
  }

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onPanUpdate: (details) {
        // Calculate relative mouse position within the widget
        final RenderBox box = context.findRenderObject() as RenderBox;

        final widgetWidth = box.size.width;
        final widgetHeight = box.size.height;
        final localPosition = box.globalToLocal(details.localPosition);

        setState(() {
          // my idea of using cos for this eqution
          final normalizedX = localPosition.dx / widgetWidth;
          final normalizedY = localPosition.dy / widgetHeight;
          final value =
              math.cos(normalizedX * math.pi); // Adjust PI for desired curve
          final value1 =
              -math.cos(normalizedY * math.pi); // Adjust PI for desired curve
          tiltX = value * hoverSensitivity; // Adjust tilt based on value
          tiltY = (value1 * hoverSensitivity); // Adjust tilt based on value
          data = " y:$tiltY";
        });
      },
      child: MouseRegion(
        onHover: (event) {
          // Calculate relative mouse position within the widget
          final RenderBox box = context.findRenderObject() as RenderBox;

          final widgetWidth = box.size.width;
          final widgetHeight = box.size.height;
          final localPosition = box.globalToLocal(event.position);
          setState(() {
            // my idea of using cos for this eqution
            final normalizedX = localPosition.dx / widgetWidth;
            final normalizedY = localPosition.dy / widgetHeight;
            final value =
                math.cos(normalizedX * math.pi); // Adjust PI for desired curve
            final value1 =
                -math.cos(normalizedY * math.pi); // Adjust PI for desired curve
            tiltX = value * hoverSensitivity; // Adjust tilt based on value
            tiltY = (value1 * hoverSensitivity); // Adjust tilt based on value
            data = " y:$tiltY";
          });
        },
        onExit: (event) {
          setState(() {
            // localP = Offset.zero;
            tiltX = 0;
            tiltY = 0;
          });
        },
        child: Transform(
          alignment: Alignment.center, // Optional: Anchor point for rotation
          transform: calculateTiltMatrix(),
          child: Stack(
            alignment: Alignment.center,
            children: [
              Image(
                image: AssetImage(widget.url),
                height: 50.h,
              ),
              Image(
                image: AssetImage(
                  widget.isLaptop
                      ? 'assets/mockups/laptop.png'
                      : 'assets/mockups/phone.png',
                ),
                height: 50.h,
              ),
            ],
          ),
        ),
      ),
    );
  }
}
