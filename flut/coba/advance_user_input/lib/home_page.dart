import 'package:flutter/material.dart';

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Interactive Widgets'),
        centerTitle: true,
      ),
      body: Container(
        
        padding: const EdgeInsets.all(16.0),
        child: ListView(
          children: const [
            ///build datePicker
            ///build colorPicker
            ///build fIlePicker 
          ],
        ),
      ),
    );
  }
}