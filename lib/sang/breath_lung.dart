import 'dart:async';

import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:firebase_core/firebase_core.dart';
import '../thee/edu_mainpage.dart';

import '../kong/lib/screen/main_screen.dart';

class BreathApp extends StatefulWidget {
  const BreathApp({Key? key}) : super(key: key);

  @override
  State<StatefulWidget> createState() {
    return _BreathAppState();
  }
}

class _BreathAppState extends State<BreathApp> {
  int curSec = 0;
  Timer? timer;
  bool started = false;
  late Widget curWidget;

  final Future<FirebaseApp> firebase = Firebase.initializeApp();
  final CollectionReference _breathCollection =
      FirebaseFirestore.instance.collection('score');

  void restartTest() {
    setState(() {
      curSec = 0;
      started = false;
      curWidget = lungTestWidget();
    });
  }

  void showResult(int finalSecond) {
    setState(() {
      if (finalSecond <= 30) {
        curWidget = changeToResult('Your lung is bad', finalSecond);
        return;
      }
      if (curSec <= 90) {
        curWidget = changeToResult('Your lung is good', finalSecond);
        return;
      }
      curWidget = changeToResult('You are superman', finalSecond);
      return;
    });
    return;
  }

  void stopTimer() {
    timer?.cancel();
  }

  void startTimer() {
    timer = Timer.periodic(const Duration(seconds: 1), (_) {
      setState(() {
        curSec++;
      });
    });
  }

  Widget lungTestWidget() {
    return Column(
      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
      children: <Widget>[
        const Text(
          'LUNG TEST',
          style: TextStyle(
            fontWeight: FontWeight.w600,
            fontSize: 55,
            color: Color.fromRGBO(252, 150, 159, 1.0),
            fontFamily: 'Fredoka',
          ),
        ),
        Text(
          '${curSec.toString()} seconds',
          style: const TextStyle(
            fontWeight: FontWeight.w500,
            fontFamily: 'Fredoka',
            fontSize: 30,
          ),
        ),
        buildButton(),
      ],
    );
  }

  Widget changeToResult(String lungResult, int finalSeconds) {
    return Column(
      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
      children: <Widget>[
        const Text(
          'Lung Score',
          style: TextStyle(
            color: Color.fromRGBO(34, 87, 122, 1),
            fontSize: 47,
            fontWeight: FontWeight.w600,
            fontFamily: 'Fredoka',
          ),
        ),
        Text(
          lungResult,
          style: const TextStyle(
            fontSize: 21,
            fontWeight: FontWeight.w600,
            fontFamily: 'Fredoka',
          ),
        ),
        Text(
          '$finalSeconds seconds.',
          style: const TextStyle(
            fontSize: 30,
            fontWeight: FontWeight.w600,
            fontFamily: 'Fredoka',
          ),
        ),
        ElevatedButton(
          onPressed: () {
            Navigator.push(
                context,
                MaterialPageRoute(
                    builder: (context) => const UniversityList()));
          },
          child: const Text(
            'Advice',
            style: TextStyle(fontFamily: 'Fredoka'),
          ),
        ),
        ElevatedButton(
          style: ButtonStyle(
              backgroundColor: MaterialStateProperty.all(
                  const Color.fromRGBO(17, 155, 122, 1))),
          onPressed: () {
            restartTest();
          },
          child: const Text(
            'Restart Test',
            style: TextStyle(fontFamily: 'Fredoka'),
          ),
        ),
      ],
    );
  }

  Widget buildButton() {
    final bool isRunning = timer == null ? false : timer!.isActive;

    if (isRunning) {
      return SizedBox(
        width: 150,
        height: 150,
        child: ElevatedButton(
          onPressed: () async {
            stopTimer();
            showResult(curSec);
            await _breathCollection.add({
              'date':
                  '${DateTime.now().day.toString()} / ${DateTime.now().month.toString()} / ${DateTime.now().year.toString()}',
              'time': '$curSec s',
            });
          },
          child: const SizedBox(
            width: 100,
            height: 100,
            child: Icon(Icons.stop_circle),
          ),
          style: ButtonStyle(
            shape: MaterialStateProperty.all(const CircleBorder()),
            padding: MaterialStateProperty.all(const EdgeInsets.all(20)),
            backgroundColor:
                MaterialStateProperty.all(const Color.fromRGBO(231, 76, 60, 1)),
          ),
        ),
      );
    }

    return SizedBox(
      width: 150,
      height: 150,
      child: ElevatedButton(
        onPressed: () {
          if (!started) startTimer();
          started = true;
        },
        child: const Icon(Icons.play_arrow),
        style: ButtonStyle(
          shape: MaterialStateProperty.all(const CircleBorder()),
          padding: MaterialStateProperty.all(const EdgeInsets.all(20)),
          backgroundColor:
              MaterialStateProperty.all(const Color.fromRGBO(87, 204, 153, 1)),
        ),
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    if (!started || timer!.isActive) curWidget = lungTestWidget();

    return FutureBuilder(
        future: firebase,
        builder: (context, snapshot) {
          if (snapshot.hasError) {
            return const Scaffold(
              appBar: null,
              body: Center(
                child: Text('Error'),
              ),
            );
          }
          if (snapshot.connectionState == ConnectionState.done) {
            return Scaffold(
              appBar: null,
              backgroundColor: const Color.fromRGBO(230, 230, 230, 1),
              body: Center(child: curWidget),
              floatingActionButton: FloatingActionButton.extended(
                onPressed: () {
                  Navigator.push(context,
                      MaterialPageRoute(builder: (context) => MainScreen()));
                },
                elevation: 25,
                hoverColor: Colors.redAccent,
                label: const Text(
                  'Back to main menu',
                  style: TextStyle(fontFamily: 'Fredoka One', fontSize: 15),
                ),
                backgroundColor: const Color.fromRGBO(56, 163, 165, 1),
              ),
            );
          }
          return const Scaffold(
            body: Center(
              child: CircularProgressIndicator(),
            ),
          );
        });
  }
}
