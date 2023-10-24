import 'package:flutter/material.dart';

// Failed to launch Pixel_3a_API_33_x86_64: Error: Emulator didn't connect within 60 seconds
// flutter emulators --launch Pixel_3a_API_33_x86_64
void main() {
  runApp(const HelloWord());
}

class HelloWord extends StatelessWidget {
  const HelloWord({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
        // theme: ThemeData.dark(), // Mengatur tema gelap
        // initialRoute: 'home',
        // routes: {
        //   'home': (_) => HomePage(),
        // },
        home: Scaffold(
      appBar: AppBar(
        title: const Text('rani App'),
      ),
      body: Container(
        color: Colors.blueGrey,
        margin: const EdgeInsets.only(top: 30, left: 20, right: 20),
        child: Center(
            child: Column(
          children: [
            const Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Text('rani'),
                Text('rani'),
              ],
            ),
            const SizedBox(
              height: 60,
            ),
            const Text('List Anak Didik'),
            Expanded(
              child: ListView(
                padding: const EdgeInsets.all(8),
                children: const [
                  Text('ADE ALI INDRA'),
                  Text('ALWIN ZUHRIANDI MANALU'),
                  Text('ANISA YUNIARTI'),
                  Text('Bima Pangestu Nugraha'),
                  Text('Dastin Pranata Yuda'),
                  Text('David Christian Hui'),
                  Text('David Liem'),
                  Text('Delia Sepiana'),
                  Text('FAJRUL KAMAL'),
                  Text('GHAZI FARHANU DISASMORO'),
                 
                ],
              ),
            ),
            const SizedBox(
              height: 20,
            ),
            Expanded(
              child: GridView.count(
                crossAxisCount: 3,
                children: const [
                 
                  Text('HIDAYAH DANIAWATI'),
                  Text('JUHARMANSAH'),
                  Text('KATARINA ANDREA LAURENTIA'),
                  Text('MUHAMMAD AFRIZAL RASYID'),
                  Text('MUHAMMAD ARARYA HAFIZH ATHALLA'),
                  Text('MUHAMMAD ILHAM'),
                  Text('MUHAMMAD NGURAH ARYA PRATAMA'),
                  Text('MUSTIKA CHAIRANI'),
                  Text('NURMALASARI'),
                  Text('Phrimus Nufeto'),
                  Text('PUTRI DIANA HAFSYAWATI'),
                 
                ],
              ),
            )
          ],
        )),
      ),
    ));
  }
}

class HomePage extends StatelessWidget {
  const HomePage({super.key});

  @override
  Widget build(BuildContext context) {
    return const Scaffold(
      body: Column(
        children: [Text('ini merupakan menu home page')],
      ),
    );
  }
}