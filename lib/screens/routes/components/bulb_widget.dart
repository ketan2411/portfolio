// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'dart:async';

import 'package:flutter/material.dart';

class BulbWidget extends StatefulWidget {
  final double size;
  final Duration delay;
  final bool bulbOn;
  const BulbWidget({
    Key? key,
    this.size = 0,
    this.delay = Duration.zero,
    this.bulbOn = false,
  }) : super(key: key);

  @override
  State<BulbWidget> createState() => _BulbWidgetState();
}

class _BulbWidgetState extends State<BulbWidget>
    with SingleTickerProviderStateMixin {
  late Timer timer;
  bool switchOn = false;
  @override
  void initState() {
    super.initState();

    Future.delayed(widget.delay, () {
      timer = Timer.periodic(const Duration(milliseconds: 200), (timer) {
        if (widget.bulbOn) {
          switchOn = !switchOn;
        } else {
          switchOn = false;
        }
        if (mounted) {
          setState(() {});
        }
      });
    });
  }

  @override
  void dispose() {
    timer.cancel();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      clipBehavior: Clip.none,
      height: widget.size,
      width: widget.size,
      decoration: BoxDecoration(
        gradient: RadialGradient(
          radius: 0.5,
          colors: switchOn
              ? const [Color.fromARGB(255, 255, 244, 211), Color(0xFFE0A441)]
              : const [
                  Color.fromARGB(255, 247, 205, 52),
                  Color.fromARGB(255, 240, 105, 9),
                ],
        ),
        shape: BoxShape.circle,
        boxShadow: switchOn
            ? [
                BoxShadow(
                  blurRadius: widget.size,
                  color: Colors.yellow[100]!,
                  blurStyle: BlurStyle.outer,
                ),
                BoxShadow(
                  blurRadius: widget.size * 1.5,
                  color: const Color(0xFFD37A22),
                  blurStyle: BlurStyle.outer,
                ),
              ]
            : null,
      ),
    );
  }
}
