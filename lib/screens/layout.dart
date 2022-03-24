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
  static bool ismobile = false;
  const Layout({Key? key}) : super(key: key);

  @override
  State<Layout> createState() => _LayoutState();
}

class _LayoutState extends State<Layout> {
  final ItemScrollController itemScrollController = ItemScrollController();
  final ItemPositionsListener itemPositionsListener =
      ItemPositionsListener.create();
  var pages = [Home(), Projects(), Showcase(), Contact()];

  @override
  Widget build(BuildContext context) {
    if (MediaQuery.of(context).size.width < 800) {
      Layout.ismobile = true;
    } else {
      Layout.ismobile = false;
    }
    return Scaffold(
        endDrawer: Layout.ismobile
            ? Drawer(
                backgroundColor: darkBackground,
                child: Column(
                    children: headers()
                        .map((e) => Padding(
                              padding: const EdgeInsets.all(defaultPadding),
                              child: e,
                            ))
                        .toList()),
              )
            : null,
        floatingActionButton: FloatingActionButton(
          onPressed: () => scrollTo(0),
          backgroundColor: darkBackground,
          foregroundColor: darkPrimary,
          child: const Icon(Icons.arrow_upward_rounded),
        ),
        extendBodyBehindAppBar: true,
        appBar: AppBar(
            centerTitle: true,
            title: Layout.ismobile
                ? null
                : Row(
                    mainAxisSize: MainAxisSize.min,
                    children: headers(),
                  )),
        body: ScrollablePositionedList.builder(
          physics: const BouncingScrollPhysics(),
          minCacheExtent: 1000,
          itemCount: pages.length,
          itemBuilder: (context, index) => pages[index],
          itemScrollController: itemScrollController,
          itemPositionsListener: itemPositionsListener,
        ));
  }

  void scrollTo(index) {
    itemScrollController.scrollTo(
        alignment: 0.05,
        index: index,
        duration: const Duration(milliseconds: 1000),
        curve: Curves.easeInOutCubic);
  }

  List<Widget> headers() {
    var temp = [
      'HOME',
      'PROJECTS',
      'SHOWCASE',
      'CONTACT',
    ];
    return [
      ...List<Widget>.generate(
        temp.length,
        ((index) => Padding(
              padding: const EdgeInsets.symmetric(horizontal: defaultPadding),
              child: TextButton(
                onPressed: () => scrollTo(index),
                child: Text(temp[index],
                    style: Theme.of(context)
                        .textTheme
                        .bodyMedium!
                        .copyWith(color: darkPrimary)),
              ),
            )),
      )
    ];
  }
}
