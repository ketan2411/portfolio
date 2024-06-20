import 'dart:async';

import 'package:flutter/material.dart';
import 'package:portfolio_flutter/data.dart';
import 'package:portfolio_flutter/model/quiz_ques_model.dart';
import 'package:portfolio_flutter/screens/routes/quiz/quiz_end_screen.dart';
import 'package:portfolio_flutter/utils/logger.dart';

class QuizProvider extends ChangeNotifier {
  List<ArcQuizQuesModel>? liveQuiz;
  PageController quizPageController = PageController();
  Timer? timer;
  bool _tapped = false;

  bool get tapped => _tapped;

  set tapped(bool value) {
    appLog(name: 'printIgnore', log: 'CHALAALALALAL');
    _tapped = value;
    notifyListeners();
  }

//TODO_change both values in future
  int totalTime = 100;
  int start = 100;
  int timeBlock = 5;

  void startTimer(BuildContext context, quesId) {
    const oneSec = Duration(milliseconds: 100);
    timer = Timer.periodic(
      oneSec,
      (Timer timer) {
        if (start == 0) {
          cta(context,tappedOption:null, quesId: quesId, timer: timer);

          notifyListeners();
        } else {
          start--;
          notifyListeners();
        }
        if ((start ~/ 10).isEven && (start % 10 == 0)) {
          timeBlock--;
        }
      },
    );
  }

  void cta(
    BuildContext context, {
    required int quesId,
    bool isCorrect = false,
    required Timer timer,
    required String? tappedOption,

  }) {
    tapped = true;
    appLog(name: 'quizTimes', log: "timer ends");
    timer.cancel();
    for (var element in liveQuiz!) {
      if (element.questionID == quesId) {
        element.timeTaken = isCorrect ? timeIntoMiliS(start) : 0;
        element.score = isCorrect ? makeScore(start) : 0;
        element.isPlayedCorrect = isCorrect;
        element.tappedOption = tappedOption;
      }
    }
    Future.delayed(const Duration(seconds: 3), () {
      appLog(
        name: 'data1',
        log: quizPageController.page!.floor().toString(),
      );
      appLog(name: 'data1', log: liveQuiz!.length.toString());
      if ((quizPageController.page?.floor() ?? 0) == (liveQuiz!.length - 1)) {
        Navigator.of(context).pushReplacement(
            MaterialPageRoute(builder: ((context) => const QuizEndScreen())));
        tapped = false;
      } else {
        quizPageController
            .animateToPage(
              quizPageController.page!.floor() + 1,
              duration: const Duration(milliseconds: 250),
              curve: Curves.easeIn,
            )
            .then((value) => tapped = false);
      }
      start = 100;
      timeBlock = 5;
      // notifyListeners();
    });
  }

  canceTime() {
    timer!.cancel();
  }

  void setLiveQuiz() {
    liveQuiz = quizQuesstion.map((e) => ArcQuizQuesModel.fromMap(e)).toList();
  }

  Future playQlanQuiz(
    BuildContext context, {
    required int questionId,
    required bool isCorrect,
    required String? tappedOption,
  }) async {
    try {
      cta(context,tappedOption:tappedOption, quesId: questionId, isCorrect: isCorrect, timer: timer!);
      notifyListeners();
    } catch (error) {
      appLog(
        name: 'getQlanQuiz',
      );

      rethrow;
    }
  }

  int makeScore(timeTaken) {
    return (timeTaken * 10) + 100;
  }

  int timeIntoMiliS(int timeTaken) {
    return ((totalTime - timeTaken) * 10);
  }
}
