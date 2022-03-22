import 'package:flutter/material.dart';
import 'package:portfolio_flutter/constants.dart';
import 'package:portfolio_flutter/screens/pages/home.dart';
import 'package:portfolio_flutter/screens/pages/contact.dart';
import 'package:portfolio_flutter/screens/pages/projects.dart';
import 'package:portfolio_flutter/screens/pages/showcase.dart';
import 'package:portfolio_flutter/theme.dart';
import 'package:scrollable_positioned_list/scrollable_positioned_list.dart';

class Layout extends StatefulWidget {
  static const routeName = 'Layout';
  const Layout({Key? key}) : super(key: key);

  @override
  State<Layout> createState() => _LayoutState();
}

class _LayoutState extends State<Layout> {
  final ItemScrollController itemScrollController = ItemScrollController();
  final ItemPositionsListener itemPositionsListener =
      ItemPositionsListener.create();
  var pages = const [Home(), Projects(), Showcase(), Contact()];
  var headers = const [
    'HOME',
    'PROJECTS',
    'SHOWCASE',
    'CONTACT',
  ];
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        floatingActionButton: FloatingActionButton(
          onPressed: () {
            itemScrollController.scrollTo(
                // alignment: 0.05,
                index: 0,
                duration: const Duration(milliseconds: 900),
                curve: Curves.easeInOutCubic);
          },
          backgroundColor: darkBackground,
          foregroundColor: darkPrimary,
          child: const Icon(Icons.arrow_upward_rounded),
        ),
        extendBodyBehindAppBar: true,
        appBar: AppBar(
            backgroundColor: darkBackground,
            title: Row(
              mainAxisSize: MainAxisSize.min,
              children: [
                ...List<Widget>.generate(
                  headers.length,
                  ((index) => Padding(
                        padding: const EdgeInsets.symmetric(
                            horizontal: defaultPadding),
                        child: TextButton(
                          onPressed: () {
                            itemScrollController.scrollTo(
                                alignment: 0.05,
                                index: index,
                                duration: const Duration(milliseconds: 1000),
                                curve: Curves.easeInOutCubic);
                          },
                          child: Text(
                            headers[index],
                            style: Theme.of(context).textTheme.bodyMedium,
                          ),
                        ),
                      )),
                )
              ],
            )),
        body: ScrollablePositionedList.builder(
          itemCount: pages.length,
          itemBuilder: (context, index) => pages[index],
          itemScrollController: itemScrollController,
          itemPositionsListener: itemPositionsListener,
        ));
  }
}
