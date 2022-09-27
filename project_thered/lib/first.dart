import 'dart:async';

import 'package:flutter/material.dart';
import 'package:project_thered/second.dart';

String finalResult = "";

List<String> list = ["", "", "", "", "", "", "", "", ""];
String playerX = "X";
String playerO = "O";

String currentPlayer = "O";
String whoWin = "";

// bool stop = true;
bool draw = false;

class First extends StatefulWidget {
  First({Key? key}) : super(key: key);

  @override
  State<First> createState() => _FirstState();
}

class _FirstState extends State<First> {
  Duration durationO = new Duration();
  Duration durationX = new Duration();

  Timer? timer;

  // @override
  // void initState() {
  //   // TODO: implement initState
  //   super.initState();

  //   startTimer("X");
  // }

  //_______________________________________________
  void startTimer(String xORo) {
    timer = Timer.periodic(
      const Duration(
        seconds: 1,
      ),
      (_) => addTimer(xORo),
    );
  }

//__________________________________________________
  void addTimer(String xORo) {
    final addSeconds = 1;

    setState(() {
      if (xORo == "X") {
        final secondsX = durationX.inSeconds + addSeconds;
        durationX = Duration(seconds: secondsX);
      } else {
        final secondsO = durationO.inSeconds + addSeconds;
        durationO = Duration(seconds: secondsO);
      }
    });
  }

  //______________________________________________

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: Scaffold(
        appBar: AppBar(
          backgroundColor: Color.fromARGB(255, 142, 16, 7),
          title: const Text("3"),
          centerTitle: true,
        ),
        body: Center(
          child: Column(
            children: [
              const SizedBox(
                height: 10,
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceAround,
                children: [
                  Text(
                    "X Timer : ${durationX.inSeconds}",
                    style: const TextStyle(
                      fontSize: 20,
                    ),
                  ),
                  Text(
                    "O Timer : ${durationO.inSeconds}",
                    style: const TextStyle(
                      fontSize: 20,
                    ),
                  ),
                ],
              ),
              const SizedBox(
                height: 20,
              ),
              Container(
                height: 300,
                width: 300,
                child: Stack(
                  children: [
                    GridView.builder(
                      itemCount: 9,
                      gridDelegate:
                          const SliverGridDelegateWithFixedCrossAxisCount(
                        crossAxisCount: 3,
                        mainAxisSpacing: 10,
                        crossAxisSpacing: 10,
                      ),
                      itemBuilder: (context, index) {
                        return Container(
                          child: InkWell(
                            splashColor: Colors.blue,
                            onTap: () {
                              //  if (!stop) return;

                              if (list[index] == "X" || list[index] == "O") {
                                return;
                              }
                              setState(() {
                                if (currentPlayer == playerX) {
                                  currentPlayer = playerO;
                                  timer?.cancel();
                                  startTimer("X");
                                } else {
                                  timer?.cancel();
                                  startTimer("O");
                                  currentPlayer = playerX;
                                }

                                list[index] = currentPlayer;

                                //if any player win
                                String winCheck = checkWins();
                                if (winCheck != "non") {
                                  // stop = false;
                                  finalResult = "Player $winCheck is Win";
                                  Navigator.of(context).pushNamed("second");
                                }

                                //if draw
                                draw = true;
                                for (int i = 0; i < list.length; i++) {
                                  if (list[i] == "") draw = false;
                                }
                                print(durationO);
                                print(durationX);
                                if (draw) {
                                  if (durationO > durationX) {
                                    finalResult =
                                        "Player O is Win with time : $durationO";
                                  } else {
                                    finalResult =
                                        "Player X is Win with time : $durationX";
                                  }
                                  Navigator.of(context).pushNamed("first");
                                }
                              });
                            },
                            child: Container(
                              decoration: BoxDecoration(
                                color: list[index] == ""
                                    ? Colors.transparent
                                    : list[index] == "X"
                                        ? Colors.red
                                        : Colors.blue,
                                borderRadius:
                                    const BorderRadius.all(Radius.circular(10)),
                                border: Border.all(
                                  color: Colors.black,
                                  width: 2,
                                ),
                              ),
                              height: 10,
                              width: 10,
                              child: Center(
                                child: Text(
                                  list[index],
                                  style: const TextStyle(fontSize: 30),
                                ),
                              ),
                            ),
                          ),
                        );
                      },
                    ),
                  ],
                ),
              ),
              const SizedBox(
                height: 20,
              ),
              Text(
                whoWin,
                style: TextStyle(fontSize: 20),
              ),
              const SizedBox(
                height: 20,
              ),
              // ElevatedButton(
              //   onPressed: (() {
              //     setState(() {
              //       //

              //       // if (test) {
              //       //   timer?.cancel();
              //       //   startTimer("O");
              //       // } else {
              //       //   timer?.cancel();
              //       //   startTimer("X");
              //       // }
              //       // test = !test;
              //       //

              //       for (int i = 0; i < list.length; i++) {
              //         list[i] = "";
              //       }
              //       // stop = true;
              //       whoWin = "";
              //     });
              //   }),
              //   child: const Text("Reset"),
              // ),
              ElevatedButton(
                onPressed: () {
                  startTimer("X");
                },
                child: const Text("Start"),
              ),
            ],
          ),
        ),
      ),
    );
  }
}

String checkWins() {
  List<List<int>> win = [
    [0, 1, 2],
    [3, 4, 5],
    [6, 7, 8],
    [0, 3, 6],
    [1, 4, 7],
    [2, 5, 8],
    [0, 4, 8],
    [2, 4, 6]
  ];

  for (int i = 0; i < win.length; i++) {
    if (list[win[i][0]] == "X" &&
        list[win[i][1]] == "X" &&
        list[win[i][2]] == "X") {
      return "X";
    } else if (list[win[i][0]] == "O" &&
        list[win[i][1]] == "O" &&
        list[win[i][2]] == "O") {
      return "O";
    }
  }
  return "non";
}