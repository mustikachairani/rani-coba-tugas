import 'package:flutter/material.dart';
import 'package:yuai/model/equipment_model.dart';

// Kelas EquipmentRent yang mengimplementasikan ChangeNotifier
class EquipmentRent extends ChangeNotifier {
  // Daftar peralatan yang dapat disewakan
  List<Map<String, dynamic>> _equipment = [];

  // Daftar barang yang ada di keranjang pengguna
  List<dynamic> _userCart = [];

  // Mendapatkan daftar peralatan yang dapat disewakan
  List<Map<String, dynamic>> get equipmentRent => _equipment;

  // Mendapatkan daftar barang yang ada di keranjang pengguna
  List<dynamic> get userCart => _userCart;

  // Fungsi untuk menambahkan item ke keranjang pengguna
  void addItemToCart(Map<String, dynamic> equipment) {
    _userCart.add(equipment);
    notifyListeners();
  }

  // Fungsi untuk menghapus item dari keranjang pengguna
  void removeItemFromCart(Map<String, dynamic> equipment) {
    _userCart.remove(equipment);
    notifyListeners();
  }

  // Fungsi untuk memperbarui daftar peralatan yang dapat disewakan
  void updateEquipmentList(List<Map<String, dynamic>> newData) {
    _equipment = newData;
    notifyListeners();
  }
}
