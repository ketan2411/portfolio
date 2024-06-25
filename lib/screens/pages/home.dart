// ignore_for_file: file_names

import 'dart:developer';
import 'package:flutter/material.dart';
import 'package:flutter/scheduler.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:portfolio_flutter/constants.dart';
import 'package:portfolio_flutter/provider/quiz_provider.dart';
import 'package:portfolio_flutter/screens/routes/projects.dart';
import 'package:portfolio_flutter/screens/routes/showcase.dart';
import 'package:portfolio_flutter/theme.dart';
import 'package:portfolio_flutter/utils/strings.dart';
import 'package:provider/provider.dart';
import 'package:url_launcher/url_launcher.dart';

class Home extends StatefulWidget {
  static bool ismobile = false;
  const Home({Key? key}) : super(key: key);

  @override
  State<Home> createState() => _HomeState();
}

class _HomeState extends State<Home> {
  @override
  void initState() {
    Provider.of<QuizProvider>(context, listen: false).setLiveQuiz();
    SchedulerBinding.instance.addPostFrameCallback((_) {
      for (var e in [
        '/1.png',
        '/2.png',
        '/3.png',
        '/4.png',
        '/attribute.png',
        '/parallax_logo.png',
        '/glow.png',
        slotMachinBG,
        slotMachinPlayButton,
        slotMachineImage,
        slotMachineHandle,
        slotMachineBall,
        quizBgBlur,
        quizBg,
      ]) {
        precacheImage(
          AssetImage(e),
          context,
          onError: (exception, stackTrace) => log('chache failed'),
        ).then((value) => log('cached in parallax $e'));
      }
    });

    super.initState();
  }

  @override
  void didChangeDependencies() {
    super.didChangeDependencies();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.grey[900],
      bottomNavigationBar: Container(
        height: 40,
        color: darkBackground,
        child: SizedBox(
          // height: 50,
          child: Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Text(
                'Made with ',
                style: TextStyle(color: darkPrimary),
              ),
              const Padding(
                padding: EdgeInsets.only(right: 42, left: 6),
                child: FaIcon(
                  FontAwesomeIcons.solidHeart,
                  color: Colors.redAccent,
                ),
              )
            ],
          ),
        ),
      ),
      body: Center(
        child: SingleChildScrollView(
          child: Column(
            mainAxisSize: MainAxisSize.min,
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              // Spacer(),
              SizedBox(
                height: MediaQuery.of(context).size.height * 0.2,
              ),
              Wrap(
                runAlignment: WrapAlignment.center,
                alignment: WrapAlignment.center,
                children: [
                  const FlutterLogo(
                    style: FlutterLogoStyle.markOnly,
                    size: 200,
                  ),
                  Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      crossAxisAlignment: CrossAxisAlignment.center,
                      children: [
                        Text(
                          'Hi I\'m',
                          style: Theme.of(context)
                              .textTheme
                              .titleLarge!
                              .copyWith(color: Colors.white),
                        ),
                        Text(
                          'Ketan Sharma',
                          style: Theme.of(context)
                              .textTheme
                              .headlineMedium!
                              .copyWith(
                                  fontWeight: FontWeight.bold,
                                  color: darkPrimary),
                        ),
                        Text(
                          'Flutter Developer',
                          style: Theme.of(context)
                              .textTheme
                              .displaySmall!
                              .copyWith(
                                foreground: Paint()
                                  ..style = PaintingStyle.stroke
                                  ..strokeWidth = 1
                                  ..color = Colors.white,
                              ),
                        )
                      ],
                    ),
                  ),
                ],
              ),
              const SizedBox(
                height: 100,
              ),
              Wrap(
                runAlignment: WrapAlignment.spaceEvenly,
                alignment: WrapAlignment.spaceEvenly,
                crossAxisAlignment: WrapCrossAlignment.center,
                children: [
                  panel('Projects', () {
                    Navigator.pushNamed(context, Projects.routeName);
                  }),
                  contactPanel(context),
                  panel('Showcase', () {
                    Navigator.pushNamed(context, Showcase.routeName);
                  }),
                ],
              ),
              SizedBox(
                height: MediaQuery.of(context).size.height * 0.1,
              ),
            ],
          ),
        ),
      ),
    );
  }

  Widget contactPanel(BuildContext context) {
    return Container(
      height: 100,
      width: 300,
      alignment: Alignment.center,
      decoration: BoxDecoration(
          color: Colors.white10, borderRadius: BorderRadius.circular(5)),
      child: Row(
          mainAxisSize: MainAxisSize.min,
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            IconButton(
              onPressed: () async {
                await launch('mailto:ketansharma587@gmail.com');
              },
              icon: Icon(
                FontAwesomeIcons.envelope,
                size: 30,
                color: Theme.of(context).primaryColor,
              ),
            ),
            const SizedBox(
              width: 30,
            ),
            IconButton(
              onPressed: () async {
                await launch('https://github.com/ketan2411');
              },
              icon: FaIcon(
                FontAwesomeIcons.github,
                size: 30,
                color: Theme.of(context).primaryColor,
              ),
            ),
            const SizedBox(
              width: 30,
            ),
            IconButton(
              onPressed: () async {
                await launch(
                    'https://www.linkedin.com/in/ketan-sharma-602134170/');
              },
              icon: FaIcon(
                FontAwesomeIcons.linkedin,
                size: 30,
                color: Theme.of(context).primaryColor,
              ),
            ),
          ]),
    );
  }

  Widget panel(String text, void Function() onPressed) {
    return Padding(
      padding: const EdgeInsets.all(defaultPadding),
      child: InkWell(
        onTap: () => onPressed(),
        child: Container(
          height: 100,
          width: MediaQuery.of(context).size.width < 800 ? 300 : 200,
          alignment: Alignment.center,
          decoration: BoxDecoration(
              color: Colors.white10, borderRadius: BorderRadius.circular(5)),
          child: Text(
            text,
            style: Theme.of(context)
                .textTheme
                .titleLarge!
                .copyWith(color: darkPrimary),
          ),
        ),
      ),
    );
  }
}
