import 'package:hive_flutter/hive_flutter.dart';

class EquipmentDatabase {
  List Equipment = [];

  //reference the box
  final _myBox = Hive.openBox('myBox');
}
