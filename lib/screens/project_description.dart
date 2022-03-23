import 'package:carousel_slider/carousel_slider.dart';
import 'package:flutter/material.dart';
import 'package:logger/logger.dart';
import 'package:portfolio_flutter/constants.dart';
import 'package:portfolio_flutter/model/project_model.dart';
import 'package:portfolio_flutter/theme.dart';
import 'package:url_launcher/url_launcher.dart';

class ProjectDescription extends StatelessWidget {
  final ProjectModel project;
  final bool reverse;
  const ProjectDescription({
    Key? key,
    required this.project,
    this.reverse = false,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: 500,
      width: MediaQuery.of(context).size.width - 100,
      child: Wrap(
          runAlignment: WrapAlignment.spaceEvenly,
          alignment: WrapAlignment.spaceEvenly,
          children: data(context)),
    );
  }

  List<Widget> data(context) {
    List<Widget> data = [
      ConstrainedBox(
        constraints: const BoxConstraints(maxWidth: 700),
        child: Column(
          children: [
            const SizedBox(
              height: defaultPadding,
            ),
            Text(
              project.title,
              style: Theme.of(context).textTheme.headline6,
            ),
            const SizedBox(
              height: defaultPadding / 2,
            ),
            Text(project.subtitle ?? "",
                style: Theme.of(context).textTheme.caption),
            const SizedBox(
              height: defaultPadding * 2,
            ),
            Row(
              children: [
                Text(
                  "Year " + project.year,
                  style: Theme.of(context).textTheme.subtitle1,
                ),
                const Spacer(),
                Visibility(
                    visible: project.link != null,
                    child: TextButton.icon(
                      onPressed: () async {
                        // Text(project.link ?? ""),
                        await launch(project.link!);
                      },
                      label: Text(
                        'OPEN LINK',
                        style: Theme.of(context).textTheme.labelSmall!.copyWith(
                            fontWeight: FontWeight.bold, color: lightPrimary),
                      ),
                      icon: Icon(Icons.link, color: lightPrimary),
                    ))
              ],
            ),
            const SizedBox(
              height: defaultPadding,
            ),
            Text(project.description,
                style: Theme.of(context).textTheme.titleMedium!),
          ],
        ),
      ),
      ConstrainedBox(
        constraints: const BoxConstraints(maxWidth: 500),
        child: CarouselSlider(
            items: project.screenshots.map((image) {
              return Builder(
                builder: (BuildContext context) {
                  return Container(
                    width: 200,
                    margin: const EdgeInsets.symmetric(horizontal: 5.0),
                    decoration: BoxDecoration(
                        image: DecorationImage(
                            image: AssetImage(image),
                            onError: (error, stacktrace) {
                              // Logger().e(error);
                            })),
                  );
                },
              );
            }).toList(),
            options: CarouselOptions(
              height: 500,
              aspectRatio: 0.2,
              viewportFraction: 0.6,
              initialPage: project.screenshots.length ~/ 2,
              enableInfiniteScroll: true,
              reverse: false,
              autoPlay: true,
              autoPlayInterval: Duration(seconds: ([3, 5]..shuffle()).first),
              autoPlayAnimationDuration: const Duration(milliseconds: 800),
              autoPlayCurve: Curves.fastOutSlowIn,
              enlargeCenterPage: true,
              onPageChanged: (index, reason) {},
              scrollDirection: Axis.horizontal,
            )),
      ),
    ];
    if (reverse) {
      return data.reversed.toList();
    } else {
      return data;
    }
  }
}
