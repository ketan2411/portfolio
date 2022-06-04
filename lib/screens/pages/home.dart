// ignore_for_file: file_names

import 'dart:async';
import 'dart:developer';

import 'package:flutter/material.dart';
import 'package:flutter_neumorphic/flutter_neumorphic.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:parallax_example/main.dart';
import 'package:portfolio_flutter/constants.dart';
import 'package:portfolio_flutter/screens/pages/projects.dart';
import 'package:portfolio_flutter/screens/pages/showcase.dart';
import 'package:portfolio_flutter/theme.dart';
import 'package:url_launcher/url_launcher.dart';

class Home extends StatefulWidget {
  const Home({Key? key}) : super(key: key);

  @override
  State<Home> createState() => _HomeState();
}

class _HomeState extends State<Home> {
  bool _switch = false;

  @override
  void initState() {
    Timer.periodic(const Duration(seconds: 2), (timer) {
      if (mounted) {
        setState(() {
          _switch = !_switch;
        });
      }
    });
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
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
              AnimatedSwitcher(
                duration: const Duration(milliseconds: 700),
                child: _switch
                    ? const Padding(
                        padding: EdgeInsets.only(right: 42, left: 6),
                        child: FaIcon(
                          FontAwesomeIcons.solidHeart,
                          color: Colors.redAccent,
                        ),
                      )
                    : const FlutterLogo(
                        size: 72,
                        style: FlutterLogoStyle.horizontal,
                      ),
              )
            ],
          ),
        ),
      ),
      body: Container(
        // alignment: Alignment.center,
        height: MediaQuery.of(context).size.height,
        width: MediaQuery.of(context).size.width,
        color: darkBackground,
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
                              .copyWith(
                                  fontWeight: FontWeight.bold,
                                  color: darkPrimary),
                        ),
                        Text(
                          'Flutter Developer',
                          style:
                              Theme.of(context).textTheme.headline3!.copyWith(
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
              SizedBox(
                height: 100,
              ),
              Wrap(
                runAlignment: WrapAlignment.spaceEvenly,
                alignment: WrapAlignment.spaceEvenly,
                crossAxisAlignment: WrapCrossAlignment.center,
                children: [
                  panel('Projects', () {
                    Navigator.push(context,
                        MaterialPageRoute(builder: (context) => Projects()));
                  }),
                  contactPanel(context),
                  panel('Showcase', () {
                    Navigator.push(context,
                        MaterialPageRoute(builder: (context) => Showcase()));
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
            const SizedBox(
              width: 30,
            ),
            IconButton(
              onPressed: () async {
                await launch(
                    'https://www.linkedin.com/in/ketan-sharma-602134170/');
              },
              icon: FaIcon(
                FontAwesomeIcons.codepen,
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
          width: 200,
          alignment: Alignment.center,
          decoration: BoxDecoration(
              color: Colors.white10, borderRadius: BorderRadius.circular(5)),
          child: Text(
            text,
            style: Theme.of(context)
                .textTheme
                .headline6!
                .copyWith(color: darkPrimary),
          ),
        ),
      ),
    );
  }
}
