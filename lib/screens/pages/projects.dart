import 'dart:convert';
import 'dart:developer';

import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:logger/logger.dart';

import 'package:portfolio_flutter/constants.dart';
import 'package:portfolio_flutter/model/project_model.dart';
import 'package:portfolio_flutter/screens/project_description.dart';
import 'package:portfolio_flutter/screens/project_description_map.dart';
import 'package:portfolio_flutter/theme.dart';

class Projects extends StatelessWidget {
  // const Projects({
  //   Key? key,
  // }) : super(key: key);

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
    // super.initState();
  }

  final List<Map> projectsDATA = [
    {
      "title": "Qlan",
      "subtitle": "The Gamer's Social Network",
      "screenshots": [
        "assets/images/qlan/1.jpg",
        "assets/images/qlan/2.jpg",
        "assets/images/qlan/3.jpg",
        "assets/images/qlan/4.jpg",
        "assets/images/qlan/5.jpg",
        "assets/images/qlan/6.jpg",
        "assets/images/qlan/7.jpg",
        "assets/images/qlan/8.jpg"
      ],
      "tags": ["Flutter"],
      "link": "https://play.google.com/store/apps/details?id=com.qlan",
      "description":
          "Qlan is a social networking and chat communication app dedicated to gamers. It is suited for everyone who is looking to collaborate or network with other gamers through chat. Users can create custom profiles, sync their in-game statistics, access AI based matchmaking, build squads, share gaming content and much more.\n**Key Responsibilities:**\n\n - Full application setup.\n - Mentorship over the duration of development.",
      "year": "2022"
    },
    {
      "title": "Infoflight",
      "subtitle": "Resource Management and Resume Builder Web App",
      "screenshots": [
        "assets/images/infoflight/1.png",
        "assets/images/infoflight/2.png",
        "assets/images/infoflight/3.png",
        "assets/images/infoflight/4.png",
        "assets/images/infoflight/5.png"
      ],
      "tags": ["Flutter", "Firebase"],
      "description":
          "Infoflight is an In-house webapp for managing resources. It manages kinds of resource such as technology content and tutorials, Project documentation, Resume builder and employee project allocation.\nResumes can be sent to clients and can be modified at runtime.Content display is achieved using markdown.\n**Key Responsibilities:**\n\n- Full application setup with flutter and firebase.\n- UI creation.\n- Mentorship over the duration of development.\n",
      "year": "2021"
    },
    {
      "title": "TRP ",
      "subtitle": "Inventory Management App",
      "screenshots": [
        "assets/images/TRP/1.png",
        "assets/images/TRP/2.png",
        "assets/images/TRP/3.png",
        "assets/images/TRP/4.png"
      ],
      "tags": ["Flutter", "Firebase", "CSV"],
      "description":
          "Inventory management app for a clothing store.It Manages to store all the stock, calculate profit or loss, generate invoices and sales csv data.\n It also has a feature of custom billing calculator.",
      "year": "2020"
    },
    {
      "title": "AR Menu",
      "subtitle": "Food Orddering App with AR features",
      "screenshots": [
        "assets/images/armenu/1.png",
        "assets/images/armenu/2.png",
        "assets/images/armenu/3.png",
        "assets/images/armenu/4.png",
        "assets/images/armenu/5.png"
      ],
      "tags": ["Flutter", "Unity", "ARCore", "Python", "Blender"],
      "description":
          "AR Menu is a concept application for mobile devices. Users can interact with a 3D model of their food before ordering, the functionality also as AR for supported devices. 3D models are generated at backend through a pipeline. Pipeline consists of model generation using photogrammetry methods and later optimising for mobile devices.\n**Key Responsibilities:**\n+ Model generating pipelines setup using python.\n+ Displaying 3d model in flutter app.\n+ AR Viewer and Interaction with unity.",
      "year": "2020"
    }
  ];
  void loadData() async {
    try {
      String data = await rootBundle.loadString('json/projects.json');
      List jsonResult = json.decode(data);
      for (var element in jsonResult) {
        projects.add(ProjectModel.fromMap(element));
      }
      // setState(() {});
      logger.i(jsonResult);
    } catch (e, s) {
      log(e.toString());
      log(s.toString());
    }
  }

  @override
  void dispose() {
    logger.v('disposed');
    // super.dispose();
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
