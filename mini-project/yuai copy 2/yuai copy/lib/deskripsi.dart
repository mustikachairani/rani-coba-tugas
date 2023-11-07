import 'package:flutter/material.dart';
import 'package:yuai/proses.dart';

import 'home.dart';

void main() {
  runApp(const Description());
}

class Description extends StatelessWidget {
  const Description({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
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
        body: Container(
          margin: EdgeInsets.all(10),
          child: Container(
            margin: EdgeInsets.all(20),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                // Judul Produk
                Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: Text(
                    'Nama Produk',
                    style: TextStyle(
                      fontSize: 20,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                ),
                // Gambar Produk
                Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: Image.network(
                    'https://th.bing.com/th/id/OIP.426mgihczZFEVORGLAO28gHaLH?w=179&h=268&c=7&r=0&o=5&pid=1.7', // Ganti dengan URL gambar yang sesuai
                    width: 200,
                    height: 200,
                    fit: BoxFit.cover,
                  ),
                ),
                // Deskripsi Produk
                Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: Text(
                    'Deskripsi Produk yang panjang dan menjelaskan produk secara detail.',
                    style: TextStyle(fontSize: 16),
                  ),
                ),
                Spacer(),
                Align(
                  alignment: Alignment.center,
                  child: Padding(
                    padding: const EdgeInsets.only(bottom: 100.0),
                    child: ElevatedButton(
                      onPressed: () {
                        Navigator.push(
                          context,
                          MaterialPageRoute(
                            builder: (context) => Proses(),
                          ),
                        );
                      },
                      child: Text('Pesan Sekarang'),
                    ),
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
