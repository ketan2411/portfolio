// ignore_for_file: file_names

import 'package:flutter/material.dart';
import 'package:portfolio_flutter/theme.dart';

class Home extends StatelessWidget {
  const Home({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      // alignment: Alignment.center,
      height: MediaQuery.of(context).size.height,
      color: darkBackground,
      child: Wrap(
        runAlignment: WrapAlignment.center,
        alignment: WrapAlignment.spaceEvenly,
        children: [
          const FlutterLogo(
            style: FlutterLogoStyle.markOnly,
            size: 200,
          ),
          Padding(
            padding: const EdgeInsets.all(8.0),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  'Hi I\'m',
                  style: Theme.of(context)
                      .textTheme
                      .headline6!
                      .copyWith(color: Colors.white),
                ),
                Text(
                  'Ketan Sharma',
                  style: Theme.of(context)
                      .textTheme
                      .headline4!
                      .copyWith(fontWeight: FontWeight.bold),
                ),
                Text(
                  'Flutter Developer',
                  style: Theme.of(context).textTheme.headline3!.copyWith(
                        foreground: Paint()
                          ..style = PaintingStyle.stroke
                          ..strokeWidth = 1
                          ..color = Colors.white,
                      ),
                )
              ],
            ),
          )
        ],
      ),
    );
  }
}
