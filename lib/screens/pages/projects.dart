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
    return Scaffold(
      backgroundColor: scaffoldBackground,
      appBar: AppBar(
        title: const Text('Projects'),
      ),
      extendBodyBehindAppBar: true,
      body: PageView.builder(
        itemCount: projectsDATA.length,
        itemBuilder: (context, index) {
          return ProjectDescriptionMAP(
            reverse: MediaQuery.of(context).size.width < 800
                ? false
                : index % 2 == 1
                    ? true
                    : false,
            project: projectsDATA[index],
          );
        },
      ),
    );
  }
}
