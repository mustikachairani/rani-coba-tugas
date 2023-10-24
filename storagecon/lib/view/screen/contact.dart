

import 'package:flutter/material.dart';
import 'package:muchson/view/widget/navigation_drawer.dart';

class Contact extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      drawer: NavigationDrawerMuchson(),
      appBar: AppBar(
        title: Text('Contact'),
      ),
      body: Center(
        child: Text(
          'Ini adalah Contact',
          style: TextStyle(fontSize: 24),
        ),
      ),
    );
  }
}