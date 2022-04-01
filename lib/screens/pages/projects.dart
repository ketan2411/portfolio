import 'dart:convert';
import 'dart:developer';

import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:logger/logger.dart';

import 'package:portfolio_flutter/constants.dart';
import 'package:portfolio_flutter/model/project_model.dart';
import 'package:portfolio_flutter/screens/project_description.dart';
import 'package:portfolio_flutter/theme.dart';

class Projects extends StatefulWidget {
  const Projects({
    Key? key,
  }) : super(key: key);

  @override
  State<Projects> createState() => _ProjectsState();
}

class _ProjectsState extends State<Projects> {
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

  final List<ProjectModel> projects = [];

  @override
  void initState() {
    // WidgetsBinding.instance!.addPostFrameCallback((_) async {
    loadData();
    // });
    super.initState();
  }

  void loadData() async {
    try {
      String data = await rootBundle.loadString('json/projects.json');
      List jsonResult = json.decode(data);
      for (var element in jsonResult) {
        projects.add(ProjectModel.fromMap(element));
      }
      setState(() {});
      logger.i(jsonResult);
    } catch (e, s) {
      log(e.toString());
      log(s.toString());
    }
  }

  @override
  void dispose() {
    logger.v('disposed');
    super.dispose();
  }

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
                projects.length,
                (index) => Padding(
                      padding: const EdgeInsets.all(defaultPadding / 2),
                      child: ProjectDescription(
                        reverse: MediaQuery.of(context).size.width < 800
                            ? false
                            : index % 2 == 1
                                ? true
                                : false,
                        project: projects[index],
                      ),
                    )),
          ],
        )
      ]),
    );
  }
}
