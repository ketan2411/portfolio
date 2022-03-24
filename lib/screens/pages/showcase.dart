import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:logger/logger.dart';
import 'package:portfolio_flutter/constants.dart';
import 'package:portfolio_flutter/model/project_model.dart';
import 'package:portfolio_flutter/model/showcase_model.dart';
import 'package:portfolio_flutter/screens/layout.dart';
import 'package:portfolio_flutter/theme.dart';
import 'package:portfolio_flutter/widgets/post_card.dart';

class Showcase extends StatefulWidget {
  const Showcase({Key? key}) : super(key: key);

  @override
  State<Showcase> createState() => _ShowcaseState();
}

class _ShowcaseState extends State<Showcase> {
  var logger = Logger(
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

  final List<ShowcaseModel> showcase = [];
  final List<ShowcaseModel> leftColumn = [];

  @override
  void initState() {
    // WidgetsBinding.instance!.addPostFrameCallback((_) async {
    loadData();
    // });
    super.initState();
  }

  void loadData() async {
    String data = await rootBundle.loadString('json/showcase.json');
    List jsonResult = json.decode(data);
    for (var element in jsonResult) {
      showcase.add(ShowcaseModel.fromMap(element));
    }
    leftColumn.addAll(showcase.getRange(0, showcase.length ~/ 2));
    showcase.removeRange(0, showcase.length ~/ 2);
    setState(() {});
    logger.i(jsonResult);
  }

  @override
  void dispose() {
    logger.v('disposed');
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      color: darkBackground,
      child: SingleChildScrollView(
          child: Column(children: [
        const SizedBox(
          height: defaultPadding * 2,
        ),
        Padding(
          padding: const EdgeInsets.all(defaultPadding * 2),
          child: SizedBox(
            width: defaultPadding * 40,
            child: Column(
              mainAxisSize: MainAxisSize.min,
              children: [
                Text('SHOWCASE',
                    style: Theme.of(context)
                        .textTheme
                        .headline5!
                        .copyWith(color: darkPrimary)),
                Divider(
                  color: darkPrimary.withOpacity(0.2),
                ),
              ],
            ),
          ),
        ),
        const SizedBox(
          height: defaultPadding,
        ),
        Layout.ismobile
            ? Column(
                children: data(),
              )
            : Row(
                mainAxisAlignment: MainAxisAlignment.center,
                crossAxisAlignment: CrossAxisAlignment.start,
                children: data(),
              )
      ])),
    );
  }

  List<Widget> data() {
    return [
      Column(
        children: [
          ...List.generate(
              leftColumn.length,
              (index) => Padding(
                    padding: const EdgeInsets.all(defaultPadding * 2),
                    child: PostCard(
                      dark: index % 2 == 1 ? true : false,
                      showcase: leftColumn[index],
                    ),
                  )),
        ],
      ),
      Column(
        children: [
          const SizedBox(
            height: defaultPadding * 5,
          ),
          ...List.generate(
              showcase.length,
              (index) => Padding(
                    padding: const EdgeInsets.all(defaultPadding * 2),
                    child: PostCard(
                      dark: index % 2 == 0 ? true : false,
                      showcase: showcase[index],
                    ),
                  )),
        ],
      )
    ];
  }
}
