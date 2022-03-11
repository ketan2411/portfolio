import 'dart:async';
import 'dart:developer';

import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:portfolio_flutter/constats.dart';

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
        SizedBox(
          height: MediaQuery.of(context).size.height,
          child: Column(
            // mainAxisSize: MainAxisSize.min,
            children: [
              Expanded(
                child: LayoutBuilder(builder: (context, constraints) {
                  return constraints.maxWidth > 800
                      ? Row(
                          crossAxisAlignment: CrossAxisAlignment.center,
                          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                          children: [
                            infoBox(context),
                            Container(
                              width: 2,
                              color: Colors.black,
                              height: MediaQuery.of(context).size.height * 0.5,
                            ),
                            contactBox(context),
                          ],
                        )
                      : Column(
                          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                          children: [
                            infoBox(context),
                            const Divider(
                              height: 40,
                              thickness: 2,
                              indent: 16,
                              endIndent: 16,
                              color: Colors.black,
                            ),
                            contactBox(context),
                          ],
                        );
                }),
              ),
              Container(
                height: 50,
                color: Colors.black,
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    const Text('Made with '),
                    AnimatedSwitcher(
                      duration: const Duration(milliseconds: 700),
                      child: _switch
                          ? const Padding(
                              padding: EdgeInsets.symmetric(horizontal: 24),
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
              )
            ],
          ),
        )
      ],
    );
  }

  Column contactBox(BuildContext context) {
    return Column(
      mainAxisSize: MainAxisSize.min,
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        TextButton.icon(
            onPressed: () {},
            icon: const Icon(
              Icons.phone,
              color: Colors.black,
            ),
            label: Row(
              mainAxisSize: MainAxisSize.min,
              children: [
                const SizedBox(
                  width: 16,
                ),
                Text(
                  '+91 7014265301',
                  style: Theme.of(context)
                      .textTheme
                      .bodyText1!
                      .copyWith(color: Colors.black),
                ),
              ],
            )),
        const SizedBox(
          height: 8,
        ),
        TextButton.icon(
            onPressed: () {},
            icon: const Icon(
              Icons.mail_outline,
              color: Colors.black,
            ),
            label: Row(
              mainAxisSize: MainAxisSize.min,
              children: [
                const SizedBox(
                  width: 16,
                ),
                Text(
                  'ketansharma587@gmail.com',
                  style: Theme.of(context)
                      .textTheme
                      .bodyText1!
                      .copyWith(color: Colors.black),
                ),
              ],
            )),
        const SizedBox(
          height: 8,
        ),
        TextButton.icon(
            onPressed: () {},
            icon: const FaIcon(
              FontAwesomeIcons.github,
              color: Colors.black,
            ),
            label: Row(
              mainAxisSize: MainAxisSize.min,
              children: [
                const SizedBox(
                  width: 16,
                ),
                Text(
                  '@ketan2411',
                  style: Theme.of(context)
                      .textTheme
                      .bodyText1!
                      .copyWith(color: Colors.black),
                ),
              ],
            )),
        const SizedBox(
          height: 8,
        ),
        TextButton.icon(
            onPressed: () {},
            icon: const FaIcon(
              FontAwesomeIcons.linkedin,
              color: Colors.black,
            ),
            label: Row(
              mainAxisSize: MainAxisSize.min,
              children: [
                const SizedBox(
                  width: 16,
                ),
                Text(
                  '/ketansharma587',
                  style: Theme.of(context)
                      .textTheme
                      .bodyText1!
                      .copyWith(color: Colors.black),
                ),
              ],
            )),
      ],
    );
  }

  SizedBox infoBox(BuildContext context) {
    return SizedBox(
      width: 300,
      // height: 400,
      child: Text(
        info,
        style: Theme.of(context)
            .textTheme
            .bodyText1!
            .copyWith(color: Colors.black),
      ),
    );
  }
}

class _AboutState extends State<About> {
  PointerHoverEvent _pointerHoverEvent = const PointerHoverEvent();
  double x = 0;
  double y = 0;

  @override
  Widget build(BuildContext context) {
    return Container(
      color: Colors.white,
      child: MouseRegion(
        onEnter: (event) => log(event.toStringFull()),
        onExit: (event) => log(event.toStringFull()),
        onHover: (event) {
          setState(() {
            _pointerHoverEvent = event;
            x = x + _pointerHoverEvent.localDelta.dy;
            y = y + _pointerHoverEvent.localDelta.dx;
            // log(x.toString());
            // log(y.toString());
          });
          // log(' dir ${_pointerHoverEvent.localDelta.direction}');
          // log(' dst ${_pointerHoverEvent.localDelta.distance}');
          // log('dx ${_pointerHoverEvent.localDelta.dx}');
          // log('dstsqr ${_pointerHoverEvent.localDelta.distanceSquared}');
        },
        child: Stack(
          alignment: AlignmentDirectional.center,
          children: [
            // Positioned(
            //   top: size.height / 2 + x * 0.1 - 50,
            //   left: size.width / 2 + y * 0.1 - 50,
            //   child: Container(
            //     height: 100,
            //     width: 100,
            //     color: Colors.red,
            //   ),
            //   //  duration: Duration.zero
            // ),
            // Positioned(
            //   top: size.height / 2 + x * 0.2 - 75,
            //   left: size.width / 2 + y * 0.2 - 75,
            //   child: Container(
            //     height: 150,
            //     width: 150,
            //     color: Colors.red,
            //   ),
            //   //  duration: Duration.zero
            // ),
            // Positioned(
            //   top: size.height / 2 + x * 0.3 - 200,
            //   left: size.width / 2 + y * 0.3 - 200,
            //   child: Container(
            //     height: 400,
            //     width: 400,
            //     color: Colors.amber.withOpacity(0.2),
            //   ),
            //   //  duration: Duration.zero
            // ),
            // Positioned(
            //   top: size.height / 2 + x * 0.4 - 150,
            //   left: size.width / 2 + y * 0.4 - 150,
            //   child: Container(
            //     height: 300,
            //     width: 300,
            //     color: Colors.blue.withOpacity(0.1),
            //   ),
            //   //  duration: Duration.zero
            // ),
            // Positioned(
            //   top: size.height / 2 + x * 0.5 - 100,
            //   left: size.width / 2 + y * 0.5 - 100,
            //   child: Container(
            //     height: 200,
            //     width: 200,
            //     color: Colors.green.withOpacity(0.3),
            //   ),
            //   //  duration: Duration.zero
            // ),
            // Align(
            //   alignment: Alignment(y * 0.001, x * 0.002),
            //   // top: size.height / 2 + x * 0.5 - 100,
            //   // left: size.width / 2 + y * 0.5 - 100,
            //   child: Container(
            //     height: 200,
            //     width: 200,
            //     color: Colors.green.withOpacity(1),
            //   ),
            //   //  duration: Duration.zero
            // ),
            Align(
              alignment: Alignment(y * 0.001, x * 0.002),
              // top: size.height / 2 + x * 0.5 - 100,
              // left: size.width / 2 + y * 0.5 - 100,
              child: Transform(
                transform: Matrix4.identity()
                  ..setEntry(3, 2, 0.001)
                  ..rotateX(x / 1000)
                  ..rotateY(-y / 1000),
                alignment: FractionalOffset.center,
                child: Container(
                  height: 150,
                  width: 150,
                  color: Colors.blue.withOpacity(1),
                ),
              ),
              //  duration: Duration.zero
            ),
            Positioned(
                top: 10 + x,
                left: 10 + y,
                child: Container(
                  color: Colors.black26,
                  height: 10,
                  width: 10,
                ))
            // const Positioned(
            //     left: 150,
            //     child: Placeholder(
            //       fallbackHeight: 500,
            //     )),
            // Positioned(
            //     right: 150,
            //     child: SizedBox(
            //       // width: MediaQuery.of(context).size.width ,
            //       width: 400,
            //       child: Column(
            //         children: [
            //          const Text('Hi, I am '),
            //           Text(
            //             'Ketan Sharma',
            //             style: Theme.of(context).textTheme.headline6,
            //           ),
            //           Text(
            //               'Lorem ipsum dolor sit amet, consectetur adipiscing elit. Nulla elit ligula, euismod sed mi et, congue tempor purus. Vivamus commodo sem facilisis, convallis felis ac, fringilla neque. Curabitur ut vehicula leo, eget efficitur ante. Donec bibendum tincidunt nisi et tincidunt. Suspendisse sed nunc ut neque mollis efficitur. Nulla vestibulum auctor tellus, ut dapibus tortor auctor ac. Morbi a orci felis. Nam dictum est at ligula posuere, vitae ultrices augue imperdiet. Cras porta ac nisi sit amet imperdiet. Fusce ac posuere lectus. Ut at pellentesque diam. Nulla facilisi.')
            //         ],
            //       ),
            //     ))
          ],
        ),
      ),
    );
  }
}
