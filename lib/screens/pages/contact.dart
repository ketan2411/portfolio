import 'dart:async';

import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:portfolio_flutter/constants.dart';
import 'package:portfolio_flutter/theme.dart';
import 'package:url_launcher/url_launcher.dart';

class Contact extends StatefulWidget {
  const Contact({Key? key}) : super(key: key);

  @override
  State<Contact> createState() => _ContactState();
}

class _ContactState extends State<Contact> {
  bool _switch = false;

  @override
  void initState() {
    Timer.periodic(const Duration(seconds: 2), (timer) {
      if (mounted) {
        setState(() {
          _switch = !_switch;
        });
      }
    });
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    var size = MediaQuery.of(context).size;
    return SizedBox(
      height: size.height - 50,
      child: Column(
        // mainAxisSize: MainAxisSize.min,
        children: [
Expanded(
            child: LayoutBuilder(builder: (context, constraints) {
              return constraints.maxWidth > 800
                  ? Row(
                      crossAxisAlignment: CrossAxisAlignment.center,
                      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                      children: [
                        infoBox(context),
                        Container(
                          width: 2,
                          color: darkBackground,
                          height: MediaQuery.of(context).size.height * 0.5,
                        ),
                        contactBox(context)
                      ],
                    )
                  : Column(
                      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                      children: [
                        infoBox(context),
                        Divider(
                          height: 40,
                          thickness: 2,
                          indent: size.width * 0.1,
                          endIndent: size.width * 0.1,
                          color: darkBackground,
                        ),
                        contactBox(context),
                      ],
                    );
            }),
          ),
          Container(
            height: 50,
            color: darkBackground,
            child: Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Text(
                  'Made with ',
                  style: TextStyle(color: darkPrimary),
                ),
                AnimatedSwitcher(
                  duration: const Duration(milliseconds: 700),
                  child: _switch
                      ? const Padding(
                          padding: EdgeInsets.symmetric(horizontal: 24),
                          child: FaIcon(
                            FontAwesomeIcons.solidHeart,
                            color: Colors.redAccent,
                          ),
                        )
                      : const FlutterLogo(
                          size: 72,
                          style: FlutterLogoStyle.horizontal,
                        ),
                )
              ],
            ),
          )
        ],
      ),
    );
  }

  SizedBox infoBox(BuildContext context) {
    return SizedBox(
      width: 300,
      // height: 400,
      child: Text(
        info,
        style: Theme.of(context)
            .textTheme
            .bodyText1!
            .copyWith(color: Colors.black),
      ),
    );
  }

  Column contactBox(BuildContext context) {
    return Column(
      mainAxisSize: MainAxisSize.min,
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        TextButton.icon(
            onPressed: () async {
              await launch('tel:+917014265301');
            },
            icon: const Icon(
              Icons.phone,
              color: Colors.black,
            ),
            label: Row(
              mainAxisSize: MainAxisSize.min,
              children: [
                const SizedBox(
                  width: 16,
                ),
                Text(
                  '+91 7014265301',
                  style: Theme.of(context)
                      .textTheme
                      .bodyText1!
                      .copyWith(color: Colors.black),
                ),
              ],
            )),
        const SizedBox(
          height: 8,
        ),
        TextButton.icon(
            onPressed: () async {
              await launch('mailto:ketansharma587@gmail.com');
            },
            icon: const Icon(
              Icons.mail_outline,
              color: Colors.black,
            ),
            label: Row(
              mainAxisSize: MainAxisSize.min,
              children: [
                const SizedBox(
                  width: 16,
                ),
                Text(
                  'ketansharma587@gmail.com',
                  style: Theme.of(context)
                      .textTheme
                      .bodyText1!
                      .copyWith(color: Colors.black),
                ),
              ],
            )),
        const SizedBox(
          height: 8,
        ),
        TextButton.icon(
            onPressed: () async {
              await launch('https://github.com/ketan2411');
            },
            icon: const FaIcon(
              FontAwesomeIcons.github,
              color: Colors.black,
            ),
            label: Row(
              mainAxisSize: MainAxisSize.min,
              children: [
                const SizedBox(
                  width: 16,
                ),
                Text(
                  'ketan2411',
                  style: Theme.of(context)
                      .textTheme
                      .bodyText1!
                      .copyWith(color: Colors.black),
                ),
              ],
            )),
        const SizedBox(
          height: 8,
        ),
        TextButton.icon(
            onPressed: () async {
              await launch(
                  'https://www.linkedin.com/in/ketan-sharma-602134170/');
            },
            icon: const FaIcon(
              FontAwesomeIcons.linkedin,
              color: Colors.black,
            ),
            label: Row(
              mainAxisSize: MainAxisSize.min,
              children: [
                const SizedBox(
                  width: 16,
                ),
                Text(
                  'ketansharma587',
                  style: Theme.of(context)
                      .textTheme
                      .bodyText1!
                      .copyWith(color: Colors.black),
                ),
              ],
            )),
      ],
    );
  }
}
