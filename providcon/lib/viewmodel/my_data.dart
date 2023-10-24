import 'package:flutter/material.dart';

import '../model/my_data.dart';

class MyDataProvider extends ChangeNotifier {
  MyData _myData = MyData(data: 'Data Awal1111');
  List listUser = [];
  MyData get myData => _myData;

  // method
  void updateData(String newData) {
    print("new Data dari provider = $newData");
    _myData = MyData(data: newData);
    notifyListeners();
  }

  // method data
  void insertData(String newData) {
    //logic untuk mengubah data awal yang ada, di dapatkan dari form yang telah dibuat.
    listUser.add(newData);
    notifyListeners();
  }
}
