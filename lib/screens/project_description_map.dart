import 'dart:developer';

import 'package:animate_do/animate_do.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:markdown_widget/markdown_widget.dart';
import 'package:portfolio_flutter/constants.dart';
import 'package:portfolio_flutter/theme.dart';
import 'package:responsive_sizer/responsive_sizer.dart';
import 'package:url_launcher/url_launcher.dart';

class ProjectDescriptionMAP extends StatelessWidget {
  final Map project;
  final int index;
  final bool reverse;
  const ProjectDescriptionMAP({
    Key? key,
    required this.project,
    this.reverse = false,
    this.index = 0,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    // for (String element in project['screenshots']) {
    //   precacheImage(
    //     AssetImage(element),
    //     context,
    //     onError: (exception, stackTrace) => log('chache failed'),
    //   ).then((value) => log('cached $element'));
    // }
    return SingleChildScrollView(
      child: Column(children: data(context)),
    );
  }

  List<Widget> data(context) {
    try {
      List<Widget> data = [
        const SizedBox(
          height: defaultPadding,
        ),
        ConstrainedBox(
          constraints: BoxConstraints(maxWidth: 80.w),
          child: Column(
            children: [
              projectTitle(),
              const SizedBox(
                height: defaultPadding / 2,
              ),
              subtitle(context),
              const SizedBox(
                height: defaultPadding,
              ),
              yearAndLinks(context),
              const SizedBox(
                height: defaultPadding,
              ),
              // SizedBox(
              //     height:
              //         Device.width > 599 ? defaultPadding * 4 : defaultPadding),
              mockupsSection(context),
              // Wrap(
              //   runAlignment: WrapAlignment.center,
              //   alignment: WrapAlignment.center,
              //   children: [
              //     mockupsSection(context),
              //     Column(
              //       mainAxisSize: MainAxisSize.min,
              //       mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              //       crossAxisAlignment: CrossAxisAlignment.center,
              //       children: [
              //         tags(context),
              //         const SizedBox(
              //             height: defaultPadding / 2,
              //             width: defaultPadding / 2),
              //         description(context),
              //       ],
              //     ),
              //   ],
              // ),
              // mockupsSection(context),
              if (project['thumbnail_web'] != null) ...[
                tags(context),
                const SizedBox(height: defaultPadding / 2),
                description(context),
              ],
              const SizedBox(
                height: defaultPadding,
              ),
            ],
          ),
        ),
      ];
      return data;
    } catch (e, s) {
      log(e.toString(), stackTrace: s);
      log(s.toString(), stackTrace: s);
      return [];
    }
  }

  Widget description(context) {
    return ConstrainedBox(
      constraints: BoxConstraints(maxWidth: 80.w, minWidth: 60.w),
      // height: 300,
      // width: project['thumbnail_web'] != null ? 80.w : 70.w,
      child: MarkdownWidget(
          styleConfig: StyleConfig(
              pConfig:
                  PConfig(textStyle: Theme.of(context).textTheme.bodyLarge)),
          padding: EdgeInsets.zero,
          data: project['description'],
          shrinkWrap: true,
          physics: const NeverScrollableScrollPhysics()),
    );
  }

  Wrap tags(context) {
    return Wrap(
      children: project['tags']
          //! solved Expected a value of type 'List<Widget>', but got one of type 'List<dynamic>'
          //! by setting <Widsget>
          .map<Widget>((e) => Padding(
                padding:
                    const EdgeInsets.symmetric(horizontal: defaultPadding / 2),
                child: Chip(
                    label:
                        Text(e, style: Theme.of(context).textTheme.bodySmall)),
              ))
          .toList(),
    );
  }

  Wrap mockupsSection(context) {
    double from = 100;
    const duration = Durations.medium4;
    const curve = Curves.easeOut;
    List<Duration> delay = [
      Durations.medium2,
      Durations.medium2,
    ];
    if (project['thumbnail'] != null && project['thumbnail_web'] != null) {
      delay[1] = delay[1] + Durations.short3;
    }
    return Wrap(
      runAlignment: WrapAlignment.spaceEvenly,
      alignment: WrapAlignment.center,
      children: [
        if (project['thumbnail'] != null)
          FadeInUpBig(
            duration: duration,
            curve: curve,
            from: from,
            delay: delay[0],
            child: Padding(
              padding: const EdgeInsets.all(defaultPadding),
              child: Stack(
                alignment: Alignment.center,
                children: [
                  Image.asset(
                    project['thumbnail'],
                    height: 50.h,
                  ),
                  Image(
                    image: const AssetImage(
                      'mockups/phone.png',
                    ),
                    height: 50.h,
                  ),
                ],
              ),
            ),
          ),
        if (project['thumbnail_web'] != null)
          FadeInUpBig(
            duration: duration,
            curve: curve,
            delay: delay[1],
            from: from,
            child: Padding(
              padding: const EdgeInsets.all(defaultPadding),
              child: Builder(builder: (context) {
                final size = Size(50.h, 30.w);
                return Stack(
                  alignment: Alignment.center,
                  children: [
                    Image.asset(
                      project['thumbnail_web'],
                      height: 50.h,
                    ),
                    Image(
                      image: const AssetImage(
                        'mockups/laptop.png',
                      ),
                      height: 50.h,
                    ),
                  ],
                );
              }),
            ),
          )
        else
          Column(
            mainAxisSize: MainAxisSize.min,
            children: [
              tags(context),
              const SizedBox(height: defaultPadding / 2),
              description(context),
            ],
          )
      ],
    );
  }

  Row yearAndLinks(context) {
    return Row(
      children: [
        Text(
          "Year " + project['year'],
          style: Theme.of(context).textTheme.titleMedium,
        ),
        const Spacer(),
        Visibility(
            visible: project['link'] != null,
            child: ElevatedButton.icon(
              onPressed: () async {
                // Text(project.link ?? ""),
                await launch(project['link']);
              },
              label: Text(
                'OPEN LINK',
                style: Theme.of(context)
                    .textTheme
                    .labelSmall!
                    .copyWith(fontWeight: FontWeight.bold, color: lightPrimary),
              ),
              icon: Icon(Icons.link, color: lightPrimary),
            ))
      ],
    );
  }

  Text subtitle(context) {
    return Text(project['subtitle'] ?? "",
        style: Theme.of(context).textTheme.bodySmall);
  }

  Widget projectTitle() {
    return FittedBox(
      child: Stack(
        alignment: Alignment.center,
        clipBehavior: Clip.none,
        children: [
          Transform.translate(
            // alignment: Alignment(5, 5),
            offset: const Offset(6, 3),
            child: Text(
              project['title'],
              style: TextStyle(
                fontWeight: FontWeight.w900,
                fontSize: 62,
                letterSpacing: 4,
                foreground: Paint()
                  ..style = PaintingStyle.stroke
                  ..strokeWidth = 1
                  ..color = Colors.black,
              ),
              // style: Theme.of(context)
              //     .textTheme
              //     .displayMedium!
              //     .copyWith(fontWeight: FontWeight.bold),
            ),
          ),
          Transform.translate(
            // alignment: Alignment(5, 5),
            offset: const Offset(0, 0),
            child: Text(
              project['title'],
              style: const TextStyle(
                fontWeight: FontWeight.w900,
                fontFamily: 'Roboto',
                fontSize: 62,
                letterSpacing: 4,
                color: Color.fromARGB(255, 255, 139, 15),
                // fontFamily: 'serif'
                // foreground: Paint()
                //   ..style = PaintingStyle.stroke
                //   ..strokeWidth = 0.2
                //   ..color = Colors.black,
              ),
            ),
          ),
          Transform.translate(
            // alignment: Alignment(5, 5),
            offset: const Offset(0, 0),
            child: Text(
              project['title'],
              style: TextStyle(
                fontWeight: FontWeight.w900,
                fontSize: 62,
                letterSpacing: 4,
                foreground: Paint()
                  ..style = PaintingStyle.stroke
                  ..strokeWidth = 1
                  ..color = Colors.black,
              ),
              // style: Theme.of(context)
              //     .textTheme
              //     .displayMedium!
              //     .copyWith(fontWeight: FontWeight.bold),
            ),
          ),
        ],
      ),
    );
  }

  Future<dynamic> openImage(context, int index) {
    if (MediaQuery.of(context).size.width > 800) {
      return showDialog(
          context: context,
          builder: (context) {
            log(project['screenshots'][index].toString(), name: 'image');
            int localIndex = index;

            return Dialog(
              backgroundColor: Colors.transparent,
              elevation: 0,
              child: StatefulBuilder(builder: (context, setState) {
                return Row(
                  mainAxisSize: MainAxisSize.min,
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    IconButton(
                        onPressed: () => setState(() {
                              if (localIndex <= 0) {
                                localIndex = project['screenshots'].length - 1;
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
                    ConstrainedBox(
                      constraints: BoxConstraints(
                        maxWidth: MediaQuery.of(context).size.width * 0.8,
                      ),
                      child: Image.asset(
                        project['screenshots'][localIndex],
                        filterQuality: filterQuality,
                      ),
                    ),
                    const SizedBox(
                      width: defaultPadding,
                    ),
                    IconButton(
                        onPressed: () => setState(() {
                              if (localIndex >=
                                  project['screenshots'].length - 1) {
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
          });
    } else {
      PageController _controller = PageController(initialPage: index);
      return Navigator.push(
          context,
          MaterialPageRoute(
              builder: (context) => Scaffold(
                  backgroundColor: darkBackground,
                  appBar: AppBar(),
                  body: Center(
                    child: PageView.builder(
                        controller: _controller,
                        itemCount: project['screenshots'].length,
                        itemBuilder: (context, localIndex) => InteractiveViewer(
                              child: Image.asset(
                                project['screenshots'][localIndex],
                                filterQuality: filterQuality,
                              ),
                            )),
                  ))));
    }
  }
}
