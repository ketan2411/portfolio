import 'package:flutter/material.dart';
import 'package:portfolio_flutter/constants.dart';
import 'package:portfolio_flutter/provider/quiz_provider.dart';
import 'package:portfolio_flutter/screens/routes/quiz/components/animated_progress_bar.dart';
import 'package:portfolio_flutter/screens/routes/quiz/components/option_check_box.dart';
import 'package:portfolio_flutter/screens/routes/quiz/components/options_quiz.dart';
import 'package:portfolio_flutter/screens/routes/quiz/components/ques_widget.dart';
import 'package:portfolio_flutter/screens/routes/quiz/quiz_bg.dart';
import 'package:portfolio_flutter/utils/logger.dart';
import 'package:provider/provider.dart';

class QuizEndScreen extends StatefulWidget {
  const QuizEndScreen({Key? key}) : super(key: key);

  @override
  State<QuizEndScreen> createState() => _QuizEndScreenState();
}

class _QuizEndScreenState extends State<QuizEndScreen> {
  ScrollController iconScrollController = ScrollController();
  PageController controller = PageController(initialPage: 0);
  int _currentPage = 0;

  // int currentQues = 0;
  @override
  void initState() {
    // TODO_implement initState
    // controller.
    iconScrollController.addListener(() {
      appLog(name: 'offset row', log: iconScrollController.offset.toString());
    });
    controller.addListener(() {
      setState(() {
        _currentPage = controller.page?.toInt() ?? 0;
      });
      appLog(name: 'offset', log: controller.offset.toString());
      iconScrollController.animateTo(
        (controller.offset * 0.099),
        duration: const Duration(milliseconds: 200),
        curve: Curves.ease,
      );
    });
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: QuizBg(
        child: Stack(
          children: [
            Image.asset(
              'assets/images/arcade/bg_end.jpg',
              width: double.infinity,
              fit: BoxFit.cover,
            ),
            SingleChildScrollView(
              child: Consumer<QuizProvider>(
                builder: (context, provider, _) {
                  return Column(
                    //risky
                    // mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                    // mainAxisSize: MainAxisSize.min,
                    children: [
                      AppBar(
                        automaticallyImplyLeading: false,
                        title: const Text(
                          'CONGRATULATIONS',
                          style: TextStyle(fontSize: 16),
                        ),
                        actions: [
                          Padding(
                              padding: const EdgeInsets.all(8.0),
                              child: IconButton(
                                  onPressed: () => Navigator.pop(context),
                                  icon: const Icon(
                                    Icons.clear,
                                    color: Colors.red,
                                  )))
                        ],
                      ),
                      header(context, provider),
                      quesBox(provider),
                    ],
                  );
                },
              ),
            ),
          ],
        ),
      ),
    );
  }

  Row header(BuildContext context, QuizProvider provider) {
    return Row(
      // mainAxisAlignment: MainAxisAlignment.spaceEvenly,
      children: [
        const SizedBox(
          width: defaultPadding * 2,
        ),
        Stack(
          alignment: Alignment.bottomCenter,
          clipBehavior: Clip.none,
          children: [
            Transform.scale(
              scale: 1.8,
              child: AnimatedCircularProgress(
                value: (provider.liveQuiz!
                        .where((element) => element.isPlayedCorrect)
                        .length /
                    provider.liveQuiz!.length),
                currentStep: provider.liveQuiz!
                    .where((element) => element.isPlayedCorrect)
                    .length,
                totalSteps: provider.liveQuiz!.length,
              ),
            ),
            Positioned(
              bottom: -16,
              child: Container(
                decoration: BoxDecoration(
                  boxShadow: const [
                    BoxShadow(spreadRadius: 2, color: Colors.black)
                  ],
                  color: Colors.amber,
                  borderRadius: BorderRadius.circular(defaultBorderRadius / 2),
                ),
                padding: const EdgeInsets.all(defaultPadding / 2),
                child: const Text(
                  'Corrects',
                  style: TextStyle(
                    fontSize: 12,
                    fontWeight: FontWeight.bold,
                    color: Colors.black,
                  ),
                ),
              ),
            )
          ],
        ),
        const SizedBox(
          width: defaultPadding * 2,
        ),
        Column(
          mainAxisAlignment: MainAxisAlignment.start,
          crossAxisAlignment: CrossAxisAlignment.start,
          mainAxisSize: MainAxisSize.min,
          children: [
            Padding(
              padding: const EdgeInsets.symmetric(
                vertical: defaultPadding / 2,
              ),
              child: Text(
                'Your Score:',
                style: Theme.of(context).textTheme.bodySmall!.copyWith(
                      color: Colors.white.withOpacity(0.5),
                      fontWeight: FontWeight.bold,
                    ),
              ),
            ),
            Text(
              provider.liveQuiz!
                  .fold<int>(
                    0,
                    (previousValue, element) => previousValue + element.score,
                  )
                  .toString(),
              style: Theme.of(context).textTheme.titleLarge!.copyWith(
                    color: Colors.amber,
                    fontWeight: FontWeight.bold,
                    fontSize: 24,
                    height: 0.8,
                  ),
            ),
            Padding(
              padding: const EdgeInsets.symmetric(
                vertical: defaultPadding / 2,
              ),
              child: Text(
                'Time Taken:',
                style: Theme.of(context).textTheme.bodySmall!.copyWith(
                      color: Colors.white.withOpacity(0.5),
                      fontWeight: FontWeight.bold,
                    ),
              ),
            ),
            Text(
              '${provider.liveQuiz!.fold<int>(
                    0,
                    (previousValue, element) =>
                        previousValue + element.timeTaken,
                  ) / 100} seconds',
              style: Theme.of(context).textTheme.titleLarge!.copyWith(
                    color: Colors.amber,
                    fontWeight: FontWeight.bold,
                    fontSize: 24,
                    height: 0.8,
                  ),
            ),
          ],
        ),
      ],
    );
  }

  Widget quesBox(QuizProvider provider) {
    return Container(
      clipBehavior: Clip.none,
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        mainAxisSize: MainAxisSize.min,
        children: [
          const SizedBox(
            height: defaultPadding,
          ),
          SizedBox(
              height: 65,
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                children: List.generate(
                  provider.liveQuiz!.length,
                  (index) => GestureDetector(
                    onTap: () {
                      controller.animateToPage(
                        index,
                        duration: const Duration(milliseconds: 200),
                        curve: Curves.ease,
                      );
                    },
                    child: Builder(
                      builder: (context) {
                        double scale = _currentPage == index ? 1.5 : 1;
                        double opacity = _currentPage == index ? 1 : 0.5;
                        return Transform.scale(
                          scale: scale,
                          child: Opacity(
                            opacity: opacity,
                            child: OptionCheckBox(
                              isCorrect:
                                  provider.liveQuiz![index].isPlayedCorrect,
                            ),
                          ),
                        );
                      },
                    ),
                  ),
                ),
              )),
          const SizedBox(
            height: defaultPadding,
          ),
          SizedBox(
            height: 425,
            child: PageView.builder(
              physics: const NeverScrollableScrollPhysics(),
              controller: controller,
              itemCount: provider.liveQuiz!.length,
              itemBuilder: (context, index) {
                return Container(
                  margin:
                      const EdgeInsets.symmetric(horizontal: defaultPadding),
                  padding: const EdgeInsets.symmetric(
                    vertical: defaultPadding * 2,
                    horizontal: defaultPadding,
                  ),
                  decoration: BoxDecoration(
                    color: Colors.white.withOpacity(0.05),
                    borderRadius: BorderRadius.circular(defaultBorderRadius),
                  ),
                  child: Column(
                    mainAxisSize: MainAxisSize.min,
                    children: [
                      QuestionWidget(
                        padding: EdgeInsets.zero,
                        text: provider.liveQuiz![index].question,
                      ),
                      const SizedBox(
                        height: defaultPadding / 2,
                      ),
                      OptionsQuiz(
                        thisOption: provider.liveQuiz![index].optA,
                        question: provider.liveQuiz![index],
                        endScreen: true,
                      ),
                      OptionsQuiz(
                        thisOption: provider.liveQuiz![index].optB,
                        question: provider.liveQuiz![index],
                        endScreen: true,
                      ),
                      OptionsQuiz(
                        thisOption: provider.liveQuiz![index].optC,
                        question: provider.liveQuiz![index],
                        endScreen: true,
                      ),
                      OptionsQuiz(
                        thisOption: provider.liveQuiz![index].optD,
                        question: provider.liveQuiz![index],
                        endScreen: true,
                      ),
                    ],
                  ),
                );
              },
            ),
          ),
          // const SizedBox(
          //   height: defaultPadding * 4,
          // ),
        ],
      ),
    );
  }
}
