import 'package:flutter/material.dart';

import 'package:portfolio_flutter/constants.dart';
import 'package:portfolio_flutter/theme.dart';

class PostCard extends StatelessWidget {
  final bool dark;
  const PostCard({
    Key? key,
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
      color: dark ? darkBackground : lightBackground,
      child: InkWell(
        onTap: () {},
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
                    image: const DecorationImage(
                        image: NetworkImage(
                            'https://images.pexels.com/photos/11520080/pexels-photo-11520080.jpeg?auto=compress&cs=tinysrgb&dpr=2&w=500'),
                        fit: BoxFit.cover)),
              ),
              Padding(
                padding: const EdgeInsets.all(defaultPadding / 2),
                child: Row(children: [
                  Text('Element',
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
                  info.substring(0, info.length ~/ 3),
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
