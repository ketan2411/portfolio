import 'package:flutter/material.dart';
import 'package:portfolio_flutter/constants.dart';
import 'package:portfolio_flutter/model/quiz_ques_model.dart';
import 'package:portfolio_flutter/provider/quiz_provider.dart';
import 'package:portfolio_flutter/screens/routes/quiz/components/options_quiz.dart';
import 'package:portfolio_flutter/screens/routes/quiz/components/ques_number.dart';
import 'package:portfolio_flutter/screens/routes/quiz/components/ques_widget.dart';
import 'package:portfolio_flutter/screens/routes/quiz/components/quiz_timer.dart';
import 'package:portfolio_flutter/theme.dart';
import 'package:portfolio_flutter/utils/logger.dart';
import 'package:portfolio_flutter/utils/assets.dart';
import 'package:provider/provider.dart';

class OptionsBox extends StatefulWidget {
  final int totalQ;
  final int curQ;
  final ArcQuizQuesModel question;
  const OptionsBox({
    Key? key,
    required this.question,
    required this.totalQ,
    required this.curQ,
  }) : super(key: key);

  @override
  State<OptionsBox> createState() => _OptionsBoxState();
}

class _OptionsBoxState extends State<OptionsBox> {
  @override
  void initState() {
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Stack(
      clipBehavior: Clip.none,
      children: [
        Image.asset(
          quizBg,
          filterQuality: filterQuality,
          fit: BoxFit.cover,
        ),
        Positioned(
          top: -24,
          right: 24,
          child: IconButton(
            icon: const Icon(
              Icons.clear,
              color: Colors.red,
            ),
            onPressed: () => Navigator.pop(context),
          ),
        ),
        Positioned(
            top: 8,
            left: 38,
            child: QuizTimer(
              quesId: widget.question.questionID,
            )),
        Selector<DataProvider, bool>(
          selector: (p0, p1) => p1.tapped,
          shouldRebuild: (previous, next) => true,
          builder: (context, tapped, _) {
            appLog(name: 'printIgnore', log: tapped.toString());
            return Positioned(
              top: 42,
              child: Column(
                mainAxisSize: MainAxisSize.min,
                // mainAxisAlignment: Ma,
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  QuestionNumberWidget(
                    totalQ: widget.totalQ,
                    currentQ: widget.curQ,
                  ),
                  QuestionWidget(
                    text: widget.question.question,
                  ),
                  const SizedBox(
                    height: defaultPadding * 2,
                  ),
                  IgnorePointer(
                    ignoring: tapped,
                    child: OptionsQuiz(
                      thisOption: widget.question.optA,
                      question: widget.question,
                    ),
                  ),
                  IgnorePointer(
                    ignoring: tapped,
                    child: OptionsQuiz(
                      thisOption: widget.question.optB,
                      question: widget.question,
                    ),
                  ),
                  IgnorePointer(
                    ignoring: tapped,
                    child: OptionsQuiz(
                      thisOption: widget.question.optC,
                      question: widget.question,
                    ),
                  ),
                  IgnorePointer(
                    ignoring: tapped,
                    child: OptionsQuiz(
                      thisOption: widget.question.optD,
                      question: widget.question,
                    ),
                  ),
                ],
              ),
            );
          },
        ),
      ],
    );
  }
}
