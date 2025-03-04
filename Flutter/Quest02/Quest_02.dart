
/*
퀘스트 26 앱 화면을 구성해보자!
• 앱을 실행하면 처음 보이는 페이지를 작성합니다.
• 주요 포인트는 다섯 가지입니다.
(x) 1. appbar 좌측 상단에 원하는 아이콘을 추가합니다.
(x) 2. appbar 중앙에 “글씨를 왜 만들까”라는 텍스트를 추가합니다.
(x) 3. appbar의 색상을 ‘blue’로 지정합니다
(x) 4. 화면 중앙에 “Text”라고 표시된 button을 추가합니다. 해당 버튼을 클릭하면 “버튼이 눌렸습니다.“라는 문장이 DEBUG CONSOLE에 출력되게 합니다.
(x) 5. 화면 하단의 중앙에 5개의 container가 중첩됩니다. 각 container는 정사각형이며, 각각의 컨테이너의 크기는 높이와 너비가 60씩 증가합니다. (가장 바깥 container는 300*300)
• 크기 정보:
• icon: 186-193
• icon2: 205-210
• stack: 225-233
• stack2: 245
• appbar: 325
*/

import 'package:flutter/material.dart';

void main(){
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Scaffold(
        appBar: AppBar(
          leading: Icon(Icons.heart_broken),
          backgroundColor: Colors.blue,
          title: Center(
              child:
              Text('글씨를 왜 만들까')),
        ),
        body: Column(
          children: [
            Center(child: ElevatedButton(onPressed: showMessage, child: Text('Text')),
            ),
            Stack(
              children: [
                Container(color: Colors.green,width: 300,height: 300),
                Container(color: Colors.yellow,width: 240,height: 240),
                Container(color: Colors.orange,width: 180,height: 180),
                Container(color: Colors.red,width: 120,height: 120),
                Container(color: Colors.grey,width: 60,height: 60)
              ],
            )


          ],
        ),
      )

    );
  }

  void showMessage() {
    print('버튼이 눌렸습니다.');
  }
}
