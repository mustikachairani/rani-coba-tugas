import 'package:flutter/material.dart';
import 'package:providcon/viewmodel/my_data.dart';
import 'package:provider/provider.dart';


class MyHomePage extends StatelessWidget {
  // String getNama() {
  //   String nama = "";
  //   return nama;
  // }

  final String title; // ini yang nangkep datanya dari main.dart
  MyHomePage({required this.title}); //constructor yang mastiin title ada isinya

  @override
  Widget build(BuildContext context) {
    // Menggunakan Provider untuk mendapatkan data
    // final myData = Provider.of<MyDataProvider>(context);
    final myData = Provider.of<MyDataProvider>(context);

    return Scaffold(
      appBar: AppBar(
        title: Text(
            'Data dari Provider: ${myData.myData.data}'), // Menggunakan data yang diterima
      ),
      body: Center(
        child: Text('List Data. ${myData.listUser.toString()}'),
      ),
    );
  }
}