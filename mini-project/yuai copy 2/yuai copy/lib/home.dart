import 'package:flutter/material.dart';
import 'package:yuai/deskripsi.dart';



void main() {
  runApp(const HomePage());
}

class HomePage extends StatelessWidget {
  const HomePage({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: Scaffold(
        appBar: AppBar(
          title: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text('EcoRent'),
              SizedBox(
                height: 5,
              ),
              Text(
                'RENTAL PERLENGKAPAN OUTDOOR',
                style: TextStyle(fontSize: 8),
              )
            ],
          ),
          actions: [
            IconButton(
              onPressed: () {},
              icon: Icon(Icons.exit_to_app),
            ),
          ],
        ),
        body: Container(
          margin: EdgeInsets.all(10),
          child: GridView.builder(
            gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
              crossAxisCount: 2, // Jumlah kolom dalam grid
              crossAxisSpacing: 10.0, // Jarak antar kolom
              mainAxisSpacing: 10.0, // Jarak antar baris
            ),
            itemCount: 6, // Jumlah item dalam grid
            itemBuilder: (BuildContext context, int index) {
              return InkWell(
                onTap: () {
                  // Action ketika item di-tap
                  Navigator.push(
                    context,
                    MaterialPageRoute(
                      builder: (context) => Description(),
                    ),
                  );
                },
                child: Container(
                  color: Colors.blue,
                  child: Center(
                    child: Text(
                      'Item $index',
                      style: TextStyle(color: Colors.white),
                    ),
                  ),
                ),
              );
            },
          ),
        ),
        bottomNavigationBar: BottomNavigationBar(
          onTap: (int index) {},
          items: [
            BottomNavigationBarItem(
              icon: Icon(Icons.home),
              label: 'Home',
            ),
            BottomNavigationBarItem(
              icon: Icon(Icons.shopping_cart),
              label: 'Pinjaman',
            ),
           
          ],
        ),
      ),
    );
  }
}
