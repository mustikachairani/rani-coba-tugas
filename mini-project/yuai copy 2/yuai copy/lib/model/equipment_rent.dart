import 'package:flutter/material.dart';
import 'package:yuai/model/equipment_model.dart';

class EquipmentRent extends ChangeNotifier {
  final List<Equipment> _equipment = [
    //tenda
    Equipment(
      name: 'Tenda 2/3 orang',
      price: '25000',
      image: 'lib/images/tent_satu.jpg',
  
    ),

    Equipment(
      name: 'Cariel',
      price: '30000',
      image: 'lib/images/tent_satu.jpg',
     
    ),
    Equipment(
      name: 'CookingSet',
      price: '15000',
      image: 'lib/images/tent_satu.jpg',
   
    ),
    Equipment(
      name: 'Flaysheet',
      price: '20000',
      image: 'lib/images/tent_satu.jpg',
      
    ),
  ];

  //user cart
  List<Equipment> _userCart = [];

  // get equip list
  List<Equipment> get equipmentRent => _equipment;

  // get user cart
  List<Equipment> get userCart => _userCart;

  // add item to cart
  void addItemToCart(Equipment equipment) {
    _userCart.add(equipment);
    notifyListeners();
  }

  //remove item to cart
  void removeItemFromCart(Equipment equipment) {
    _userCart.remove(equipment);
    notifyListeners();
  }
}
