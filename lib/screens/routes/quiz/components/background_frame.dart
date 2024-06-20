// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'package:flutter/material.dart';
import 'package:svg_flutter/svg_flutter.dart';

import 'package:portfolio_flutter/constants.dart';

class ArcadeBgFrame extends StatelessWidget {
  final String title;
  final Color color;
  const ArcadeBgFrame({
    Key? key,
    required this.title,
    required this.color,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Stack(
      alignment: Alignment.topCenter,
      // mainAxisSize: MainAxisSize.min,
      children: [
        Container(height: 160, width: double.infinity, color: color),
        SvgPicture.asset(
          'assets/images/arcade/gridbg.svg',
          height: 160,
          fit: BoxFit.cover,
          // ignore: deprecated_member_use
          color: Colors.white10,
        ),
        SvgPicture.asset('assets/images/arcade/arrow_frame.svg'),
        Positioned(
          child: Container(
            padding: const EdgeInsets.symmetric(
              horizontal: defaultPadding,
              vertical: defaultPadding / 2,
            ),
            margin: const EdgeInsets.all(defaultPadding),
            decoration: BoxDecoration(
              boxShadow: const [
                BoxShadow(color: Colors.black87, offset: Offset(0, 5)),
              ],
              borderRadius: BorderRadius.circular(defaultBorderRadius / 2),
              color: Colors.white,
            ),
            child: Text(
              title,
              style: Theme.of(context)
                  .textTheme
                  .titleMedium!
                  .copyWith(color: Colors.black, fontWeight: FontWeight.bold),
            ),
          ),
        ),
      ],
    );
  }
}
