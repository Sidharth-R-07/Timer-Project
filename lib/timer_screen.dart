import 'dart:async';
import 'dart:developer';

import 'package:flutter/material.dart';

class TimerScreen extends StatefulWidget {
  const TimerScreen({super.key});

  @override
  State<TimerScreen> createState() => _TimerScreenState();
}

class _TimerScreenState extends State<TimerScreen> {
  Timer? _timer;
  int seconds = 0;
  int minitus = 0;
  int hourse = 0;

  bool isPoused = false;

  @override
  void initState() {
    super.initState();
  }

  void startTimer() {
    Timer.periodic(
      const Duration(seconds: 1),
      (timer) {
        _timer = timer;
        if (!isPoused) {
          setState(() {
            seconds = seconds + 1;

            if (seconds % 60 == 0) {
              minitus = minitus + 1;
              seconds = 0;
              if (minitus % 60 == 0) {
                hourse++;
                minitus = 0;
              }
            }
          });
        }
      },
    );
  }

  void stopTimer() {
    setState(() {
      _timer?.cancel();
    });
  }

  void restTimer() {
    setState(() {
      seconds = 0;
      minitus = 0;
      hourse = 0;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("Timer"),
      ),
      body: Center(
        child: Text(
          "$hourse : $minitus : $seconds",
          style: const TextStyle(
            fontSize: 35,
          ),
        ),
      ),
      floatingActionButton: Row(
        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
        children: [
          MaterialButton(
            color: Colors.green,
            onPressed: () {
              startTimer();
            },
            child: const Text("Start"),
          ),
          MaterialButton(
            color: Colors.red,
            onPressed: () {
              stopTimer();
            },
            child: const Text("Stop"),
          ),
          MaterialButton(
            color: Colors.blue,
            onPressed: () {
              restTimer();
            },
            child: const Text("Reset"),
          ),
        ],
      ),
    );
  }
}
