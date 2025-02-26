import 'dart:async';
import 'package:flutter/material.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Pomodoro Timer',
      home: PomodoroTimer(),
    );
  }
}

class PomodoroTimer extends StatefulWidget {
  @override
  _PomodoroTimerState createState() => _PomodoroTimerState();
}

class _PomodoroTimerState extends State<PomodoroTimer> {
  int _seconds = 15;  // 작업시간은 15초
  bool _isWorking = true;  // 작업 시간 여부
  int _sessionCount = 1;  // 사이클 회차 (1부터 시작)
  late Timer _timer;

  // 타이머 시작 함수
  void _startTimer() {
    _timer = Timer.periodic(Duration(seconds: 1), (timer) {
      setState(() {
        if (_seconds == 0) {
          if (_isWorking) {
            // 작업 시간이 끝났을 때
            _sessionCount++;  // 회차 증가
          }
          _isWorking = !_isWorking;

          // 작업시간 15초, 휴식시간 5초, 4로 나누었을 때 나머지가 1인 회차에서는 10초 긴 휴식
          _seconds = _isWorking
              ? 15
              : (_sessionCount % 4 == 1 ? 10 : 5);
        } else {
          _seconds--;  // 초 감소
        }
      });
    });
  }

  // 타이머 정지 함수
  void _stopTimer() {
    _timer.cancel();
  }

  // 타이머 초기화 함수
  void _resetTimer() {
    _timer.cancel();
    _sessionCount = 1;  // 회차를 1로 초기화
    _isWorking = true;
    _seconds = 15;
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text('Pomodoro Timer')),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            Text(_isWorking ? '작업 시간' : '휴식 시간'),
            SizedBox(height: 20),
            Text('$_seconds 초', style: TextStyle(fontSize: 48)),
            SizedBox(height: 20),
            Text('회차: $_sessionCount', style: TextStyle(fontSize: 24)),
            SizedBox(height: 20),
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: <Widget>[
                ElevatedButton(onPressed: _startTimer, child: Text('시작')),
                SizedBox(width: 10),
                ElevatedButton(onPressed: _stopTimer, child: Text('정지')),
                SizedBox(width: 10),
                ElevatedButton(onPressed: _resetTimer, child: Text('초기화')),
              ],
            ),
          ],
        ),
      ),
    );
  }
}


