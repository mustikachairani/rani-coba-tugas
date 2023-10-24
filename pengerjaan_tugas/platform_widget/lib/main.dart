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
          title: Text('Material App'),
          backgroundColor: Colors.black54,
        ),
        drawer: Drawer(
          backgroundColor: Colors.black87,
          child: ListView(
            padding: EdgeInsets.zero,
            children: [
              Container(
                color: Colors.black87,
                child: ListTile(
                  title: Text('Home', style: TextStyle(color: Colors.white)),
                  onTap: () {
                    Navigator.pop(context);
                  },
                    ),
              ),
                Container(
                color: Colors.black87,
                child: ListTile(
                  title: Text('Setting', style: TextStyle(color: Colors.white)),
                  onTap: () {
                    Navigator.pop(context);
                  },
                    ),
              ),

              // ListTile(
              //   title: Text('Business', style: TextStyle(color: Colors.white)),
              // ),
              // ListTile(
              //   title: Text('School', style: TextStyle(color: Colors.white)),
              // ),
            ],
            // children: [
            //   DrawerHeader(
            //     decoration: BoxDecoration(
            //       color: Colors.pink,
            //     ),
            //     child: Text('Drawer Header'),
            //   ),
            //   ListTile(
            //     title: Text('Home'),
            //     onTap: () {
            //       Navigator.pop(context);
            //     },
            //   ),
            //   ListTile(
            //     title: Text('Business'),
                
            //   ),
            //   ListTile(
            //     title: Text('School'),
            //   ),
            // ],
          ),
        ),
        body: Center(child: Text("This is Material App",
        style: TextStyle(
          color: Colors.white,
        ),)),
        backgroundColor: Colors.black87,
        bottomNavigationBar: BottomNavigationBar(
          backgroundColor: Colors.black87,
          selectedItemColor: Colors.blue[700],
          unselectedItemColor: Colors.white,
          items: [
            BottomNavigationBarItem(icon: Icon(Icons.home), label: 'Home'),
            BottomNavigationBarItem(
                icon: Icon(Icons.settings), label: 'Settings'),
          ],
        ),
      ),
    );
  }
}
