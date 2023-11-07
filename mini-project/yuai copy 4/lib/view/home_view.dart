// lib/views/home_view.dart
import 'package:flutter/material.dart';
import 'package:hive_flutter/hive_flutter.dart';
import 'package:yuai/model/equipment_model.dart';
import 'package:yuai/widget/bottom_nav_bar.dart';
import 'package:yuai/widget/equipment_tile.dart';

import 'cart_view.dart';
import 'chatbot_view.dart';
import 'detail_view.dart';
import 'equipment_view.dart';

class HomeView extends StatefulWidget {
  @override
  State<HomeView> createState() => _HomeViewState();
}

class _HomeViewState extends State<HomeView> {
  //reference the hive box
  final _myBox = Hive.openBox('mybox');

  // navigate bottom bar
  int _selectedIndex = 0;

  void navigateBottomBar(int index) {
    setState(() {
      _selectedIndex = index;
    });
  }

  // pages
  final List<Widget> _pages = [
    //shop page
    EquipmentPage(),
    //cart page
    CartPage(),

    //chatbot page
    ChatBotPage()
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.grey[300],
      bottomNavigationBar:
          MyBottomNavbar(onTabChange: (index) => navigateBottomBar(index)),
      appBar: AppBar(
        backgroundColor: Colors.transparent,
        elevation: 0,
        leading: Builder(
          builder: (context) => IconButton(
            onPressed: () {
              Scaffold.of(context).openDrawer();
            },
            icon: Padding(
              padding: EdgeInsets.only(left: 12.0),
              child: Icon(
                Icons.menu,
                color: Colors.black,
              ),
            ),
          ),
        ),
      ),
      drawer: Drawer(
        backgroundColor: Colors.blueGrey,
        child: Column(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Column(
              children: [
                //logo
                DrawerHeader(
                  child: Image.asset(
                    'lib/images/tent.png',
                  ),
                ),

                //otherpage
                // home
                Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 25.0),
                  child: Divider(
                    color: Colors.grey[800],
                  ),
                ),

                Padding(
                  padding: const EdgeInsets.only(left: 25),
                  child: ListTile(
                    leading: Icon(
                      Icons.home,
                      color: Colors.white,
                    ),
                    title: Text(
                      'Home',
                      style: TextStyle(
                        color: Colors.white,
                      ),
                    ),
                  ),
                ),

                //otherpage
                // profile

                Padding(
                  padding: const EdgeInsets.only(left: 25),
                  child: ListTile(
                    leading: Icon(
                      Icons.person,
                      color: Colors.white,
                    ),
                    title: Text(
                      'Profile',
                      style: TextStyle(
                        color: Colors.white,
                      ),
                    ),
                  ),
                ),

                //otherpage
                // logout
              ],
            ),
            Padding(
              padding: const EdgeInsets.only(left: 25, bottom: 25),
              child: ListTile(
                leading: Icon(
                  Icons.logout,
                  color: Colors.white,
                ),
                title: Text(
                  'Logout',
                  style: TextStyle(
                    color: Colors.white,
                  ),
                ),
              ),
            ),
          ],
        ),
      ),
      body: _pages[_selectedIndex],

      // body: Column(
      //   crossAxisAlignment: CrossAxisAlignment.start,
      //   children: [
      //     Padding(
      //       padding: EdgeInsets.symmetric(horizontal: 25.0),
      //       child: Text(
      //         "Equipment List",
      //         style: TextStyle(
      //           fontWeight: FontWeight.bold,
      //           color: Colors.grey[800],
      //           fontSize: 18,
      //         ),
      //       ),
      //     ),
      //     SizedBox(
      //       height: 10,
      //     ),
      //     Expanded(
      //       child: ListView.builder(
      //         itemCount: 2,
      //         scrollDirection: Axis.horizontal,
      //         itemBuilder: (context, index) => EquipmentTile(
      //           equipment: equipmentList[index],
      //         ),
      //       ),
      //     ),
      //   ],
      // ),

      //============================
      // List equipmentList = [
      //   Equipment(
      //     name: "Tenda Kapasitas 2/3",
      //     price: "25.000",
      //     image: "lib/images/tent_satu.jpg",
      //     rating: "4.9",
      //   ),
      //   Equipment(
      //     name: "Flysheat 2x3",
      //     price: "12.000",
      //     image: "lib/images/fly_satu.jpeg",
      //     rating: "4.9",
      //   )
      // ];
    );
  }
}
