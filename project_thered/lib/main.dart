import 'package:flutter/material.dart';
import 'package:project_thered/Splash.dart';
import 'package:project_thered/first.dart';
import 'package:project_thered/second.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      theme: theme,
      debugShowCheckedModeBanner: false,
      initialRoute: "splash",
      routes: {
        "first": (context) => First(),
        "second": (context) => second(),
        "splash": (context) => Splash(),
      },
      home: const Scaffold(),
    );
  }
}
