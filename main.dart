import 'package:flutter/material.dart';
import 'dart:math';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Scaffold(
        backgroundColor: Colors.lightBlue,
        appBar: AppBar(
          centerTitle: true,
          title: Text("LUCK GAME"),
          backgroundColor: Colors.lightBlue,
        ),
        body: DicePage(),
      ),
    );
  }
}

class DicePage extends StatefulWidget {
  const DicePage({super.key});

  @override
  State<DicePage> createState() => _DicePageState();
}

class _DicePageState extends State<DicePage> {
  int leftDiceNumber = 1;
  int rightDiceNumber = 2;
  @override
  Widget build(BuildContext context) {
    void diceChange() {
      setState(() {
        leftDiceNumber = Random().nextInt(6) + 1;
        rightDiceNumber = Random().nextInt(6) + 1;
        if (leftDiceNumber == rightDiceNumber) print("Winner");
      });
    }

    ;

    return Center(
      child: Row(
        children: [
          Expanded(
            child: TextButton(
                child: Image.asset('assets/images/dice$leftDiceNumber.png'),
                onPressed: () {
                  diceChange();
                }),
          ),
          SizedBox(width: 10),
          Expanded(
            child: TextButton(
              onPressed: () {
                diceChange();
              },
              child: Image.asset('assets/images/dice$rightDiceNumber.png'),
            ),
          ),
        ],
      ),
    );
  }
}