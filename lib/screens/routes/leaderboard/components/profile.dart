import 'package:flutter/material.dart';
import 'package:portfolio_flutter/constants.dart';

class ProfileCard extends StatelessWidget {
  const ProfileCard({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: const EdgeInsets.all(defaultPadding / 2),
      height: 50,
      width: 50,
      decoration: BoxDecoration(
          border: Border.all(color: Colors.amber, width: 2),
          color: Colors.white,
          borderRadius: BorderRadius.circular(defaultBorderRadius / 2)),
    );
  }
}
