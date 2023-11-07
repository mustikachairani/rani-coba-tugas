import 'package:flutter/material.dart';
import 'package:yuai/model/equipment_model.dart';

class EquipmentRent extends ChangeNotifier {
  List<Map<String, dynamic>> _equipment = [];
  

  //API
  // List<Map<String, dynamic>> equipmentData = [];

  //user cart
  List<dynamic> _userCart = [];

  // get equip list
  List<Map<String, dynamic>> get equipmentRent => _equipment;

  // get user cart
  List<dynamic> get userCart => _userCart;

  // add item to cart
  void addItemToCart(Map<String, dynamic> equipment) {
    _userCart.add(equipment);
    notifyListeners();
  }

  //remove item to cart
  void removeItemFromCart(Map<String, dynamic> equipment) {
    _userCart.remove(equipment);
    notifyListeners();
  }

  void updateEquipmentList(List<Map<String, dynamic>> newData) {
    _equipment = newData;
    notifyListeners();
  }
}
