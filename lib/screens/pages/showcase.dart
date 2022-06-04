import 'package:flutter/material.dart';
import 'package:logger/logger.dart';
import 'package:portfolio_flutter/constants.dart';
import 'package:portfolio_flutter/data.dart';
import 'package:portfolio_flutter/theme.dart';
import 'package:portfolio_flutter/widgets/post_card.dart';

class Showcase extends StatelessWidget {
  Showcase({Key? key}) : super(key: key);

  final logger = Logger(
    printer: PrettyPrinter(
      methodCount: 2, // number of method calls to be displayed
      errorMethodCount: 8, // number of method calls if stacktrace is provided
      lineLength: 120, // width of the output
      colors: true, // Colorful log messages
      printEmojis: true, // Print an emoji for each log message
      printTime: true, //, Should each log print contain a timestamp
      // noBoxingByDefault: true
    ),
  );
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Showcase'),
      ),
      backgroundColor: lightBackground,
      body: SingleChildScrollView(
          child: Column(children: [
        // const SizedBox(
        //   height: defaultPadding * 2,
        // ),
        // Padding(
        //   padding: const EdgeInsets.all(defaultPadding * 2),
        //   child: Column(
        //     mainAxisSize: MainAxisSize.min,
        //     children: [
        //       Text('SHOWCASE',
        //           style: Theme.of(context)
        //               .textTheme
        //               .headline5!
        //               .copyWith(color: lightPrimary)),
        //       const Divider(),
        //     ],
        //   ),
        // ),
        // const SizedBox(
        //   height: defaultPadding,
        // ),
        data(),
      ])),
    );
  }

  Widget data() {
    return Wrap(
      children: [
        ...List.generate(
            showcaseLeftDATA.length,
            (index) => Padding(
                  padding: const EdgeInsets.all(defaultPadding * 2),
                  child: PostCard(
                    showcase: showcaseLeftDATA[index],
                  ),
                )),
      ],
    );
  }
}
