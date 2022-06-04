import 'package:flutter/material.dart';
import 'package:parallax_example/main.dart';

class Parallax extends StatelessWidget {
  static const routeName = '/parallax';
  const Parallax({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          automaticallyImplyLeading: true,
          title: const Text('Landscape Parallax'),
        ),
        body: const ParallaxExample());
  }
}
