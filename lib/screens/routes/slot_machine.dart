// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'dart:async';
import 'dart:math';

import 'package:carousel_slider/carousel_slider.dart';
import 'package:flutter/material.dart';
// import 'package:lottie/lottie.dart';

final GlobalKey<ScaffoldState> _slotScaffoldKey = GlobalKey<ScaffoldState>();

class SlotMachine extends StatefulWidget {
  static const routeName = '/slotMachine';
  const SlotMachine({
    Key? key,
  }) : super(key: key);

  @override
  State<SlotMachine> createState() => _SlotMachineState();
}

class _SlotMachineState extends State<SlotMachine> {
  int rewardValue = 0;
  bool startSpinner = false;
  bool _disableButton = false;
  List items = [
    'assets/banana.png',
    'assets/cherry.png',
    'assets/bell.png',
    'assets/melon.png',
  ];

  final List<CarouselController> _carouselController = [
    CarouselController(),
    CarouselController(),
    CarouselController()
  ];

  @override
  void initState() {
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        key: _slotScaffoldKey,
        backgroundColor: Colors.transparent,
        appBar: AppBar(
            automaticallyImplyLeading: false,
            actions: const [
            ],
            title: const Text('Slot Machine')),
        body: Padding(
          padding: const EdgeInsets.all(8),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              slotMachine(context),
              DisableButton(
                disable: _disableButton,
                child: ElevatedButton.icon(
                    icon: const Icon(Icons.place_outlined),
                    label: const Text('Run Slot'),
                    onPressed: !_disableButton
                        ? () async {
                            if (!startSpinner) {
                              setState(() {
                                startSpinner = true;
                                _disableButton = true;
                              });
                              await Future.delayed(
                                  const Duration(milliseconds: 1000));
                              stopSlotMachine();
                            }
                          }
                        : null),
              )
            ],
          ),
        ));
  }

  Align slotMachine(BuildContext context) {
    return Align(
      alignment: Alignment.center,
      child: SizedBox(
        width: MediaQuery.of(context).size.width - 50,
        child: Stack(
          alignment: Alignment.center,
          children: [
            slotRowTab(Colors.white10),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: [
                ...List.generate(
                  3,
                  (index) => SizedBox(
                      height: 175,
                      width: 80,
                      child: CarouselSlider(
                        carouselController: _carouselController[index],
                        options: CarouselOptions(
                            onPageChanged: (index, _) {
                              //? yess works
                              // developer.log('current index $index');
                            },
                            enlargeCenterPage: true,
                            autoPlay: startSpinner,
                            aspectRatio: 1,
                            viewportFraction: 0.3,
                            scrollDirection: Axis.vertical,
                            enableInfiniteScroll: true),
                        items: List.generate(
                            items.length,
                            (index) => Image.asset(
                                  items[index],
                                  fit: BoxFit.contain,
                                  height: 60,
                                  width: 60,
                                )),
                      )),
                )
              ],
            ),
            Column(
              mainAxisSize: MainAxisSize.min,
              children: [
                slotRowTab(
                  Theme.of(context).backgroundColor.withOpacity(0.4),
                ),
                slotRowTab(Colors.transparent),
                slotRowTab(
                  Theme.of(context).backgroundColor.withOpacity(0.4),
                )
              ],
            ),
            // Image.asset('assets/images/slot_machine/frame.png'),
          ],
        ),
      ),
    );
  }

  void stopSlotMachine() {
    setState(() {
      startSpinner = false;
    });
    Future.wait([
      ...List.generate(_carouselController.length, (index) {
        return _carouselController[index]
            .animateToPage(Random().nextInt(7) + 150,
                curve: Curves.easeOutExpo,
                duration: Duration(
                  seconds: Random().nextInt(7) + 5,
                )); //TODO_sound here
      })
    ]).then((_) {
      showDialog(context: context, builder: (context) => data());
      setState(() {
        _disableButton = false;
      });
    });
  }

  Container slotRowTab(Color color) {
    return Container(
      height: 60,
      color: color,
    );
  }

  Widget data() {
    // return Dialog(
    //   child: Material(child: Text('kund')),
    // );
    return GestureDetector(
      onTap: () => Navigator.pop(context),
      child: Stack(
        alignment: Alignment.topCenter,
        children: [
          // Visibility(
          //   visible: true,
          //   child: Lottie.asset(
          //     'assets/animations/confetti2.json',
          //     repeat: true,
          //   ),
          // ),
          Material(
            type: MaterialType.transparency,
            child: Column(
              mainAxisSize: MainAxisSize.min,
              children: [
                SizedBox(
                  height: MediaQuery.of(context).size.height * 0.2,
                ),
               const Text(
                  'Won',
                ),
                Text(
                  '$rewardValue Qoins',
                ),
              ],
            ),
          )
        ],
      ),
    );
  }
}

class DisableButton extends StatefulWidget {
  final Widget child;
  final bool disable;
  const DisableButton({
    Key? key,
    required this.child,
    this.disable = false,
  }) : super(key: key);

  @override
  State<DisableButton> createState() => _DisableButtonState();
}

class _DisableButtonState extends State<DisableButton> {
  @override
  Widget build(BuildContext context) {
    return Opacity(
      opacity: widget.disable ? 0.5 : 1,
      child: IgnorePointer(ignoring: widget.disable, child: widget.child),
    );
  }
}
