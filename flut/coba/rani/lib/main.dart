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
        appBar: AppBar(
          title: const Text('Rani App'),
        ),
        body: Container(
          color: Colors.amber,
          margin: const EdgeInsets.only(top: 10.0,left: 10.0, right: 10.0),
          child: const Center(child: Column(
            children: [
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Text('Rani'),Text('Rani'),
                ],
              ),
              SizedBox(height: 30,),
              Text('UNI')
            ],
          )),
        )
      ),
    );
  }
}