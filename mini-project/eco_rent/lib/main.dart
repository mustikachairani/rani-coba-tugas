
import 'package:eco_rent/view_models/login_view_model.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import 'view_models/catalog_view_model/equipment_list_view_model.dart';
import 'views/login/login_view.dart';


void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {

  @override
  Widget build(BuildContext context) {
    return MultiProvider(providers: [
      ChangeNotifierProvider(create: (context) => LoginViewModel(),),
      ChangeNotifierProvider(create: (context) => EquipmentViewModel(),),
      
    ],
    child: MaterialApp(
      debugShowCheckedModeBanner: false,
      home: Login(),
    ),
    );
  }
}