import 'package:flutter/material.dart';
import 'package:logger/logger.dart';
import 'package:portfolio_flutter/constants.dart';
import 'package:portfolio_flutter/data.dart';
import 'package:portfolio_flutter/screens/project_description_map.dart';
import 'package:portfolio_flutter/theme.dart';

class Projects extends StatelessWidget {

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


  Projects({Key? key}) : super(key: key);

 


  @override
  Widget build(BuildContext context) {
    return Container(
      color: scaffoldBackground,
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
                Text('PROJECTS',
                    style: Theme.of(context)
                        .textTheme
                        .headline5!
                        .copyWith(color: Colors.black)),
                const Divider(),
              ],
            ),
          ),
        ),
        const SizedBox(
          height: defaultPadding,
        ),
        Column(
          mainAxisAlignment: MainAxisAlignment.start,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            ...List.generate(
                projectsDATA.length,
                (index) => Padding(
                      padding: const EdgeInsets.all(defaultPadding / 2),
                      child: ProjectDescriptionMAP(
                        reverse: MediaQuery.of(context).size.width < 800
                            ? false
                            : index % 2 == 1
                                ? true
                                : false,
                        project: projectsDATA[index],
                      ),
                    ),
                growable: false),
          ],
        )
      ]),
    );
  }
}
