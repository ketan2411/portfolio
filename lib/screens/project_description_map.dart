import 'dart:developer';

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
                style: Theme.of(context)
                    .textTheme
                    .displaySmall!
                    .copyWith(fontWeight: FontWeight.bold),
              ),
              const SizedBox(
                height: defaultPadding / 2,
              ),
              Text(project['subtitle'] ?? "",
                  style: Theme.of(context).textTheme.bodySmall),
              const SizedBox(
                height: defaultPadding,
              ),
              Row(
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
                                  style: Theme.of(context).textTheme.bodySmall)),
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
            child: Container(
              height: 200,
              width: 200,
              margin: const EdgeInsets.symmetric(horizontal: 5.0),
              decoration: BoxDecoration(
                  image: DecorationImage(
                      image: AssetImage(project['thumbnail'][0]),
                      scale: 0.5,
                      onError: (error, stacktrace) {
                        // Logger().e(error);
                      })),
              child: InkWell(onTap: () => openImage(context, 0)),
            )),
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
                              ),
                            )),
                  ))));
    }
  }
}
