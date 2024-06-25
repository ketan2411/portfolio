// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'dart:async';
import 'dart:math';

import 'package:carousel_slider/carousel_slider.dart';
import 'package:flutter/material.dart';
import 'package:just_audio/just_audio.dart';
import 'package:lottie/lottie.dart';
import 'package:portfolio_flutter/constants.dart';
import 'package:portfolio_flutter/screens/routes/components/bulb_widget.dart';
import 'package:portfolio_flutter/theme.dart';
import 'package:portfolio_flutter/utils/strings.dart';
import 'package:responsive_sizer/responsive_sizer.dart';
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

class _SlotMachineState extends State<SlotMachine>
    with TickerProviderStateMixin {
  final buttonSound = AudioPlayer(); // Create a player
  final slotMachineSound = AudioPlayer(); // Create a player
  final winningSound = AudioPlayer();
  bool blinkAll = false;
  bool buttonTapDown = false;
  final height = 800.0;
  final width = 400.0;

  late AnimationController _ballController;
  late AnimationController _rainLottieCtlr;
  late Animation<double> _animation;

  int rewardValue = 0;
  bool startSpinner = false;
  bool _disableButton = false;
  List items = [
    'assets/slotmachine/banana.png',
    'assets/slotmachine/cherry.png',
    'assets/slotmachine/bell.png',
    'assets/slotmachine/melon.png',
  ];

  final List<CarouselController> _carouselController = [
    CarouselController(),
    CarouselController(),
    CarouselController()
  ];

  @override
  void initState() {
    _ballController = AnimationController(vsync: this);
    _rainLottieCtlr = AnimationController(vsync: this);
    _animation = Tween(begin: 0.0, end: 1.0).animate(_ballController);
    initiateSound();
    super.initState();
  }

  @override
  void dispose() {
    _ballController.dispose();
    _rainLottieCtlr.dispose();
    slotMachineSound.dispose();
    winningSound.dispose();
    buttonSound.dispose();
    super.dispose();
  }

  void resetSounds() {
    slotMachineSound.stop();
    winningSound.stop();
    buttonSound.stop();
    slotMachineSound.seek(null);
    winningSound.seek(null);
    buttonSound.seek(null);
  }

  void initiateSound() async {
    await slotMachineSound.setAsset(
      // Load a URL
      'assets/slotmachine/machine_run.mp3',
    );
    await winningSound.setAsset(
      // Load a URL
      'assets/slotmachine/jackpot_sound.mp3',
    );
    await buttonSound.setAsset(
      // Load a URL
      'assets/slotmachine/stopping_sound.mp3',
    );
    setSoundVolumne();
  }

  setSoundVolumne({bool mute = false}) {
    if (mute) {
      slotMachineSound.setVolume(0);
      winningSound.setVolume(0);
      buttonSound.setVolume(0);
    } else {
      slotMachineSound.setVolume(0.1);
      winningSound.setVolume(0.5);
      buttonSound.setVolume(0.5);
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        key: _slotScaffoldKey,
        backgroundColor: Colors.grey[800],
        extendBodyBehindAppBar: true,
        appBar: PreferredSize(
            preferredSize: const Size.fromHeight(50),
            child: Row(
              children: [
                IconButton(
                    onPressed: () {
                      Navigator.pop(context);
                    },
                    icon: const Icon(Icons.chevron_left))
              ],
            )),
        body: Stack(
          alignment: Alignment.center,
          // mainAxisAlignment: MainAxisAlignment.spaceEvenly,
          // crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            Opacity(
              opacity: 0.25,
              child: Image.asset(
                slotMachinBG,
                // height: 100.h,
                width: 100.w,
                filterQuality: filterQuality,
                fit: BoxFit.cover,
              ),
            ),
            Transform.scale(
              scale: Device.height > 599 ? 1.2 : 1,
              child: SizedBox(
                height: height,
                width: width,
                child: slotMachine(context),
              ),
            )
          ],
        ));
  }

  slotMachine(BuildContext context) {
    return Container(
      decoration: const BoxDecoration(boxShadow: [
        BoxShadow(offset: Offset(0, 0), spreadRadius: 5, blurRadius: 100)
      ]),
      child: ClipRRect(
        borderRadius: BorderRadius.circular(20.0),
        child: Stack(
          clipBehavior: Clip.none,
          alignment: Alignment.topCenter,
          children: [
            machine(),
            jackpot(),
            handle(),
            ball(),
            if (_rainLottieCtlr.status==AnimationStatus.forward)
              Lottie.asset(
                'assets/slotmachine/coin_animation.json',
                controller: _rainLottieCtlr,
                width: width,
              ),
            button(),
          ],
        ),
      ),
    );
  }

  Positioned button() {
    return Positioned(
      top: height * 0.65,
      child: DisableButton(
        disable: _disableButton,
        child: GestureDetector(
          onTapDown: (_) => setState(() {
            buttonSound.play();
            buttonTapDown = true;
          }),
          onTapCancel: () => setState(() {
            buttonTapDown = false;
          }),
          onTapUp: (details) => setState(() {
            buttonTapDown = false;
          }),
          child: AnimatedScale(
            scale: buttonTapDown ? 0.9 : 1,
            duration: const Duration(milliseconds: 250),
            child: Image.asset(
              slotMachinPlayButton,
              filterQuality: filterQuality,
              width: 100,
            ),
          ),
          onTap: !_disableButton
              ? () async {
                  const cur = Curves.easeInOut;
                  _ballController
                      .animateTo(1,
                          duration: const Duration(milliseconds: 400),
                          curve: cur)
                      .then((_) {
                    _ballController.animateBack(0,
                        duration: const Duration(milliseconds: 400),
                        curve: cur);
                  });
                  if (!startSpinner) {
                    setState(() {
                      slotMachineSound.play();

                      startSpinner = true;
                      _disableButton = true;
                    });
                    await Future.delayed(const Duration(milliseconds: 1000));
                    stopSlotMachine(true);
                  }
                }
              : null,
        ),
      ),
    );
  }

  Image machine() {
    return Image.asset(
      slotMachineImage,
      filterQuality: filterQuality,
      fit: BoxFit.fitHeight,
      // height: 800,
      // width: 300,
    );
  }

  Positioned jackpot() {
    final rollerHeight = height / 4.5;
    return Positioned(
      //change
      top: height * 0.25,
      child: SizedBox(
        height: height / 4.5,
        width: height * 0.27,
        child: FittedBox(
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            children: [
              bulbColumn(
                secondColumnDelay: 0,
                length: 4,
                reverseStrip: 0,
                notblinkAll: blinkAll ? 0 : 1,
              ),
              const SizedBox(
                width: defaultPadding / 2,
              ),
              ...List.generate(
                3,
                (index) => Container(
                  margin: const EdgeInsets.symmetric(
                      horizontal: defaultPadding / 4),
                  decoration: BoxDecoration(
                      gradient: LinearGradient(
                          begin: Alignment.topCenter,
                          end: Alignment.bottomCenter,
                          colors: [
                        Colors.white.withOpacity(0),
                        Colors.white,
                        Colors.white,
                        Colors.white.withOpacity(0),
                      ])),
                  child: Stack(
                    children: [
                      SizedBox(
                        height: rollerHeight,
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
                                    filterQuality: filterQuality,
                                    fit: BoxFit.contain,
                                    height: 60,
                                    width: 60,
                                  )),
                        ),
                      ),
                      Container(
                        height: rollerHeight,
                        width: 80,
                        decoration: BoxDecoration(
                            gradient: LinearGradient(
                                begin: Alignment.topCenter,
                                end: Alignment.bottomCenter,
                                colors: [
                              Colors.black.withOpacity(0.2),
                              Colors.black.withOpacity(0),
                              Colors.black.withOpacity(0),
                              Colors.black.withOpacity(0.2),
                            ])),
                      )
                    ],
                  ),
                ),
              ),
              const SizedBox(
                width: defaultPadding / 2,
              ),
              bulbColumn(
                secondColumnDelay: 240,
                length: 4,
                reverseStrip: 4,
                notblinkAll: blinkAll ? 0 : 1,
              ),
            ],
          ),
        ),
      ),
    );
  }

  Positioned handle() {
    return Positioned(
      right: height * 0.05,
      top: height * 0.37,
      child: AnimatedBuilder(
        builder: (BuildContext context, Widget? child) {
          return Transform(
              //this changes the center to correct position
              origin: const Offset(0, 20),
              alignment: Alignment.center, // Rotate around the center
              transform: Matrix4.identity()
                ..rotateX((_animation.value * 180) * pi / 180),
              child: Image.asset(
                slotMachineHandle,
                filterQuality: filterQuality,
                width: height * 0.02,
              ));
        },
        animation: _ballController,
      ),
    );
  }

  AnimatedBuilder ball() {
    return AnimatedBuilder(
      animation: _ballController,
      builder: (BuildContext context, Widget? child) {
        return Positioned(
            right: height * 0.045,
            top: height * 0.36 + ((height * 0.1) * _animation.value),
            child: SizedBox(
              width: height * 0.02,
              child: GestureDetector(
                onTapDown: (_) => setState(() {
                  buttonSound.play();
                  buttonTapDown = true;
                }),
                onTapCancel: () => setState(() {
                  buttonTapDown = false;
                }),
                onTapUp: (details) => setState(() {
                  buttonTapDown = false;
                }),
                child: Image.asset(
                  slotMachineBall,
                  filterQuality: filterQuality,
                ),
              ),
            ));
      },
    );
  }

  void stopSlotMachine(bool jackpot) {
    setState(() {
      startSpinner = false;
    });
    Future.wait([
      ...List.generate(_carouselController.length, (index) {
        return _carouselController[index]
            .animateToPage(jackpot ? 150 : Random().nextInt(7) + 150,
                curve: Curves.easeOutExpo,
                duration: Duration(
                  seconds: Random().nextInt(7) + 5,
                )); //TODO_sound here
      })
    ]).then((_) {
      // showDialog(context: context, builder: (context) => data());
      if (jackpot) {
        _rainLottieCtlr
            .animateTo(1, duration: const Duration(milliseconds: 1500))
            .then((value) => _rainLottieCtlr.reset());
        Future.delayed(const Duration(milliseconds: 100), () {
          winningSound.play();
        });
      }
      setState(() {
        _disableButton = false;
        blinkAll = true;
      });
      resetSounds();
      Future.delayed(const Duration(seconds: 5), () {
        if (mounted) {
          setState(() {
            blinkAll = false;
          });
        }
      });
    });
  }

  Widget bulbColumn({
    required int secondColumnDelay,
    required int length,
    required int reverseStrip,
    int notblinkAll = 1,
  }) {
    return Column(
      mainAxisSize: MainAxisSize.min,
      crossAxisAlignment: CrossAxisAlignment.center,
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        ...List.generate(
          length,
          (index) => Padding(
            padding: const EdgeInsets.symmetric(
              vertical: 8,
            ),
            child: BulbWidget(
              bulbOn: _disableButton,
              size: 24,
              delay: Duration(
                milliseconds: (secondColumnDelay +
                    (40 * (reverseStrip - index * notblinkAll).abs())),
              ),
            ),
          ),
        ),
        // SizedBox(
        //   height: 3.5.h,
        //   width: 4.h,
        // ),
      ],
    );
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
