import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:yuai/model/equipment_model.dart';
import 'package:yuai/model/equipment_rent_model.dart';
import 'package:yuai/widget/equipment_tile.dart';

import 'payment_view.dart';

// Widget untuk menampilkan halaman keranjang belanja
class CartPage extends StatefulWidget {
  const CartPage({super.key});

  @override
  State<CartPage> createState() => _CartPageState();
}

class _CartPageState extends State<CartPage> {
  // Fungsi untuk menghapus item dari keranjang belanja
  void removeFromCart(Map<String, dynamic> equipment) {
    Provider.of<EquipmentRent>(context, listen: false)
        .removeItemFromCart(equipment);
  }

  // Fungsi untuk navigasi ke halaman pembayaran
  void navigateToPaymentPage() {
    Navigator.push(
      context,
      MaterialPageRoute(
          builder: (context) =>
              PaymentPage()), // Replace PaymentPage with the actual page you want to navigate to
    );
  }

  @override
  Widget build(BuildContext context) {
    // Gunakan Consumer untuk mendengarkan perubahan dalam state EquipmentRent
    return Consumer<EquipmentRent>(
      builder: ((context, value, child) => SafeArea(
            child: Padding(
              padding: const EdgeInsets.all(20.0),
              child: Column(
                children: [
                  //heading
                  Text(
                    'Your Cart',
                    style: TextStyle(fontSize: 20),
                  ),

                  SizedBox(
                    height: 25,
                  ),

                  //List of carts item
                  Expanded(
                    child: ListView.builder(
                      itemCount: value.userCart.length,
                      itemBuilder: (context, index) {
                        //get individual cart items
                        Map<String, dynamic> eachEquipment =
                            value.userCart[index];

                        // return Equipment Tile
                        return EquipmentTile(
                            equipment: eachEquipment,
                            onPressed: () => removeFromCart(eachEquipment),
                            icon: Icon(Icons.delete));
                      },
                    ),
                  ),

                  //pay button
                  GestureDetector(
                    onTap: () => navigateToPaymentPage(),
                    child: Container(
                      padding: EdgeInsets.all(25),
                      width: double.infinity,
                      child: Center(
                        child: Text(
                          "Pay Now",
                          style: TextStyle(color: Colors.white),
                        ),
                      ),
                      decoration: BoxDecoration(
                        color: Colors.blueGrey[900],
                        borderRadius: BorderRadius.circular(12),
                      ),
                    ),
                  )
                ],
              ),
            ),
          )),
    );
  }
}
