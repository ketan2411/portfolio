import 'package:flutter/material.dart';
import 'package:portfolio_flutter/provider/quiz_provider.dart';
import 'package:portfolio_flutter/screens/routes/quiz/components/options_box.dart';
import 'package:portfolio_flutter/screens/routes/quiz/quiz_bg.dart';
import 'package:provider/provider.dart';

class QuizPlayScreen extends StatefulWidget {
  static const routeName = "/quiz";
  const QuizPlayScreen({Key? key}) : super(key: key);

  @override
  State<QuizPlayScreen> createState() => _QuizPlayScreenState();
}

class _QuizPlayScreenState extends State<QuizPlayScreen> {
  @override
  Widget build(BuildContext context) {
    return QuizBg(
      child: Scaffold(
        backgroundColor: const Color.fromARGB(255, 17, 17, 17),
        body: Consumer<QuizProvider>(
          builder: (context, quizProvider, child) {
            return PageView.builder(
              physics: const NeverScrollableScrollPhysics(),
              // scrollBehavior: ,
              scrollDirection: Axis.vertical,

              controller: quizProvider.quizPageController,
              itemCount: quizProvider.liveQuiz!.length,
              itemBuilder: (context, index) {
                return SingleChildScrollView(
                  child: Column(
                    mainAxisSize: MainAxisSize.min,
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      const SizedBox(
                        height: 70,
                      ),
                      OptionsBox(
                        question: quizProvider.liveQuiz![index],
                        totalQ: quizProvider.liveQuiz!.length,
                        curQ: index + 1,
                      ),
                    ],
                  ),
                );
              },
            );
          },
        ),
      ),
    );
  }
}
