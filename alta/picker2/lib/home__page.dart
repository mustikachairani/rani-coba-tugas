import 'package:flutter/material.dart';

void main() {
  runApp(const HomePage());
}

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  DateTime selectedDate = DateTime.now();

  Future<void> _selectDate(BuildContext context) async {
    final DateTime? pickedDate = await showDatePicker(
      context: context,
      initialDate: selectedDate,
      firstDate: DateTime(2000),
      lastDate: DateTime(2100),
    );
    if (pickedDate != null && pickedDate != selectedDate) {
      setState(() {
        selectedDate = pickedDate;
      });
    }
  }

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Scaffold(
        appBar: AppBar(
          title: Text('Create Post'),
        ),
        drawer: Drawer(),
        body: Container(
          margin: EdgeInsets.all(20.0),
          padding: EdgeInsets.all(20.0),
          child: Column(
            children: [
              Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text('Rani'),
                  Container(
                    height: 35.0,
                    width: double.infinity,
                    child: TextButton(
                      onPressed: () {
                        // Aksi yang ingin diambil ketika tombol ditekan
                        print('Button Pressed!');
                      },
                      style: TextButton.styleFrom(
                        backgroundColor: Colors.grey, // Warna latar belakang tombol
                        primary: Colors.white, // Warna teks pada tombol
                      ),
                      child: Text('Pilih File'), // Teks pada tombol
                    ),
                  ),
                ],
              ),
              Divider(),
              Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text('Rani'),
                  Container(
                    height: 35.0,
                    width: double.infinity,
                    child: TextButton(
                      onPressed: () {
                        // Aksi yang ingin diambil ketika tombol ditekan
                        print('Button Pressed!');
                      },
                      style: TextButton.styleFrom(
                        backgroundColor: Colors.grey, // Warna latar belakang tombol
                        primary: Colors.white, // Warna teks pada tombol
                      ),
                      child: Text('Pilih File'), // Teks pada tombol
                    ),
                  ),
                ],
              ),
            ],
            
          ),
        ),
      ),
    );
  }
}