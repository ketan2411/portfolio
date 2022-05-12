import 'dart:developer';

import 'package:carousel_slider/carousel_slider.dart';
import 'package:flutter/material.dart';
import 'package:markdown_widget/markdown_widget.dart';
import 'package:portfolio_flutter/constants.dart';
import 'package:portfolio_flutter/theme.dart';
import 'package:url_launcher/url_launcher.dart';

class ProjectDescriptionMAP extends StatelessWidget {
  final Map project;
  final bool reverse;
  const ProjectDescriptionMAP({
    Key? key,
    required this.project,
    this.reverse = false,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    for (String element in project['screenshots']) {
      precacheImage(
        AssetImage(element),
        context,
        onError: (exception, stackTrace) => log('chache failed'),
      ).then((value) => log('cached $element'));
    }
    return SizedBox(
      // height: 500,
      width: MediaQuery.of(context).size.width - 100,
      child: Wrap(
          runAlignment: WrapAlignment.spaceEvenly,
          alignment: WrapAlignment.spaceEvenly,
          children: data(context)),
    );
  }

  List<Widget> data(context) {
    try {
      List<Widget> data = [
        ConstrainedBox(
          constraints: const BoxConstraints(maxWidth: 700),
          child: Column(
            children: [
              Text(
                project['title'],
                style: Theme.of(context).textTheme.headline6,
              ),
              const SizedBox(
                height: defaultPadding / 2,
              ),
              Text(project['subtitle'] ?? "",
                  style: Theme.of(context).textTheme.caption),
              const SizedBox(
                height: defaultPadding,
              ),
              Row(
                children: [
                  Text(
                    "Year " + project['year'],
                    style: Theme.of(context).textTheme.subtitle1,
                  ),
                  const Spacer(),
                  Visibility(
                      visible: project['link'] != null,
                      child: TextButton.icon(
                        onPressed: () async {
                          // Text(project.link ?? ""),
                          await launch(project['link']);
                        },
                        label: Text(
                          'OPEN LINK',
                          style: Theme.of(context)
                              .textTheme
                              .labelSmall!
                              .copyWith(
                                  fontWeight: FontWeight.bold,
                                  color: lightPrimary),
                        ),
                        icon: Icon(Icons.link, color: lightPrimary),
                      ))
                ],
              ),
              const SizedBox(height: defaultPadding / 2),
              Wrap(
                children: project['tags']
                    //! solved Expected a value of type 'List<Widget>', but got one of type 'List<dynamic>'
                    //! by setting <Widsget>
                    .map<Widget>((e) => Padding(
                          padding: const EdgeInsets.symmetric(
                              horizontal: defaultPadding / 2),
                          child: Chip(
                              label: Text(e,
                                  style: Theme.of(context).textTheme.caption)),
                        ))
                    .toList(),
              ),
              const SizedBox(height: defaultPadding / 2),
              SizedBox(
                // height: 300,
                child: MarkdownWidget(
                    padding: EdgeInsets.zero,
                    data: project['description'],
                    shrinkWrap: true,
                    physics: const NeverScrollableScrollPhysics()),
              ),
              const SizedBox(
                height: defaultPadding,
              ),
            ],
          ),
        ),
        ConstrainedBox(
          constraints: const BoxConstraints(maxWidth: 400),
          child: CarouselSlider(
              items: List.generate(project['thumbnail'].length, (index) {
                log(project['thumbnail'][index].toString(), name: 'thumbnail');
                return Container(
                  //         width: 200,
                  margin: const EdgeInsets.symmetric(horizontal: 5.0),
                  decoration: BoxDecoration(
                      image: DecorationImage(
                          image: AssetImage(project['thumbnail'][index]),
                          scale: 0.5,
                          onError: (error, stacktrace) {
                            // Logger().e(error);
                          })),
                  child: InkWell(
                      onTap: () => showDialog(
                          context: context,
                          builder: (context) {
                            log(project['screenshots'][index].toString(),
                                name: 'image');
                            int localIndex = index;

                            return Dialog(
                              backgroundColor: Colors.transparent,
                              elevation: 0,
                              child:
                                  StatefulBuilder(builder: (context, setState) {
                                return Row(
                                  mainAxisSize: MainAxisSize.min,
                                  mainAxisAlignment: MainAxisAlignment.center,
                                  children: [
                                    IconButton(
                                        onPressed: () => setState(() {
                                              if (localIndex <= 0) {
                                                localIndex =
                                                    project['screenshots']
                                                            .length -
                                                        1;
                                              } else {
                                                localIndex = localIndex - 1;
                                              }
                                            }),
                                        icon: const Icon(
                                          Icons.chevron_left,
                                          color: Colors.white,
                                        )),
                                    const SizedBox(
                                      width: defaultPadding,
                                    ),
                                    Image.asset(
                                      project['screenshots'][localIndex],
                                      height:
                                          MediaQuery.of(context).size.height *
                                              0.8,
                                    ),
                                    const SizedBox(
                                      width: defaultPadding,
                                    ),
                                    IconButton(
                                        onPressed: () => setState(() {
                                              if (localIndex >=
                                                  project['screenshots']
                                                          .length -
                                                      1) {
                                                localIndex = 0;
                                              } else {
                                                localIndex = localIndex + 1;
                                              }
                                            }),
                                        icon: const Icon(
                                          Icons.chevron_right,
                                          color: Colors.white,
                                        )),
                                  ],
                                );
                              }),
                            );
                          })),
                );
              }),
              options: CarouselOptions(
                height: 300,
                aspectRatio: 0.2,
                viewportFraction: 0.4,
                initialPage: project['thumbnail'].length ~/ 2,
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
    } catch (e, s) {
      log(e.toString(), stackTrace: s);
      log(s.toString(), stackTrace: s);
      return [];
    }
  }
}
