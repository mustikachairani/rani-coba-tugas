import 'package:flutter/material.dart';
import 'package:muchson/main.dart';
import 'package:muchson/view/screen/detail_image.dart';
import 'package:muchson/view/widget/navigation_drawer.dart';

class Galeri extends StatelessWidget {
  const Galeri({super.key});

  @override
  Widget build(BuildContext context) {
    // Mendapatkan warna primer dari tema
    final primaryColor = Theme.of(context).primaryColor;
    return Scaffold(
      drawer: NavigationDrawerMuchson(),
      appBar: AppBar(
        title: Text('Galeri Screen'),
        backgroundColor: primaryColor,
      ),
      body: Container(
        padding: EdgeInsets.all(20),
        child: SingleChildScrollView(
          child: Column(
            children: [
              Text('Images dengan File'),
              // widget apa yang harus kita masukkan sehingga gambar dapat di tekan ?
              // inkwell
              // gesture
              InkWell(
                  onTap: () {
                    showModalBottomSheet(
                        context: context,
                        builder: (BuildContext context) {
                          return Container(
                            margin: EdgeInsets.all(10),
                            child: Column(
                              children: [
                                Image(
                                    image: AssetImage(
                                        'assets/kampus_merdeka.jpeg')),
                                ElevatedButton(
                                    onPressed: () {
                                      Navigator.push<void>(
                                        context,
                                        MaterialPageRoute<void>(
                                          builder: (BuildContext context) =>
                                              DetailImage(),
                                        ),
                                      );
                                      print('ya');
                                      //logic iya masuyk
                                    },
                                    child: Text('ya'))
                              ],
                            ),
                          );
                        });
                    print('gambar di tekan');
                  },
                  child:
                      Image(image: AssetImage('assets/kampus_merdeka.jpeg'))),
              Image(image: AssetImage('assets/images/cabinets.png')),
            ],
          ),
        ),
      ),
    );
  }
}