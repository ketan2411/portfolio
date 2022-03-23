import 'package:flutter/material.dart';

import 'package:portfolio_flutter/constants.dart';
import 'package:portfolio_flutter/model/showcase_model.dart';
import 'package:portfolio_flutter/theme.dart';

class PostCard extends StatelessWidget {
  final ShowcaseModel showcase;
  final bool dark;
  const PostCard({
    Key? key,
    required this.showcase,
    this.dark = false,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    var height = MediaQuery.of(context).size.height * 0.6;
    return Card(
      margin: const EdgeInsets.all(defaultPadding),
      shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(defaultBorderRadius)),
      elevation: 8,
      color: dark
          ? darkBackground.withGreen(50).withBlue(50).withRed(50)
          : lightBackground,
      child: InkWell(
        onTap: () {
          Navigator.pushNamed(context, showcase.routeName);
        },
        child: Container(
          padding: const EdgeInsets.all(defaultPadding),
          //? Edit height
          width: height,
          child: Column(
            mainAxisSize: MainAxisSize.min,
            children: [
              Container(
                constraints: BoxConstraints(
                  maxHeight: height * 0.6,
                ),
                decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(defaultBorderRadius),
                    image: DecorationImage(
                        image: NetworkImage(showcase.image),
                        fit: BoxFit.cover)),
              ),
              Padding(
                padding: const EdgeInsets.all(defaultPadding / 2),
                child: Row(children: [
                  Text(showcase.title,
                      style: Theme.of(context)
                          .textTheme
                          .headline6!
                          .copyWith(color: dark ? darkPrimary : lightPrimary)),
                  const Spacer(),
                  Icon(
                    Icons.chevron_right_rounded,
                    color: dark ? darkPrimary : lightPrimary,
                  )
                ]),
              ),
              Padding(
                padding: const EdgeInsets.all(defaultPadding / 3),
                child: Text(
                  showcase.subtitle,
                  style: Theme.of(context).textTheme.caption!.copyWith(
                      color: dark
                          ? darkPrimary.withOpacity(0.6)
                          : lightPrimary.withOpacity(0.6)),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
