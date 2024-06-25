import 'package:flutter/material.dart';
import 'package:logger/logger.dart';
import 'package:portfolio_flutter/constants.dart';
import 'package:portfolio_flutter/data.dart';
import 'package:portfolio_flutter/screens/project_description_map.dart';
import 'package:portfolio_flutter/theme.dart';
import 'package:portfolio_flutter/utils/logger.dart';

class Projects extends StatefulWidget {
  static const routeName = '/projects';

  const Projects({Key? key}) : super(key: key);

  @override
  State<Projects> createState() => _ProjectsState();
}

class _ProjectsState extends State<Projects> {
  PageController controller = PageController(initialPage: 0);

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
  final List<Color> colors = [
    Colors.blueAccent,
    Colors.orangeAccent,
    Colors.greenAccent,
    Colors.purpleAccent,
    Colors.indigoAccent,
  ];
  int _currentPage = 0;

  @override
  void initState() {
    super.initState();
  }

  setPage() {
    Future.delayed(Durations.short2, () {
      setState(() {
        _currentPage = controller.page?.toInt() ?? 0;
      });
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      extendBody: true,
      bottomNavigationBar: buttonNav(),
      backgroundColor: scaffoldBackground,
      appBar: AppBar(
          // title: const Text('Projects'),
          ),
      extendBodyBehindAppBar: true,
      body: AnimatedContainer(
        duration: Durations.medium4,
        color: colors[(_currentPage)],
        child: PageView.builder(
          controller: controller,
          itemCount: projectsDATA.length,
          itemBuilder: (context, index) {
            return ProjectDescriptionMAP(
              project: projectsDATA[index],
              index: index,
            );
          },
        ),
      ),
    );
  }

  Padding buttonNav() {
    return Padding(
      padding: const EdgeInsets.all(defaultPadding),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.center,
        // mainAxisSize: MainAxisSize.min,
        children: [
          IconButton(
              onPressed: () {
                controller
                    .previousPage(
                        duration: Durations.medium4, curve: Curves.easeOut)
                    .then((value) => setPage());
              },
              icon: const Icon(Icons.arrow_circle_left_outlined)),
          IconButton(
              onPressed: () {
                controller
                    .nextPage(
                        duration: Durations.medium4, curve: Curves.easeOut)
                    .then((value) => setPage());
              },
              icon: const Icon(Icons.arrow_circle_right_outlined))
        ],
      ),
    );
  }
}
