import 'package:flutter/material.dart';
import 'package:google_nav_bar/google_nav_bar.dart';

class MyBottomNavbar extends StatelessWidget {
  void Function(int)? onTabChange ;
   MyBottomNavbar({super.key,required this.onTabChange});

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: EdgeInsets.all(25),
      child: GNav(
        onTabChange: (value) => onTabChange!(value) ,
          color: Colors.blue,
          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
          activeColor: Colors.white,
          tabBackgroundColor: Colors.blueGrey,
          tabBorderRadius: 24,
          tabActiveBorder: Border.all(color: Colors.white),
          tabs: [
            GButton(
              icon: Icons.home_outlined,
              text: 'Home',
            ),
            GButton(
              icon: Icons.shopping_bag_outlined,
              text: 'Cart',
            ),
            GButton(
              icon: Icons.chat_outlined,
              text: 'ChatBot',
            ),
          ]),
    );
  }
}



