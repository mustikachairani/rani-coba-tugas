import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:provider/provider.dart';
import 'package:yuai/model/equipment_model.dart';
import 'package:yuai/model/equipment_rent.dart';
import 'package:yuai/widget/equipment_tile.dart';

class EquipmentPage extends StatefulWidget {
  const EquipmentPage({super.key});

  @override
  State<EquipmentPage> createState() => _EquipmentPageState();
}

class _EquipmentPageState extends State<EquipmentPage> {
  // add equipmentrent to cart
  void addToCart(Equipment equipment) {
    Provider.of<EquipmentRent>(context, listen: false).addItemToCart(equipment);

    //let user know it add been succesfully added
    showDialog(
      context: context,
      builder: (context) => const AlertDialog(
        title: Text(
          "Barang telah berhasil masuk Keranjang",
        ),
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Consumer<EquipmentRent>(
      builder: (context, value, child) => Column(
        children: [
          Container(
            padding: EdgeInsets.all(12),
            margin: EdgeInsets.symmetric(horizontal: 25),
            decoration: BoxDecoration(
                color: Colors.grey[200],
                borderRadius: BorderRadius.circular(8)),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Text(
                  'Search',
                  style: TextStyle(color: Colors.grey),
                ),
                Icon(
                  Icons.search,
                  color: Colors.grey,
                ),
              ],
            ),
          ),

          SizedBox(
            height: 10,
          ),

          //list
          Expanded(
            child: ListView.builder(
                itemCount: value.equipmentRent.length,
                itemBuilder: (context, index) {
                  //get individual equipment
                  Equipment eachEquipment = value.equipmentRent[index];

                  // return the tile for this equipment
                  return EquipmentTile(
                    equipment: eachEquipment,
                    icon: Icon(Icons.add),
                    onPressed: () => addToCart(eachEquipment),
                  );
                }),
          ),
        ],
      ),
    );
  }
}
