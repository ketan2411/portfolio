// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import 'package:portfolio_flutter/provider/quiz_provider.dart';

class QuizTimer extends StatefulWidget {
  final int quesId;
  const QuizTimer({
    Key? key,
    required this.quesId,
  }) : super(key: key);

  @override
  State<QuizTimer> createState() => _QuizTimerState();
}

class _QuizTimerState extends State<QuizTimer> {
  @override
  void initState() {
    Provider.of<QuizProvider>(context, listen: false).startTimer(context,widget.quesId);
    super.initState();
  }

  @override
  void dispose() {
    //  Provider.of<QuizProvider>(context,listen: false).canceTime();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Consumer<QuizProvider>(
      builder: (context, provider, _) {
        return SizedBox(
          width: 195,
          height: 20,
          child: Stack(
            fit: StackFit.expand,
            alignment: Alignment.centerLeft,
            children: [
              const Positioned.fill(
                child: SizedBox(
                  width: 190,
                  height: 30,
                ),
              ),
              Row(
                mainAxisSize: MainAxisSize.min,
                // mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  if (provider.timeBlock > 0)
                    ...List.generate(
                      provider.timeBlock,
                      (index) => Container(
                        height: 16,
                        width: 28,
                        margin: const EdgeInsets.symmetric(horizontal: 1),
                        color: Colors.amber,
                      ),
                    ),
                  const Spacer(),
                  if (provider.timer != null)
                    Text(
                      '${provider.start ~/ 10}s',
                      style: Theme.of(context).textTheme.bodySmall!.copyWith(
                            fontWeight: FontWeight.bold,
                            color:  Colors.amber,
                          ),
                    ),
                ],
              ),
            ],
          ),
        );
      },
    );
  }
}
