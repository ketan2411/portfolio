// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'package:animate_do/animate_do.dart';
import 'package:flutter/material.dart';
import 'package:portfolio_flutter/constants.dart';
import 'package:portfolio_flutter/model/quiz_ques_model.dart';
import 'package:portfolio_flutter/provider/quiz_provider.dart';
import 'package:portfolio_flutter/screens/routes/quiz/components/option_check_box.dart';
import 'package:provider/provider.dart';
import 'package:svg_flutter/svg.dart';

class OptionsQuiz extends StatefulWidget {
  final String thisOption;
  final ArcQuizQuesModel question;
  final bool endScreen;
  const OptionsQuiz({
    Key? key,
    required this.question,
    required this.thisOption,
    this.endScreen = false,
  }) : super(key: key);

  @override
  State<OptionsQuiz> createState() => _OptionsQuizState();
}

class _OptionsQuizState extends State<OptionsQuiz>
    with TickerProviderStateMixin {
  late AnimationController bgFadeController;
  late AnimationController iconVisibilityController;
  late AnimationController iconSwingController;
  late Tween<double> animation = Tween(begin: 0, end: 1);
  double bgOpacity = 0;
  bool isCorrect = false;
  bool tapped = false;
  @override
  void initState() {
    super.initState();
    isCorrect = widget.thisOption.compareTo(widget.question.answer) == 0;
    if (widget.endScreen &&
        widget.thisOption.compareTo(widget.question.tappedOption!) == 0) {
      tapped = true;
    }
    bgFadeController = AnimationController(
      duration: const Duration(milliseconds: 750),
      vsync: this,
    );
    iconVisibilityController = AnimationController(
      duration: const Duration(milliseconds: 100),
      vsync: this,
    );
    animation.animate(bgFadeController).addListener(() {
      bgOpacity = bgFadeController.value;

      if (bgFadeController.isAnimating) {
        bgOpacity = 0.5;
      }
      if (bgFadeController.value > 0.8) {
        bgOpacity = 0;
      }
    });
    animation.animate(iconVisibilityController);
    if (widget.endScreen &&
        widget.thisOption.compareTo(widget.question.tappedOption!) == 0) {
      iconVisibilityController.animateTo(1).whenComplete(() {
        iconSwingController.animateTo(1).whenComplete(() {
          // iconSwingController.reset();
          // iconVisibilityController.reset();
          // TODO_an be added upwards
          // bgFadeController.animateTo(1).whenComplete(() {
          //   Future.delayed(const Duration(seconds: 3), () {
          //     bgFadeController.reset();
          //   });
          // });
        });
      });
    }
  }

  @override
  Widget build(BuildContext context) {
    return Container(
        margin: widget.endScreen
            ? null
            : const EdgeInsets.only(
                top: defaultPadding / 2,
                bottom: defaultPadding / 2,
              ),
        width: 400,
        decoration: BoxDecoration(
          gradient: widget.endScreen
              ? null
              : LinearGradient(
                  stops: const [0.5, 1],
                  colors: [
                    Colors.amber.withOpacity(0.2),
                    Colors.amber.withOpacity(0),
                  ],
                ),
        ),
        child: InkWell(
          onTap: tapped || widget.endScreen
              ? null
              : () {
                  if (!tapped) {
                    setState(() {
                      tapped = true;
                    });
                    iconVisibilityController.animateTo(1).whenComplete(() {
                      iconSwingController.animateTo(1).whenComplete(() {
                        // iconSwingController.reset();
                        // iconVisibilityController.reset();
                        // TODO_can be added upwards
                        bgFadeController.animateTo(1).whenComplete(() {
                          Future.delayed(const Duration(seconds: 3), () {
                            bgFadeController.reset();
                          });
                        });
                      });
                    });
                    Provider.of<DataProvider>(context, listen: false)
                        .playQlanQuiz(
                      context,
                      questionId: widget.question.questionID,
                      isCorrect: isCorrect,
                      tappedOption: widget.thisOption,
                    );
                  }
                },
          child: Stack(
            children: [
              if (isCorrect)
                ...[
                  // ArrowParticles(scale: 0.5, left: 20, speed: 0.3),
                  // ArrowParticles(scale: 0.3, top: 12, right: 60, bottom: -40),
                  ArrowParticles(scale: 0.7, right: 20, speed: 2),
                  ArrowParticles(scale: 0.5, top: 1, right: 50, speed: 3),
                  ArrowParticles(
                    scale: 1.5,
                    top: 1,
                    left: 80,
                    bottom: -70,
                    speed: 2,
                  ),
                  ArrowParticles(scale: 0.5, top: -30, left: 160),
                ].map(
                  (e) => AnimatedBuilder(
                    builder: (context, child) {
                      return Positioned(
                        bottom: e.bottom +
                            (10 + 20 * (bgFadeController.value * e.speed)),
                        right: e.right,
                        left: e.left,
                        top: e.top,
                        child: Transform.scale(
                          scale: e.scale,
                          child: AnimatedOpacity(
                            opacity: bgOpacity,
                            duration: const Duration(milliseconds: 200),
                            child: SvgPicture.asset(
                              'assets/images/arcade/Uparrow_on_active_check.svg',
                            ),
                          ),
                        ),
                      );
                    },
                    animation: bgFadeController,
                  ),
                ),
              Row(
                children: [
                  Padding(
                    padding: EdgeInsets.all(
                      widget.endScreen ? 16 : defaultPadding * 1.5,
                    ),
                    child: Stack(
                      clipBehavior: Clip.none,
                      alignment: Alignment.topCenter,
                      children: [
                        CustomPaint(
                          size: const Size(30, 30),
                          painter: RPSCustomPainter(),
                        ),
                        Positioned(
                          top: -30,
                          child: AnimatedBuilder(
                            builder: (context, child) {
                              return ScaleTransition(
                                scale:
                                    animation.animate(iconVisibilityController),
                                child: isCorrect
                                    ? Pulse(
                                        key: ValueKey(widget.thisOption),
                                        controller: (cotrl) =>
                                            iconSwingController = cotrl,
                                        manualTrigger: true,
                                        curve: Curves.easeInExpo,
                                        child: SvgPicture.asset(
                                          'assets/images/arcade/check_icon.svg',
                                        ),
                                      )
                                    : Swing(
                                        key: ValueKey(widget.thisOption),
                                        controller: (cotrl) =>
                                            iconSwingController = cotrl,
                                        manualTrigger: true,
                                        child: SvgPicture.asset(
                                          'assets/images/arcade/uncheck.svg',
                                        ),
                                      ),
                              );
                            },
                            animation: iconVisibilityController,
                          ),
                        ),
                      ],
                    ),
                  ),
                  Padding(
                    padding: const EdgeInsets.all(defaultPadding / 2),
                    child: Builder(
                      builder: (context) {
                        var color = Colors.white;
                        if (tapped) {
                          if (isCorrect) {
                            color = Colors.white;
                          } else {
                            color = const Color(0xfff66e6e);
                          }
                        }
                        return Text(
                          widget.thisOption,
                          style:
                              Theme.of(context).textTheme.bodyMedium!.copyWith(
                                    fontWeight: FontWeight.w600,
                                    color: color,
                                  ),
                        );
                      },
                    ),
                  ),
                ],
              ),
            ],
          ),
        ));
  }
}

class ArrowParticles {
  double speed;
  double scale;
  double? top;
  double? right;
  double bottom;
  double? left;
  ArrowParticles({
    this.speed = 1,
    this.scale = 1,
    this.top,
    this.right,
    this.bottom = 0,
    this.left,
  });
}
