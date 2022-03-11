import 'package:flutter/material.dart';
import 'package:portfolio_flutter/screens/pages/about.dart';

class Home extends StatefulWidget {
  static const routeName = 'Home';
  const Home({Key? key}) : super(key: key);

  @override
  State<Home> createState() => _HomeState();
}

class _HomeState extends State<Home> {
  @override
  Widget build(BuildContext context) {
    return const Scaffold(
      extendBodyBehindAppBar: true,
      body: About(),
    );
  }
}
