import 'package:flutter/material.dart';
import 'package:portfolio_flutter/constants.dart';
import 'package:portfolio_flutter/theme.dart';
import 'package:portfolio_flutter/widgets/post_card.dart';

class Showcase extends StatelessWidget {
  const Showcase({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      color: darkBackground,
      child: SingleChildScrollView(
          child: Column(children: [
        const SizedBox(
          height: defaultPadding* 2,
        ),
        Padding(
          padding: const EdgeInsets.all(defaultPadding * 2),
          child: SizedBox(
            width: defaultPadding * 40,
            child: Column(
              mainAxisSize: MainAxisSize.min,
              children: [
                Text('SHOWCASE',
                    style: Theme.of(context)
                        .textTheme
                        .headline5!
                        .copyWith(color: darkPrimary)),
                Divider(
                  color: darkPrimary.withOpacity(0.2),
                ),
              ],
            ),
          ),
        ),
        const SizedBox(
          height: defaultPadding ,
        ),
        Row(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Column(
              children: [
                ...List.generate(
                    5,
                    (index) => const Padding(
                          padding: EdgeInsets.all(defaultPadding * 2),
                          child: PostCard(
                            dark: true,
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
                    (index) => const Padding(
                          padding: EdgeInsets.all(defaultPadding * 2),
                          child: PostCard(
                            dark: true,
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
