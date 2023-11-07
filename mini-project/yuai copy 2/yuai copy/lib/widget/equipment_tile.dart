import 'package:flutter/material.dart';
import 'package:yuai/model/equipment_model.dart';

class EquipmentTile extends StatelessWidget {
  final Equipment equipment;
  const EquipmentTile({
    super.key,
    required this.equipment,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
          color: Colors.grey[200], borderRadius: BorderRadius.circular(12)),
      margin: EdgeInsetsDirectional.only(bottom: 10, start: 25, end: 25),
      padding: EdgeInsets.symmetric(vertical: 25, horizontal: 10),
      child: ListTile(
        title: Text(equipment.name),
        subtitle: Text(equipment.price),
        leading: Image.asset(equipment.image),
      ),
    );
  }
}
