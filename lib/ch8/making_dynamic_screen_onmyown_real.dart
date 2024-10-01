import 'package:flutter/material.dart';

main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Scaffold(
        appBar: AppBar(
          title: const Text('Stateful widget practice'),
          backgroundColor: Colors.red,
        ),
        body: MyWidget(),
      )
    );
  }
}

class MyWidget extends StatefulWidget {
  MyWidget({super.key});
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
    return Center(
      child: Row(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          IconButton(
              onPressed: changeCheck,
              iconSize: 20,
              icon: Icon(
                enabled? Icons.check_box : Icons.check_box_outline_blank,
                color: enabled? Colors.green : Colors.red,
              ),
          ),
          Container(
            width:100,
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