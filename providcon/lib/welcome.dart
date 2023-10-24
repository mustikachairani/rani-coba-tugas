import 'package:flutter/material.dart';
import 'package:providcon/viewmodel/my_data.dart';
import 'package:provider/provider.dart';


class MyHomePage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    final myData = Provider.of<MyDataProvider>(context);
    return Scaffold(
      appBar: AppBar(
        title: Text("${myData.myData.data}"), // Menggunakan data yang diterima
      ),
      body: Center(
        child: Text('Ini adalah halaman beranda.'),
      ),
    );
  }
}