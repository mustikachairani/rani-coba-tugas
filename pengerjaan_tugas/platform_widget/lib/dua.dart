import 'package:flutter/material.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  MyApp({Key? key});

  // Buat daftar data kontak Anda di sini
  final List<Map<String, String>> data_kontak = [
    {
      'nama': 'Mutiara Amriani',
      'nomor_telepon': '098765432',
    },
    {
      'nama': 'John Doe',
      'nomor_telepon': '123456789',
    },
    {
      'nama': 'Jane Smith',
      'nomor_telepon': '987654321',
    },
    {
      'nama': 'Bob Johnson',
      'nomor_telepon': '555555555',
    },
    {
      'nama': 'Alice Brown',
      'nomor_telepon': '111111111',
    },
    {
      'nama': 'David Lee',
      'nomor_telepon': '999999999',
    },
    {
      'nama': 'Eva Wilson',
      'nomor_telepon': '777777777',
    },
    {
      'nama': 'Michael Davis',
      'nomor_telepon': '444444444',
    },
    {
      'nama': 'Olivia White',
      'nomor_telepon': '222222222',
    },
    {
      'nama': 'William Clark',
      'nomor_telepon': '666666666',
    },
  ];

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Scaffold(
        body: Scrollbar(
          child: ListView(
            padding: EdgeInsets.all(.0),
            children: [
              for (var kontak in data_kontak)
                Card(
                  elevation: 5.0,
                  child: ListTile(
                    leading: CircleAvatar(
                      radius: 24,
                      backgroundColor: Colors.green,
                      child: Text(
                        kontak['nama']![0], // Mengambil huruf pertama dari nama
                        style: TextStyle(color: Colors.white),
                      ),
                    ),
                    title: Text(kontak['nama']!),
                    subtitle: Text(kontak['nomor_telepon']!),
                  ),
                ),
            ],
          ),
        ),
      ),
    );
  }
}
