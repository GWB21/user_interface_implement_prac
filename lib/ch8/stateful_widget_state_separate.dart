import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Scaffold(
        appBar: AppBar(title: const Text('StatefulWidget 예시')),
        body: const Center(child: CounterWidget()),
      ),
    );
  }
}

class CounterWidget extends StatefulWidget {
  const CounterWidget({super.key});

  @override
  CounterWidgetState createState() => CounterWidgetState();
}

class CounterWidgetState extends State<CounterWidget> {
  int _counter = 0;

  void _incrementCounter() {
    setState(() {
      _counter++;
    });
  }

  void _decrementCounter() {
    setState(() {
      if (_counter > 0) {
        _counter--;
      } else {
        // 0 이하로 감소할 수 없다는 메시지를 보여줍니다.
        ScaffoldMessenger.of(context).showSnackBar(
          const SnackBar(
            content: Text('카운터는 0 이하로 감소할 수 없습니다.'),
            duration: Duration(seconds : 1),
            backgroundColor: Colors.red,
          ),
        );
      }
    });
  }

  @override
  Widget build(BuildContext context) {
    //Debugging 용 => 자세한 설명 https://www.perplexity.ai/search/the-directory-d-workspace-is-r-qSaaMqfoTuqyle2iLHLJAA#32
    if (kDebugMode) {
      print('CounterWidget의 build 메서드 호출됨');
    }
    return Column(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        Text(
          '카운터: $_counter',
          style: const TextStyle(fontSize: 24),
        ),
        const SizedBox(height: 20),
        Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            ElevatedButton(
              onPressed: _decrementCounter,
              style: ElevatedButton.styleFrom(backgroundColor: Colors.red),
              child: const Text('감소'),
            ),
            const SizedBox(width: 20),
            ElevatedButton(
              onPressed: _incrementCounter,
              style: ElevatedButton.styleFrom(backgroundColor: Colors.green),
              child: const Text('증가'),
            ),
          ],
        ),
      ],
    );
  }
}