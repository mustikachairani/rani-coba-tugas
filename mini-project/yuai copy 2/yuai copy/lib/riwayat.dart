import 'package:flutter/material.dart';

import 'home.dart';

void main() {
  runApp(const Riwayat());
}

class Riwayat extends StatefulWidget {
  const Riwayat({super.key});

  @override
  State<Riwayat> createState() => _RiwayatState();
}

class _RiwayatState extends State<Riwayat> {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Scaffold(
        appBar: AppBar(
          title: Text('Deskripsi Peminjaman Barang'),
          centerTitle: true,
          // actions: [IconButton(onPressed: (){}, icon: Icon(Icons.arrow_back_rounded))],
          leading: IconButton(
            icon: Icon(Icons.arrow_back_rounded), // Ikon di sebelah kiri
            onPressed: () {
              Navigator.push(
                context,
                MaterialPageRoute(
                  builder: (context) =>
                      HomePage(), // Ganti dengan halaman home yang sesuai
                ),
              );

              // Tindakan yang diambil saat ikon ditekan
              // Misalnya, buka menu navigasi
            },
          ),
        ),
        body: SingleChildScrollView(
          child: Container(
            child: Center(
              child: Padding(
                padding: const EdgeInsets.all(8.0),
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                  children: <Widget>[
                    const Card(
                        elevation: 24,
                        shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.only(
                            topLeft: Radius.circular(5.0),
                            topRight: Radius.circular(5.0),
                            bottomLeft: Radius.circular(5.0),
                            bottomRight: Radius.circular(5.0),
                          ),
                        ),
                        child: Column(
                          children: [
                            ListTile(
                              tileColor: Colors.blue,
                              leading: Icon(Icons.album),
                              title: Text('Sample Card 4'),
                              subtitle: Text('Elevation - 24'),
                            ),
                            ListTile(
                              leading: Icon(Icons.album),
                              title: Text('Sample Card 4'),
                              subtitle: Text('Elevation - 24'),
                            ),
                          ],
                        )),
                  ],
                ),
              ),
            ),
          ),
        ),
      ),
    );
  }
}
