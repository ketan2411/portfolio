import 'package:flutter/material.dart';
import 'package:portfolio_flutter/constants.dart';
import 'package:portfolio_flutter/theme.dart';
import 'package:portfolio_flutter/widgets/post_card.dart';

class Projects extends StatelessWidget {
  const Projects({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      color: scaffoldBackground,
      child: SingleChildScrollView(
          child: Column(children: [
        const SizedBox(
          height: defaultPadding * 2,
        ),
        Padding(
          padding: const EdgeInsets.all(defaultPadding * 2),
          child: SizedBox(
            width: defaultPadding * 40,
            child: Column(
              mainAxisSize: MainAxisSize.min,
              children: [
                Text('PROJECTS',
                    style: Theme.of(context)
                        .textTheme
                        .headline5!
                        .copyWith(color: Colors.black)),
                const Divider(),
              ],
            ),
          ),
        ),
        const SizedBox(
          height: defaultPadding,
        ),
        Row(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Column(
              children: [
                ...List.generate(
                    5,
                    (index) => Padding(
                          padding: const EdgeInsets.all(defaultPadding * 2),
                          child: PostCard(
                            dark: index % 2 == 1 ? true : false,
                          ),
                        )),
              ],
            ),
            Column(
              children: [
                const SizedBox(
                  height: defaultPadding * 5,
                ),
                ...List.generate(
                    5,
                    (index) => Padding(
                          padding: const EdgeInsets.all(defaultPadding * 2),
                          child: PostCard(
                            dark: index % 2 == 0 ? true : false,
                          ),
                        )),
              ],
            )
          ],
        )
      ])),
    );
  }
}
