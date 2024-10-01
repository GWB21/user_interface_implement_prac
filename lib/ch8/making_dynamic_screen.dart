import 'package:flutter/material.dart';

void main() {
  runApp(const MyApp());
}

//화면 구성의 "틀"을 잡는 코드
class MyApp extends StatelessWidget {
  const MyApp({super.key});     //상수 위젯 생성 => https://www.perplexity.ai/search/dongjeogin-eul-yeongeoro-RtX6wai9RwaSOIRsUH.hFg#4

  @override       //statelessWidget의 build 위젯 override
  Widget build(BuildContext context) {    //매개변수 이해 => https://www.perplexity.ai/search/dongjeogin-eul-yeongeoro-RtX6wai9RwaSOIRsUH.hFg#5
    return MaterialApp(
      home: Scaffold(
        appBar: AppBar(
          title: const Text('Stateful Test'),
          backgroundColor: Colors.red,
        ),
        body: const MyWidget(),
      ),
    );
  }
}

//화면 구성에서 body에 들어가는 위젯의 스테이트를 만드는 코드
class MyWidget extends StatefulWidget {
  const MyWidget({super.key});
  @override
  State<StatefulWidget> createState() {
    return _MyWidgetState();
  }
}

class _MyWidgetState extends State<MyWidget> {
  bool enabled = false;
  String stateText = 'disable';

  void changeCheck() {
    setState(() {
      enabled = !enabled;
      stateText = enabled? 'enable' : 'disable';
    });
  }

  @override
  Widget build(BuildContext context) {
    // Material App과 Center의 차이(?) 이해(?) => https://www.perplexity.ai/search/dongjeogin-eul-yeongeoro-RtX6wai9RwaSOIRsUH.hFg#13
    //Material App을 쓰지 않고 바로 Center를 쓰는 이유 => https://www.perplexity.ai/search/dongjeogin-eul-yeongeoro-RtX6wai9RwaSOIRsUH.hFg#15
    return Center(
      child: Row(
        mainAxisAlignment: MainAxisAlignment.center,  //Stack에서 정렬시 alignment 쓰는 반면 Row에서는 mainAxisAlignment 쓰는 이유 => https://www.perplexity.ai/search/dongjeogin-eul-yeongeoro-RtX6wai9RwaSOIRsUH.hFg#16
        children: [
          IconButton(
              icon: Icon(   //아이콘 버튼 아이콘 안에 굳이 또 Icon을 쓰는 이유는? => https://www.perplexity.ai/search/dongjeogin-eul-yeongeoro-RtX6wai9RwaSOIRsUH.hFg#20
                enabled? Icons.check_box : Icons.check_box_outline_blank,
                color: enabled? Colors.green : Colors.red,      //순서 상관 있을까요? https://www.perplexity.ai/search/dongjeogin-eul-yeongeoro-RtX6wai9RwaSOIRsUH.hFg#19
              ),
              iconSize: 20,             //iconSize 관리시 이점 => https://www.perplexity.ai/search/dongjeogin-eul-yeongeoro-RtX6wai9RwaSOIRsUH.hFg#21
              onPressed: changeCheck,   //이 모든 변경은 setState() 호출로 인해 Flutter가 위젯 트리를 다시 빌드하면서 이루어집니다. => https://www.perplexity.ai/search/dongjeogin-eul-yeongeoro-RtX6wai9RwaSOIRsUH.hFg#11
            ),
            Container(
              width: 100,       //container 수평 길이 지정 but 안에 Text의 길이가 초과하면 어떤식으로 작동해? => https://www.perplexity.ai/search/dongjeogin-eul-yeongeoro-RtX6wai9RwaSOIRsUH.hFg#25
              alignment: Alignment.center,
              child: Text(
                stateText,
                style: const TextStyle(fontSize: 30, fontWeight: FontWeight.bold),
              ),
            ),
        ],
      ),
    );
  }
}
