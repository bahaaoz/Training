import 'package:flutter/material.dart';

ThemeData? theme;

class Splash extends StatefulWidget {
  const Splash({Key? key}) : super(key: key);

  @override
  State<Splash> createState() => _SplashState();
}

class _SplashState extends State<Splash> {
  @override
  void initState() {
    super.initState();

    _splashTime();
  }

  _splashTime() async {
    // await Future.delayed(
    //     const Duration(
    //       seconds: 2,
    //     ),
    //     () => {});
    theme = ThemeData(fontFamily: "Roboto");

    Navigator.of(context).pushNamed("first");
  }

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      theme: ThemeData(fontFamily: "Roboto"),
      home: const Scaffold(
        body: Center(
          child: Text(
            "Tic Tac Toe",
            style: TextStyle(
              fontSize: 24,
              fontWeight: FontWeight.bold,
            ),
          ),
        ),
      ),
    );
  }
}
