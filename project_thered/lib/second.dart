import 'package:flutter/material.dart';
import 'package:project_thered/first.dart';

class second extends StatefulWidget {
  second({Key? key}) : super(key: key);

  @override
  State<second> createState() => _secondState();
}

class _secondState extends State<second> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        leading: IconButton(
          icon: Icon(Icons.home),
          onPressed: () {
            finalResult = "";
            Navigator.of(context).pop();
            Navigator.of(context).pop();
            Navigator.of(context).pushNamed("first");
          },
        ),
        backgroundColor: Colors.red,
      ),
      body: Center(
        child: Text(finalResult),
      ),
    );
  }
}
