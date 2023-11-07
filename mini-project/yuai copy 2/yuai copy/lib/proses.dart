import 'package:flutter/material.dart';
import 'package:yuai/home.dart';

void main() {
  runApp(MaterialApp(
    home: Proses(),
  ));
}

class Proses extends StatelessWidget {
  const Proses({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Scaffold(
        appBar: AppBar(
          title: Center(child: Text('Informasi Pengantaran Barang')),
        ),
        body: Container(
          margin: EdgeInsets.all(5),
          // child: Column(
          //   children: [Text('Nama Penerima Barang'),
          //   Text('No Telepon Penerima'),
          //   Text('Alamat Penerima')],
          child: Center(
            child: Card(
              elevation: 5, // Tinggi shadow atau elevasi card
              child: Container(
                width: 1000,
                height: 1800,
                padding: EdgeInsets.all(50),
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    // Center(child: Text('Terimakasih telah meminjam', style: TextStyle(fontWeight: FontWeight.bold, fontSize: 20),)),

                    TextField(
                      decoration: InputDecoration(
                        labelText: 'Nama Penerima Barang',
                        border: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(
                              10.0), // Menambahkan border radius
                          borderSide: BorderSide(
                              color: Colors.blue), // Menentukan warna border
                        ),
                      ),
                    ),
                    SizedBox(
                      height: 10,
                    ),
                    TextField(
                      decoration: InputDecoration(
                        labelText: 'Alamat Pengantaran Barang',
                        border: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(
                              10.0), // Menambahkan border radius
                          borderSide: BorderSide(
                              color: Colors.blue), // Menentukan warna border
                        ),
                      ),
                      maxLines: 3,
                    ),
                    SizedBox(
                      height: 10,
                    ),

                    TextField(
                      decoration: InputDecoration(
                        labelText: 'Nomor Telepon Penerima',
                        prefixText: '+62 ',
                        suffixIcon: Icon(Icons.phone),
                        border: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(
                              10.0), // Menambahkan border radius
                          borderSide: BorderSide(
                              color: Colors.blue,
                              width: 2.0), // Menentukan warna dan lebar border
                        ),
                      ),
                    ),
                    SizedBox(
                      height: 20,
                    ),

                    // TextField(
                    //   decoration: InputDecoration(
                    //     labelStyle: TextStyle(
                    //       color: Colors.blue, // Warna teks label
                    //     ),
                    //     fillColor: Color.fromARGB(255, 220, 220, 220),
                    //     filled: true,
                    //     enabledBorder: OutlineInputBorder(
                    //       borderSide: BorderSide(
                    //         color: Colors
                    //             .blue, // Warna garis tepi saat dalam keadaan normal
                    //       ),
                    //     ),
                    //     focusedBorder: OutlineInputBorder(
                    //       borderSide: BorderSide(
                    //         color: Colors
                    //             .green, // Warna garis tepi saat dalam keadaan fokus
                    //       ),
                    //     ),
                    //   ),
                    // ),
                    // TextField(
                    //   decoration: InputDecoration(
                    //     labelText: 'Username',
                    //     filled: true,
                    //     fillColor: Color.fromARGB(
                    //         255, 220, 220, 220), // Warna latar belakang
                    //     border: OutlineInputBorder(
                    //       borderSide: BorderSide(
                    //         color: Colors.blue, // Warna outline atau border
                    //       ),
                    //       borderRadius: BorderRadius.all(
                    //         Radius.circular(10.0),
                    //       ),
                    //     ),
                    //   ),
                    // ),
                    // SizedBox(height: 8),
                    // TextField(
                    //   decoration: InputDecoration(
                    //     labelText: 'Deskripsi',
                    //   ),
                    //   maxLines: 3,
                    // ),
                    // TextField(
                    //   decoration: InputDecoration(
                    //     labelText: 'Nomor Telepon',
                    //     prefixText: '+62 ', // Menambahkan teks sebelum input
                    //     suffixIcon:
                    //         Icon(Icons.phone), // Menambahkan ikon setelah input
                    //   ),
                    // ),
                    // Text('Deskripsi singkat card'),
                    // SizedBox(height: 8),
                    // ElevatedButton(
                    //   onPressed: () {
                    //     Text('aku');
                    //   },
                    //   child: Text('Tampilkan Dialog'),
                    // ),
                    ElevatedButton(
                      onPressed: () {
                        _showThankYouDialog(context);
                      },
                      child: Center(
                        child: Text(
                          'Simpan',
                          style: TextStyle(fontWeight: FontWeight.bold),
                        ),
                      ),
                    ),
                  ],
                ),
              ),
            ),
          ),
        ),
      ),
    );
  }

  void _showThankYouDialog(BuildContext context) {
    showDialog(
        context: context,
        builder: (BuildContext context) {
          return AlertDialog(
            title: Text('Data telah disimpan'),
            content: Text('Data telah disimpan.'),
            actions: [
              TextButton(
                onPressed: () {
                  Navigator.push(
                    context,
                    MaterialPageRoute(
                      builder: (context) => HomePage(),
                    ),
                  ); // Menutup dialog saat tombol "OK" ditekan
                },
                child: Text('OK'),
              ),
            ],
          );
        });
  }
}
