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
          title: Center(child: Text('Detail Produk')),
        ),
        body: SingleChildScrollView(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                    'Nama Produk',
                    style: TextStyle(
                      fontSize: 24.0,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                  Text(
                    'Rp 100.000',
                    style: TextStyle(
                      fontSize: 20.0,
                      color: Colors.green,
                    ),
                  ),
                  SizedBox(height: 16.0),
                  Text(
                    'Deskripsi produk yang cukup panjang sehingga perlu digulir. Deskripsi ini menjelaskan fitur-fitur produk dan detail lainnya yang relevan.',
                    style: TextStyle(fontSize: 16.0),
                  ),
            ],
          ),
        ),
      ),
    );
  }
}