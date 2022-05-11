import 'dart:async';
import 'package:flutter/material.dart';

class About extends StatefulWidget {
  const About({Key? key}) : super(key: key);

  @override
  State<About> createState() => _About2State();
}

class _About2State extends State<About> {
  bool _switch = false;

  @override
  void initState() {
    Timer.periodic(const Duration(seconds: 2), (timer) {
      setState(() {
        _switch = !_switch;
      });
    });
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return ListView(
      children: [
        Container(
          height: MediaQuery.of(context).size.height,
          color: Colors.black,
          child: Row(
            children: [
              const Align(
                alignment: Alignment.centerRight,
                child: FlutterLogo(
                  style: FlutterLogoStyle.markOnly,
                  size: 200,
                ),
              ),
              Align(
                alignment: Alignment.centerLeft,
                child: Padding(
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
                ),
              )
            ],
          ),
        ),
      ],
    );
  }
}