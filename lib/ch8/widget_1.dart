import 'package:flutter/material.dart';
import 'package:user_interface_implement_prac/main.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {

  bool enabled = false; //statelssWidget은 애초에 바뀌면 안되는거니까 final이 되어야함
  String stateText = 'disable';

  void changeCheck() {
    if(enabled) {
      stateText = 'disable';
    } else {
      stateText = 'enable';
      enabled = true;
    }
  }


  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Scaffold(
        appBar: AppBar(
          backgroundColor: Colors.blue,
          title: const Center(
            child: Text('Stateless Test'),
          ),
        ),
        body: Center(
          child: Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              IconButton(
                  icon: (enabled? const Icon(Icons.check_box, size: 20,):
                        const Icon(Icons.check_box_outline_blank, size: 20,)),
                  color: Colors.red,
                  onPressed: changeCheck,
              ),
              Container(
                padding: const EdgeInsets.only(left: 16),
                child: Text(stateText, style: const TextStyle(fontSize: 30,
                            fontWeight: FontWeight.bold),),
              )
            ],
          ),
        ),
      ),
    );
  }
}
