import 'dart:math';

import 'package:flutter/material.dart';

void main() {
  return runApp(
    MaterialApp(
      home: Scaffold(
        backgroundColor: Colors.red,
        appBar: AppBar(
          title: const Text('Dicee'),
          backgroundColor: Colors.red,
        ),
        body: DiceApp(),
      ),
    ),
  );
}

class DiceApp extends StatefulWidget {
  const DiceApp({Key? key}) : super(key: key);

  @override
  State<DiceApp> createState() => _DiceAppState();
}

class _DiceAppState extends State<DiceApp> {
  static const max = 6;
  int leftDiceNumber = Random().nextInt(max) + 1;
  int rightDiceNumber = Random().nextInt(max) + 1;

  void changeDiceNumbers() {
    int newValue = Random().nextInt(max) + 1;
    //Change left
    while (newValue == leftDiceNumber) {
      newValue = Random().nextInt(max) + 1;
    }
    leftDiceNumber = newValue;

    //Change right
    newValue = Random().nextInt(max) + 1;
    while (newValue == rightDiceNumber) {
      newValue = Random().nextInt(max) + 1;
    }
    rightDiceNumber = newValue;
  }

  @override
  Widget build(BuildContext context) {
    return Center(
      child: Row(
        children: <Widget>[
          Expanded(
            child: TextButton(
              onPressed: () {
                setState(() {
                  changeDiceNumbers();
                });
              },
              child: Image.asset('images/dice$leftDiceNumber.png'),
            ),
          ),
          Expanded(
            child: TextButton(
              onPressed: () {
                setState(() {
                  changeDiceNumbers();
                });
              },
              child: Image.asset('images/dice$rightDiceNumber.png'),
            ),
          ),
        ],
      ),
    );
  }
}
