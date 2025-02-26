import 'dart:async';  // 타이머 기능을 사용하기 위해 필요
import 'package:flutter/material.dart';  // Flutter에서 UI를 만들기 위한 패키지

void main() {
  runApp(MyApp());  // 앱 시작 시 MyApp 위젯을 실행
}

// MyApp은 앱의 루트 위젯
class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Pomodoro Timer',  // 앱 제목 설정
      home: PomodoroTimer(),  // 앱에서 보여줄 첫 번째 화면을 PomodoroTimer로 설정
    );
  }
}

// PomodoroTimer는 상태를 가진 위젯(StatefulWidget)
// 이 위젯은 타이머가 동작하는 화면을 만듦
class PomodoroTimer extends StatefulWidget {
  @override
  _PomodoroTimerState createState() => _PomodoroTimerState();  // 상태를 저장할 클래스 생성
}

class _PomodoroTimerState extends State<PomodoroTimer> {
  int _seconds = 15;  // 작업시간은 15초로 설정 (초단위로 표시)
  bool _isWorking = true;  // 작업시간 여부 (true: 작업시간, false: 휴식시간)
  int _sessionCount = 1;  // 사이클 회차 (1부터 시작)
  late Timer _timer;  // 타이머 객체 (타이머를 주기적으로 실행하기 위해 사용)

  // 타이머 시작 함수 (시작 버튼이 눌리면 호출됨)
  void _startTimer() {
    // Timer.periodic: 1초마다 반복되는 타이머를 설정
    _timer = Timer.periodic(Duration(seconds: 1), (timer) {
      setState(() {  // 상태가 바뀌면 UI를 다시 그리기 위해 setState 사용
        if (_seconds == 0) {  // 0초가 되었을 때
          if (_isWorking) {
            // 작업시간이 끝났을 때, 사이클을 하나 증가
            _sessionCount++;  // 회차 증가
          }
          _isWorking = !_isWorking;  // 작업시간 -> 휴식시간, 또는 휴식시간 -> 작업시간으로 변경

          // 작업시간 15초, 휴식시간 5초 설정
          // 4로 나누었을 때 나머지가 1인 회차에서는 긴 휴식 (10초)을 설정
          _seconds = _isWorking
              ? 15  // 작업시간이면 15초로 설정
              : (_sessionCount % 4 == 1 ? 10 : 5);  // 4회차부터는 긴 휴식 (10초)
        } else {
          _seconds--;  // 초가 1초씩 줄어듦
        }
      });
    });
  }

  // 타이머 정지 함수 (정지 버튼이 눌리면 호출됨)
  void _stopTimer() {
    _timer.cancel();  // 타이머를 중지
  }

  // 타이머 초기화 함수 (초기화 버튼이 눌리면 호출됨)
  void _resetTimer() {
    _timer.cancel();  // 타이머를 중지
    _sessionCount = 1;  // 회차를 1로 초기화
    _isWorking = true;  // 작업시간부터 시작
    _seconds = 15;  // 작업시간 15초로 초기화
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text('Pomodoro Timer')),  // 앱바에 타이틀을 표시
      body: Center(
        child: Column(  // 화면을 세로로 배치하는 레이아웃
          mainAxisAlignment: MainAxisAlignment.center,  // 세로로 중앙 정렬
          children: <Widget>[
            Text(_isWorking ? '작업 시간' : '휴식 시간'),  // 작업시간/휴식시간을 텍스트로 표시
            SizedBox(height: 20),  // 텍스트와 다음 요소 사이에 간격을 줌
            Text('$_seconds 초', style: TextStyle(fontSize: 48)),  // 남은 시간을 초 단위로 표시
            SizedBox(height: 20),
            Text('회차: $_sessionCount', style: TextStyle(fontSize: 24)),  // 현재 회차를 표시
            SizedBox(height: 20),
            Row(  // 버튼들을 가로로 배치
              mainAxisAlignment: MainAxisAlignment.center,  // 버튼들을 가로로 중앙 정렬
              children: <Widget>[
                ElevatedButton(onPressed: _startTimer, child: Text('시작')),  // 시작 버튼
                SizedBox(width: 10),  // 버튼들 사이에 간격을 둠
                ElevatedButton(onPressed: _stopTimer, child: Text('정지')),  // 정지 버튼
                SizedBox(width: 10),
                ElevatedButton(onPressed: _resetTimer, child: Text('초기화')),  // 초기화 버튼
              ],
            ),
          ],
        ),
      ),
    );
  }
}



// 스스로 작성하기에는 아직 flutter에 대한 이해도가 낮은 것 같다. 앞으로 직접 손으로 작성해봐가며 다트 언어를 내 것으로 만들고 싶다. 
