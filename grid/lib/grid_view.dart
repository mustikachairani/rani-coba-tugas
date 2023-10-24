import 'package:flutter/material.dart';
import 'package:grid/yes_view.dart';

void main() {
  runApp(MaterialApp(
    home: Scaffold(
      body: GridViewHal(),
    ),
  ));
}

class GridViewHal extends StatelessWidget {
  const GridViewHal({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return GridView.count(
      crossAxisCount: 2,
      mainAxisSpacing: 10,
      crossAxisSpacing: 10,
      padding: EdgeInsets.all(2),
      children: List.generate(8, (index) {
        // Menggunakan GestureDetector untuk menangani onTap
        return GestureDetector(
          onTap: () {
            showModalBottomSheet(
              shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.vertical(
                  top: Radius.circular(10),
                ),
              ),
              context: context,
              builder: (context) => Container(
                child: Center(
                  child: Column(
                    children: [
                      Image.network(
                        'https://picsum.photos/seed/picsum/536/354',
                      ),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                        children: [
                          ElevatedButton(
                              onPressed: () {
                                Navigator.push(
                                    context,
                                    MaterialPageRoute(
                                        builder: (context) => NewScreen()));
                              },
                              child: Text('yes')),
                          ElevatedButton(onPressed: () {}, child: Text('No'))
                        ],
                      ),
                    ],
                  ),
                ),
              ),
            );
          },
          child: Container(
            alignment: Alignment.center,
            // Container ini adalah wadah untuk gambar mini di GridView
            child: Image.network(
              'https://picsum.photos/seed/picsum/536/354',
            ),
          ),
        );
      }),
    );
  }
}
