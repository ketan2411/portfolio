import 'package:flutter/material.dart';
import 'package:portfolio_flutter/constants.dart';
import 'package:portfolio_flutter/utils/logger.dart';
import 'package:responsive_sizer/responsive_sizer.dart';

class QuizBg extends StatelessWidget {
  final Widget child;
  const QuizBg({Key? key, required this.child}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    appLog(name: 'screenType', log: (Device.width > 599).toString());
    return Device.width > 599
        ? Stack(
            alignment: Alignment.center,
            children: [
              Container(
                width: double.infinity,
                height: double.infinity,
                color: Colors.amber,
              ),
              SizedBox(width: quizWidthDesktop, child: child),
            ],
          )
        : child;
  }
}
